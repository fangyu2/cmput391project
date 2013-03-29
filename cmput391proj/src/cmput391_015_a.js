/*--- Avanquest WebEasy Motion Script ---*/


function OnWeLoad()
{

	Img10={max:1,pos:0};
	Img10[0]=new Image();Img10[0].src='cmput391015001.jpg';
	Img10[1]=new Image();Img10[1].src='cmput391015002.jpg';
	Img12={max:1,pos:0};
	Img12[0]=new Image();Img12[0].src='cmput391015003.jpg';
	Img12[1]=new Image();Img12[1].src='cmput391015004.jpg';	IDP.my=(window.parent.frames.length && parent.MyFrm)?parent.MyFrm:window;
	IDP[1]=(V5)?'document.getElementById(\'e10\').src':(IE)?'e10.src':'document.e10.src';
	IDP[2]=(V5)?'document.getElementById(\'e12\').src':(IE)?'e12.src':'document.e12.src';
	isOvr=1;
}


/*--- EndOfFile ---*/
