
var request;
function getRequest()
{
	if(window.ActiveXObject){
	
	return(new ActiveXObject("Microsoft.XMLHTTP"));
		} 
		else if (window.XMLHttpRequest) {
		return(new XMLHttpRequest());
		}
		 else {
		return(null);
		}
	}

function getMaterialDetails(name)
{
	var url="http://localhost:8080/CodePassion_BL1/check?empsa="+name;
	
	request=getRequest();
	request.onreadystatechange=handleResponse;
	request.open("GET",url,true);
	request.send(null);
}
	function handleResponse() {
		if ((request.readyState == 4) && (request.status == 200)) {
			var response = request.responseText
			var responcearray = response.split(",");
			var bottombox=parent.frames['viewer'].document;
			bottombox.open();
			bottombox.write("<i>Employee Average:"+responcearray[1]+"<hr align=\"left\" width=\"250\" />Supervisor Average:"+responcearray[2]+"<hr width=\"250\" align=\"left\"  />Review Manager Average:"+responcearray[3]+"</i>");
			bottombox.close();
			
			}

}