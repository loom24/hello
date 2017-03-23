/**
 * 
 */

window.onload = function(){
	init();
}

function init(){
	var btn = document.getElementById("btn");
// 	btn.onclick(drawing());

	btn.onclick = function drawing(){
		var startNum = parseInt(document.getElementById("min").value);
		var endNum = parseInt(document.getElementById("max").value);
		var selectNum = document.getElementById("num").value;
		
		var numArray = new Array;
		var randomNum;
		
		var overlappingFlag;
		
		while(selectNum){
			randomNum = Math.floor((Math.random()*(endNum-startNum+1))+startNum);
//			randomNum = Math.floor((Math.random()*(20-10+1))+10);
			overlappingFlag = false;
			
			for(var a in numArray){
				if(numArray[a] == randomNum){
					overlappingFlag = true;
					break;
					
				}
			}
			if(!overlappingFlag){
				numArray.push(randomNum);
				  selectNum--;
				
			}
		}

		document.getElementById("console").innerHTML = numArray.sort(function(a,b)
		{return a-b;}		
		);
		
		
	}
}