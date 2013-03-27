/*--- Avanquest WebEasy Motion Script ---*/


function OnWeLoad()
{

	Img2={max:1,pos:0};
	Img2[0]=new Image();Img2[0].src='cmput391001001.jpg';
	Img2[1]=new Image();Img2[1].src='cmput391001002.jpg';
	Img4={max:1,pos:0};
	Img4[0]=new Image();Img4[0].src='cmput391001003.jpg';
	Img4[1]=new Image();Img4[1].src='cmput391001004.jpg';	IDP.my=(window.parent.frames.length && parent.MyFrm)?parent.MyFrm:window;
	IDP[1]=(V5)?'document.getElementById(\'e2\').src':(IE)?'e2.src':'document.e2.src';
	IDP[2]=(V5)?'document.getElementById(\'e4\').src':(IE)?'e4.src':'document.e4.src';
	isOvr=1;
}


/*--- EndOfFile ---*/
