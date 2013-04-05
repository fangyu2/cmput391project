/*--- Avanquest WebEasy Motion Script ---*/


function OnWeLoad()
{

	Img5={max:1,pos:0};
	Img5[0]=new Image();Img5[0].src='cmput391001001.jpg';
	Img5[1]=new Image();Img5[1].src='cmput391001002.jpg';
	Img7={max:1,pos:0};
	Img7[0]=new Image();Img7[0].src='cmput391001003.jpg';
	Img7[1]=new Image();Img7[1].src='cmput391001004.jpg';	IDP.my=(window.parent.frames.length && parent.MyFrm)?parent.MyFrm:window;
	IDP[1]=(V5)?'document.getElementById(\'e5\').src':(IE)?'e5.src':'document.e5.src';
	IDP[2]=(V5)?'document.getElementById(\'e7\').src':(IE)?'e7.src':'document.e7.src';
	isOvr=1;
}


/*--- EndOfFile ---*/
