using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data .SqlClient;
using System.ComponentModel;
using System.Collections;
using System.Diagnostics;



public class DataSql : IDisposable
{
    public string SqlBase = ConfigurationManager.AppSettings["connectionString"];
    

    public DataTable DisPlay_DT(string sql, SqlConnection conn)
    {
        DataTable Dt = new DataTable();
        SqlDataAdapter ShowAdapter = new SqlDataAdapter(sql ,conn);
        ShowAdapter.Fill(Dt);
        conn.Close();
        return Dt;
    }

    public DataTable DisPlayList_Ds(string sql, SqlConnection conn)
    {
        DataTable Dt = new DataTable();
        SqlDataAdapter ShowAdapter = new SqlDataAdapter(sql ,conn);
        ShowAdapter.Fill(Dt);
        conn.Close();
        return Dt;        
    }

    public int AddInfo(string sql, SqlConnection conn,SqlParameter[] paras)
    {
        int State;
        try
        {
            SqlCommand AddInfoCmd = new SqlCommand(sql,conn);
            AddInfoCmd.Parameters.AddRange(paras);
            AddInfoCmd.ExecuteNonQuery();
            conn.Close();
            State = 1;
            
        }
        catch
        {
            State = 0;
            conn.Close();
        }
        return State;
    }

    public int DeleteInfo(string sql, SqlConnection conn)
    {
        int State;
        try
        {
            SqlCommand DeleteInfoCmd = new SqlCommand(sql,conn);
            DeleteInfoCmd.ExecuteNonQuery();
            
            State = 1;
            conn.Close();
        }
        catch
        {
            State = 0;
            conn.Close();
        }
        return State;
    }

    public int ModInfo(string sql, SqlConnection conn)
    {
        int State;
        try
        {
            SqlCommand ModInfoCmd = new SqlCommand(sql, conn);
            ModInfoCmd.ExecuteNonQuery();
            conn.Close();
            State = 1;
        }
        catch
        {
            State = 0;
            conn.Close();
        }
        return State;
    }
    protected SqlConnection Connection;

    protected String ConnectionString;

    public DataSql()
    {
        ConnectionString = ConfigurationManager.AppSettings["connectionString"];
    }

   
    ~DataSql()
    {
        
    }

   
    protected void Open()
    {
        if (Connection == null)
        {
            try
            {
                Connection = new SqlConnection(ConnectionString);
            }
            catch (Exception e)
            {
                
            }
        }
        if (Connection.State.Equals(ConnectionState.Closed))
        {
            try
            {
                Connection.Open();
            }
            catch (Exception e)
            {
               
            }
        }
    }

   
    public void Close()
    {
        try
        {
            if (Connection != null)
                Connection.Close();
        }
        catch (Exception e)
        {
           
        }
    }

   
    public void Dispose()
    {
        
        try
        {
            if (Connection != null)
            {
                Connection.Dispose();
                Connection = null;
            }
        }
        catch (Exception e)
        {
            
        }
    }

   
    public SqlDataReader GetDataReader(String SqlString)
    {
        Open();
        try
        {
            SqlCommand cmd = new SqlCommand(SqlString, Connection);
            return cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
        }
        catch (Exception e)
        {
           
            return null;
        }
    }

    
    public DataSet GetDataSet(String SqlString)
    {
        DataSet dataset = new DataSet();
        Open();
        try
        {
            SqlDataAdapter adapter = new SqlDataAdapter(SqlString, Connection);
            adapter.Fill(dataset);
        }
        catch (Exception e)
        {
           
        }
        finally
        {
            Close();
        }
        return dataset;
    }

    
    public DataTable GetDataTable(String SqlString)
    {
        DataSet dataset = GetDataSet(SqlString);
        dataset.CaseSensitive = false;
        return dataset.Tables[0];
    }

    
    public DataRow GetDataRow(String SqlString)
    {
        DataSet dataset = GetDataSet(SqlString);
        dataset.CaseSensitive = false;
        if (dataset.Tables[0].Rows.Count > 0)
        {
            return dataset.Tables[0].Rows[0];
        }
        else
        {
            return null;
        }
    }

    
    public int ExecuteSQL(String SqlString)
    {
        int count = -1;
        Open();
        try
        {
            SqlCommand cmd = new SqlCommand(SqlString, Connection);
            count = cmd.ExecuteNonQuery();
        }
        catch (Exception e)
        {
            
            count = -1;
        }
        finally
        {
            Close();
        }
        return count;
    }

    
    public bool ExecuteSQL(String[] SqlStrings)
    {
        bool success = true;
        Open();
        SqlCommand cmd = new SqlCommand();
        SqlTransaction trans = Connection.BeginTransaction();
        cmd.Connection = Connection;
        cmd.Transaction = trans;

        int i = 0;
        try
        {
            foreach (String str in SqlStrings)
            {
                cmd.CommandText = str;
                cmd.ExecuteNonQuery();
                i++;
            }
            trans.Commit();
        }
        catch (Exception e)
        {
           
            success = false;
            trans.Rollback();
        }
        finally
        {
            Close();
        }
        return success;
    }

    
    public bool Insert(String TableName, Hashtable Cols)
    {
        int Count = 0;

        if (Cols.Count <= 0)
        {
            return true;
        }

        String Fields = " (";
        String Values = " Values(";
        foreach (DictionaryEntry item in Cols)
        {
            if (Count != 0)
            {
                Fields += ",";
                Values += ",";
            }
            Fields += "[" + item.Key.ToString() + "]";
            Values += "'"+item.Value.ToString()+"'";
            Count++;
        }
        Fields += ")";
        Values += ")";

        String SqlString = "Insert into " + TableName + Fields + Values;

        String[] Sqls = { SqlString };
        return ExecuteSQL(Sqls);
    }


    
    public bool Update(String TableName, Hashtable Cols, String Where)
    {
        int Count = 0;
        if (Cols.Count <= 0)
        {
            return true;
        }
        String Fields = " ";
        foreach (DictionaryEntry item in Cols)
        {
            if (Count != 0)
            {
                Fields += ",";
            }
            Fields += "[" + item.Key.ToString() + "]";
            Fields += "=";
            Fields =Fields+"'"+ item.Value.ToString()+"'";
            Count++;
        }
        Fields += " ";

        String SqlString = "Update " + TableName + " Set " + Fields + Where;

        String[] Sqls = { SqlString };
        return ExecuteSQL(Sqls);
    }

  
    
