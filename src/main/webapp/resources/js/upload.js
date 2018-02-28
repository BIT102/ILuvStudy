/**
 * 
 */

function checkImageType(fileName) {
	
	var pattern = /jpg|gif|png|jpeg/i;
	
	return fileName.match(pattern);
	
}

function getFileInfo(name){
	
	var fileName, imgsrc, getLink;
	
	var fileLink;
	
	if(checkImageType(name)) {
		imgsrc = "/study/displayFile?fileName="+name;
		fileLink = name.substr(14);
		
		var front = name.substr(0, 12);
		var end = name.substr(14);
		getLink = "/study/displayFile?fileName="+front+end;
		
	} else {
		imgsrc = "/resources/dist/img/file.png";
		fileLink = name.substr(12);
		getLink = "/study/displayFile?fileName="+name;
	}
	
	fileName = fileLink.substr(fileLink.indexOf("_")+1);
	
	return {fileName:fileName, imgsrc:imgsrc, getLink:getLink, name:name};
}