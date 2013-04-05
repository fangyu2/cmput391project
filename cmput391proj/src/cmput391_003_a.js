/*--- Avanquest WebEasy Motion Script ---*/


function OnWeLoad()
{

	Img3={max:1,pos:0};
	Img3[0]=new Image();Img3[0].src='cmput391003001.jpg';
	Img3[1]=new Image();Img3[1].src='cmput391003002.jpg';
	Img5={max:1,pos:0};
	Img5[0]=new Image();Img5[0].src='cmput391003003.jpg';
	Img5[1]=new Image();Img5[1].src='cmput391003004.jpg';
	Img7={max:1,pos:0};
	Img7[0]=new Image();Img7[0].src='cmput391003005.jpg';
	Img7[1]=new Image();Img7[1].src='cmput391003006.jpg';
	Img9={max:1,pos:0};
	Img9[0]=new Image();Img9[0].src='cmput391003007.jpg';
	Img9[1]=new Image();Img9[1].src='cmput391003008.jpg';	IDP.my=(window.parent.frames.length && parent.MyFrm)?parent.MyFrm:window;
	IDP[1]=(V5)?'document.getElementById(\'e3\').src':(IE)?'e3.src':'document.e3.src';
	IDP[2]=(V5)?'document.getElementById(\'e5\').src':(IE)?'e5.src':'document.e5.src';
	IDP[3]=(V5)?'document.getElementById(\'e7\').src':(IE)?'e7.src':'document.e7.src';
	IDP[4]=(V5)?'document.getElementById(\'e9\').src':(IE)?'e9.src':'document.e9.src';
	isOvr=1;
}


/*--- EndOfFile ---*/