    private SqlCommand CreateCommand(string ProcName, SqlParameter[] Parms)
    {
        Open();
        SqlCommand Cmd = new SqlCommand(ProcName, Connection);
        Cmd.CommandType = CommandType.StoredProcedure;
        if(Parms!=null)
        {
            foreach (SqlParameter Parameter in Parms)
                Cmd.Parameters.Add(Parameter);
        }
        return Cmd;
    }

    public SqlParameter MakeParam(string ParamName, SqlDbType DbType, Int32 Size, ParameterDirection Direction, object Value)
    {
        SqlParameter Param;
        if (Size > 0)
            Param = new SqlParameter(ParamName, DbType, Size);
        else
            Param = new SqlParameter(ParamName,DbType);
        Param.Direction = Direction;
        if (Value != null)
            Param.Value = Value;
        return Param;
    }

    public SqlParameter MakeInParam(string ParamName,SqlDbType DbType,int Size,object Value)
    {
        return MakeParam(ParamName, DbType, Size, ParameterDirection.Input, Value);  
    }

    public int RunProc(string ProcName)
    {
        int Count = -1;
        SqlCommand Cmd = CreateCommand(ProcName,null);
        Count = Cmd.ExecuteNonQuery();
        Close();
        return Count;
    }
    
    public int RunProc(string ProcName,SqlParameter[] Params)
    {
        int Count = -1;
        SqlCommand Cmd = CreateCommand(ProcName, Params);
        Count = Cmd.ExecuteNonQuery();
        Close();
        return Count;
    }

    public SqlDataReader RunProcGetReader(string ProcName, SqlParameter[] Params)
    {
        SqlCommand Cmd = CreateCommand(ProcName, Params);
        return Cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
    }
    
    public SqlDataReader RunProcGetReader(string ProcName)
    {
        SqlCommand Cmd = CreateCommand(ProcName, null);
        return Cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
    }

    public int RunProcGetCount(string ProcName, SqlParameter[] Params)
    {
        SqlCommand Cmd = CreateCommand(ProcName,Params);
        string SCount;
        SCount = Cmd.ExecuteScalar().ToString().Trim();
        if (SCount == "")
            SCount = "0";
        Close();
        return Convert.ToInt32(SCount);
    }

    public DataTable GetDataTable(string ProcName, SqlParameter[] Params)
    {
        Open();
        SqlCommand Cmd = CreateCommand(ProcName, Params);
        SqlDataAdapter adapter = new SqlDataAdapter(Cmd);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        Close();
        return ds.Tables[0];
    }
}
