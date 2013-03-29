/*--- Avanquest WebEasy Motion Script ---*/


function OnWeLoad()
{

	Img12={max:1,pos:0};
	Img12[0]=new Image();Img12[0].src='cmput391015001.jpg';
	Img12[1]=new Image();Img12[1].src='cmput391015002.jpg';
	Img14={max:1,pos:0};
	Img14[0]=new Image();Img14[0].src='cmput391015003.jpg';
	Img14[1]=new Image();Img14[1].src='cmput391015004.jpg';	IDP.my=(window.parent.frames.length && parent.MyFrm)?parent.MyFrm:window;
	IDP[1]=(V5)?'document.getElementById(\'e12\').src':(IE)?'e12.src':'document.e12.src';
	IDP[2]=(V5)?'document.getElementById(\'e14\').src':(IE)?'e14.src':'document.e14.src';
	isOvr=1;
}


/*--- EndOfFile ---*/
