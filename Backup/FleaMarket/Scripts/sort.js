var xmlHttp;

function createXMLHttpRequest() {
    if (window.ActiveXObject) {
        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    else if (window.XMLHttpRequest) {
        xmlHttp = new XMLHttpRequest();
    }
}

function refreshModelList() {
    var first = document.getElementById("FKind").value;

    if (first == "") {
        clearModelsList();
        return;
    }

    var url = "user/ajax.aspx?" + createQueryString(first) + "&ts=" + new Date().getTime();

    createXMLHttpRequest();
    xmlHttp.onreadystatechange = handleStateChange;
    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);
}

function createQueryString(first) {
    var queryString = "first=" + first;
    return queryString;
}

function handleStateChange() {
    if (xmlHttp.readyState == 4) {
        if (xmlHttp.status == 200) {
            updateModelsList();
        }
    }
}

function updateModelsList() {
    clearModelsList();
    debugger;
    var second = document.getElementById("SKind");
    var results = xmlHttp.responseXML.getElementsByTagName("second");
    var option = null;
    for (var i = 0; i < results.length; i++) {
        option = document.createElement("option");
        option.appendChild(document.createTextNode(results[i].firstChild.nodeValue));
        second.appendChild(option);
    }
}

function clearModelsList() {
    var second = document.getElementById("SKind");
    while (second.childNodes.length > 0) {
        second.removeChild(second.childNodes[0]);
    }
}