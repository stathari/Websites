
function clicker(id1)
{

		var i=0;
	var j=0;
	var name=new Array();
	var colorarr=new Array();
		colorarr[0]='red';
		colorarr[1]='red';
		colorarr[2]='red';
		colorarr[3]='red';
		colorarr[4]='yellow';
		colorarr[5]='yellow';
		colorarr[6]='yellow';
		colorarr[7]='lightgreen';
		colorarr[8]='lightgreen';
		colorarr[9]='lightgreen';

	name=id1.split(",");

	for(i=0;i<10;i++)
	{
		j=i+1;
		if(j<=name[1])
		document.getElementById(name[0]+","+j).bgColor=colorarr[i];
		else
		document.getElementById(name[0]+","+j).bgColor='white';
	}
	document.getElementById(name[0]+"i").style.visibility="visible";
	document.getElementById(name[0]+"a").value=name[1];
	checker3();

}

function checker3()
{
	var i=0,k=10;
	for(i=1;i<11;i++)
	{
		if(document.getElementById("q"+i+"a").value==0)
		k=0;
	}
	if(k=10)
	document.getElementById("sub1").style.visibility="visible";
}

function overer(id2)
{

	
	var i=0;
	var j=0;
	var name=new Array();
	name=id2.split(",");
	var test=name[0]+"a";
	if(document.getElementById(test).value==0)
	{
	var colorarr=new Array();
		colorarr[0]='red';
		colorarr[1]='red';
		colorarr[2]='red';
		colorarr[3]='red';
		colorarr[4]='yellow';
		colorarr[5]='yellow';
		colorarr[6]='yellow';
		colorarr[7]='lightgreen';
		colorarr[8]='lightgreen';
		colorarr[9]='lightgreen';


	for(i=0;i<10;i++)
	{
		j=i+1;
		if(j<=name[1])
		document.getElementById(name[0]+","+j).bgColor=colorarr[i];
		else
		document.getElementById(name[0]+","+j).bgColor='white';
	}
	}
}

function clearer(id3)
{
	var i=0;
	document.getElementById(id3+"a").value=0;
	for(i=1;i<11;i++)
	{
		document.getElementById(id3+","+i).bgColor="white";
	}
	document.getElementById(id3+"i").style.visibility="hidden";
}

function checker2()
	{
		
		
		var i=0,j=1,k=1;
		var fl=new Array();
		for (i=1;i<11;i++)
		{
			if(document.getElementById("q"+i+"a").value==0)
			{
				alert("Did not answer the question number :Q"+i);
				document.getElementById("sub1").style.visibility="hidden";		
			}
		}
		
	} 