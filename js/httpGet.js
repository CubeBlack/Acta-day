function httpGet(theUrl)
{
    var contentType = "application/x-www-form-urlencoded; charset=utf-8";
    var xmlHttp = new XMLHttpRequest();
    xmlHttp.open( "GET", theUrl, false ); // false for synchronous request
    xmlHttp.setRequestHeader('Content-type', contentType);
    xmlHttp.send( null );
    return xmlHttp.responseText;
}
