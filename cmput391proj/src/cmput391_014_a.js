/*--- Avanquest WebEasy Motion Script ---*/


function OnWeLoad()
{

	Img6={max:1,pos:0};
	Img6[0]=new Image();Img6[0].src='cmput391014001.jpg';
	Img6[1]=new Image();Img6[1].src='cmput391014002.jpg';
	Img8={max:1,pos:0};
	Img8[0]=new Image();Img8[0].src='cmput391014003.jpg';
	Img8[1]=new Image();Img8[1].src='cmput391014004.jpg';
	Img10={max:1,pos:0};
	Img10[0]=new Image();Img10[0].src='cmput391014005.jpg';
	Img10[1]=new Image();Img10[1].src='cmput391014006.jpg';
	Img12={max:1,pos:0};
	Img12[0]=new Image();Img12[0].src='cmput391014007.jpg';
	Img12[1]=new Image();Img12[1].src='cmput391014008.jpg';	IDP.my=(window.parent.frames.length && parent.MyFrm)?parent.MyFrm:window;
	IDP[1]=(V5)?'document.getElementById(\'e6\').src':(IE)?'e6.src':'document.e6.src';
	IDP[2]=(V5)?'document.getElementById(\'e8\').src':(IE)?'e8.src':'document.e8.src';
	IDP[3]=(V5)?'document.getElementById(\'e10\').src':(IE)?'e10.src':'document.e10.src';
	IDP[4]=(V5)?'document.getElementById(\'e12\').src':(IE)?'e12.src':'document.e12.src';
	isOvr=1;
}


/*--- EndOfFile ---*/
