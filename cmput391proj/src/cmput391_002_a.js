/*--- Avanquest WebEasy Motion Script ---*/


function OnWeLoad()
{

	Img8={max:1,pos:0};
	Img8[0]=new Image();Img8[0].src='cmput391002001.jpg';
	Img8[1]=new Image();Img8[1].src='cmput391002002.jpg';
	Img10={max:1,pos:0};
	Img10[0]=new Image();Img10[0].src='cmput391002003.jpg';
	Img10[1]=new Image();Img10[1].src='cmput391002004.jpg';	IDP.my=(window.parent.frames.length && parent.MyFrm)?parent.MyFrm:window;
	IDP[1]=(V5)?'document.getElementById(\'e8\').src':(IE)?'e8.src':'document.e8.src';
	IDP[2]=(V5)?'document.getElementById(\'e10\').src':(IE)?'e10.src':'document.e10.src';
	isOvr=1;
}


/*--- EndOfFile ---*/
