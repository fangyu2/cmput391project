/*--- Avanquest WebEasy Motion Script ---*/


function OnWeLoad()
{

	Img9={max:1,pos:0};
	Img9[0]=new Image();Img9[0].src='cmput391002001.jpg';
	Img9[1]=new Image();Img9[1].src='cmput391002002.jpg';
	Img11={max:1,pos:0};
	Img11[0]=new Image();Img11[0].src='cmput391002003.jpg';
	Img11[1]=new Image();Img11[1].src='cmput391002004.jpg';	IDP.my=(window.parent.frames.length && parent.MyFrm)?parent.MyFrm:window;
	IDP[1]=(V5)?'document.getElementById(\'e9\').src':(IE)?'e9.src':'document.e9.src';
	IDP[2]=(V5)?'document.getElementById(\'e11\').src':(IE)?'e11.src':'document.e11.src';
	isOvr=1;
}


/*--- EndOfFile ---*/
