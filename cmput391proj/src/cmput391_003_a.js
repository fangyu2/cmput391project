/*--- Avanquest WebEasy Motion Script ---*/


function OnWeLoad()
{

	Img2={max:1,pos:0};
	Img2[0]=new Image();Img2[0].src='cmput391003001.jpg';
	Img2[1]=new Image();Img2[1].src='cmput391003002.jpg';
	Img4={max:1,pos:0};
	Img4[0]=new Image();Img4[0].src='cmput391003003.jpg';
	Img4[1]=new Image();Img4[1].src='cmput391003004.jpg';
	Img6={max:1,pos:0};
	Img6[0]=new Image();Img6[0].src='cmput391003005.jpg';
	Img6[1]=new Image();Img6[1].src='cmput391003006.jpg';
	Img8={max:1,pos:0};
	Img8[0]=new Image();Img8[0].src='cmput391003007.jpg';
	Img8[1]=new Image();Img8[1].src='cmput391003008.jpg';	IDP.my=(window.parent.frames.length && parent.MyFrm)?parent.MyFrm:window;
	IDP[1]=(V5)?'document.getElementById(\'e2\').src':(IE)?'e2.src':'document.e2.src';
	IDP[2]=(V5)?'document.getElementById(\'e4\').src':(IE)?'e4.src':'document.e4.src';
	IDP[3]=(V5)?'document.getElementById(\'e6\').src':(IE)?'e6.src':'document.e6.src';
	IDP[4]=(V5)?'document.getElementById(\'e8\').src':(IE)?'e8.src':'document.e8.src';
	isOvr=1;
}


/*--- EndOfFile ---*/
