package behavior
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.ui.Mouse;
	
	
	
	public class Dialogue extends Sprite
	{
		public static const DIASELECT1:String = "diaselect1";
		public static const DIASELECT2:String = "diaselect2";
		public static const DIASELECT3:String = "diaselect3";
		public static const DIASELECT4:String = "diaselect4";
		
		private var dialog:Loader;
		
		private var dialogContent:TextField;
		private var mouseField1:TextField;
		private var mouseField2:TextField;
		private var mouseField3:TextField;
		private var mouseField4:TextField;
		
		private var FrameX:Number;
		private var FrameY:Number;
		private var FrameW:Number;
		private var FrameH:Number;
		private var Name:String;
		
		public var diaContent:TextField;
		
		public var StrAr:Array;
		public var curdia:Array;
		public var us:Array;
		public var diaaj:Array;
		public var diabr:Array;
		public var diao1r:Array;
		public var diahw:Array;
		public var diampr:Array;
		public var diamprb:Array;
		public var swissknife:Array;
		public var paperclip:Array;
		public var flashlight:Array;
		public var roseandpencil:Array;
		public var brb:Array;
		public var ds:Array;
		public var ds2:Array;
		public var des1:Array;
		public var des2:Array;
		public var des3:Array;
		public var des4:Array;
		public var nd:Array;
		public var brw:Array;
		public var brc:Array;
		public var bdc:Array;
		public var mprc:Array;
		public var hwc:Array;
		public var tr:Array;
		public var fdc1:Array;
		public var fdc2:Array;
		public var phgpr:Array;
		public var phrpr:Array;
		public var phgd:Array;
		public var phrd:Array;
		public var fdfl:Array;
		public var fla:Array;
		public var csc:Array;
		public var hgb:Array;
		public var hgbstop:Array;
		public var hgbnonstop:Array;
		public var kob:Array;
		public var jw:Array;
		public var iw:Array;
		public var sr:Array;
		public var sr1:Array;
		public var sf:Array;
		
		public var count:int = 0;
		
		public var selectFormat:TextFormat;
		
		public function Dialogue(nm:String, _x:Number, _y:Number, _w:Number, _h:Number)
		{
			super();
			
			FrameX = _x;
			FrameY = _y;
			FrameW = _w;
			FrameH = _h;
			Name = nm;
			selectSentence();
			
			/*this.x = FrameX;
			this.y = FrameY;*/
			
			dialog = new Loader();
			dialog.load(new URLRequest("image/objects/TextBar.png"));
			dialog.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
			
			
		}
		
		private function completeHandler(e:Event):void {
			
			dialog.width = FrameW;
			dialog.height = FrameH;
			dialog.alpha = 0.6;
			addChild(dialog);
			
			
			initText();
			clickArea();
			
		}
		
		private function initText():void{
			var formatter:TextFormat = new TextFormat(); 
			formatter.font = "Apple Chancery"; 
			//formatter.color = 0x000000;
			formatter.size = 8; 
			
			
			
			diaContent = new TextField();
			diaContent.multiline = true;
			diaContent.wordWrap = true;
			
			diaContent.x = FrameW * 0.15;
			diaContent.y = FrameH * 0.1;
			diaContent.width = FrameW * 0.8 - FrameX;
			diaContent.height = FrameH * 0.8;
			diaContent.defaultTextFormat = formatter;
			diaContent.text = curdia[count];
			
			//diaContent.setTextFormat(formatter);
			diaContent.selectable = false;
			
			addChild(diaContent);
		}
		public function play():void{
			diaContent.text = curdia[count];
		}
		
		private function assigningDia():void{
			switch(Name){
				case "us":
					curdia = us;
					break;
				case "aj":
					curdia = diaaj;
					break;
				case "ds":
					curdia = ds;
					break;
				case "br":
					curdia = diabr;
					break;
				case "o1r":
					curdia = diao1r;
					break;
				case "swissknife":
					curdia = swissknife;
					break;
				case "roseandpencil":
					curdia = roseandpencil;
					break;
				case "paperclip":
					curdia = paperclip;
					break;
				case "diampr":
					curdia = diampr;
					break;
				case "diamprb":
					curdia = diamprb;
					break;
				case "diahw":
					curdia = diahw;
					break;
				case "brb":
					curdia = brb;
					break;
				case "des1":
					curdia = des1;
					break;
				case "des2":
					curdia = des2;
					break;
				case "des3":
					curdia = des3;
					break;
				case "des4":
					curdia = des4;
					break;
				case "flashlight":
					curdia = flashlight;
					break;
				case "nd":
					curdia = nd;
					break;
				case "ds2":
					curdia = ds2;
					break;
				case "brw":
					curdia = brw;
					break;
				case "brc":
					curdia = brc;
					break;
				case "bdc":
					curdia = bdc;
					break;
				case "mprc":
					curdia = mprc;
					break;
				case "hwc":
					curdia = hwc;
					break;
				case "tr":
					curdia = tr;
					break;
				case "fdc1":
					curdia = fdc1;
					break;
				case "fdc2":
					curdia = fdc2;
					break;
				case "phgpr":
					curdia = phgpr;
					break;
				case "phrpr":
					curdia = phrpr;
					break;
				case "phgd":
					curdia = phgd;
					break;
				case "phrd":
					curdia = phrd;
					break;
				case "fdfl":
					curdia = fdfl;
					break;
				case "fla":
					curdia = fla;
					break;
				case "csc":
					curdia = csc;
					break;
				case "hgb":
					curdia = hgb;
					break;
				case "hgbstop":
					curdia = hgbstop;
					break;
				case "hgbnonstop":
					curdia = hgbnonstop;
					break;
				case "kob":
					curdia = kob;
					break;
				case "jw":
					curdia = jw;
					break;
				case "iw":
					curdia = iw;
					break;
				case "sr":
					curdia = sr;
					break;
				case "sr1":
					curdia = sr1;
					break;
				case "sf":
					curdia = sf;
					break;
				default:
					curdia = StrAr;
					break;
			}
			
		}
		
		private function clickArea():void{
			mouseField1 = new TextField();
			mouseField1.selectable = false;
			mouseField1.width = FrameW * 0.7 - FrameX;
			mouseField1.height = FrameH * 0.15;
			mouseField1.x = diaContent.x;
			mouseField1.y = FrameH * 0.13;
			mouseField1.backgroundColor = 0xFFFFFF;
			mouseField1.alpha = 0.7;
			//mouseField1.addEventListener(MouseEvent.MOUSE_OVER, mfOver1);
			addChild(mouseField1);
			mouseField2 = new TextField();
			mouseField2.selectable = false;
			mouseField2.width = FrameW * 0.7 - FrameX;
			mouseField2.height = FrameH * 0.15;
			mouseField2.x = diaContent.x;
			mouseField2.y = FrameH * 0.3;
			mouseField2.backgroundColor = 0xFFFFFF;
			mouseField2.alpha = 0.7;
			//mouseField2.addEventListener(MouseEvent.MOUSE_OVER, mfOver2);
			addChild(mouseField2);
			mouseField3 = new TextField();
			mouseField3.selectable = false;
			mouseField3.width = FrameW * 0.7 - FrameX;
			mouseField3.height = FrameH * 0.15;
			mouseField3.x = diaContent.x;
			mouseField3.y = FrameH * 0.47;
			mouseField3.backgroundColor = 0xFFFFFF;
			mouseField3.alpha = 0.7;
			//mouseField3.addEventListener(MouseEvent.MOUSE_OVER, mfOver3);
			addChild(mouseField3);
			mouseField4 = new TextField();
			mouseField4.selectable = false;
			mouseField4.width = FrameW * 0.7 - FrameX;
			mouseField4.height = FrameH * 0.15;
			mouseField4.x = diaContent.x;
			mouseField4.y = FrameH * 0.64;
			mouseField4.backgroundColor = 0xFFFFFF;
			mouseField4.alpha = 0.7;
			//mouseField4.addEventListener(MouseEvent.MOUSE_OVER, mfOver4);
			addChild(mouseField4);
		}
		
		public function addMouseListener():void{
			mouseField1.addEventListener(MouseEvent.MOUSE_OVER, mfOver1);
			mouseField2.addEventListener(MouseEvent.MOUSE_OVER, mfOver2);
			mouseField3.addEventListener(MouseEvent.MOUSE_OVER, mfOver3);
			mouseField4.addEventListener(MouseEvent.MOUSE_OVER, mfOver4);
		}
		
		public function removeMouseListener():void{
			mouseField1.removeEventListener(MouseEvent.MOUSE_OVER, mfOver1);
			mouseField2.removeEventListener(MouseEvent.MOUSE_OVER, mfOver2);
			mouseField3.removeEventListener(MouseEvent.MOUSE_OVER, mfOver3);
			mouseField4.removeEventListener(MouseEvent.MOUSE_OVER, mfOver4);
		}
		
		private function mfOver1(e:MouseEvent):void{
			Mouse.cursor = "button";
			mouseField1.background = true;
			//variable.dialogSelect(1);
			mouseField1.addEventListener(MouseEvent.MOUSE_OUT, mfOut1);
			mouseField1.addEventListener(MouseEvent.CLICK, mfClick1);
		}
		
		private function mfOut1(e:MouseEvent):void{
			Mouse.cursor = "arrow";
			mouseField1.background = false;
			//variable.dialogSelect = 0;
			mouseField1.removeEventListener(MouseEvent.MOUSE_OUT, mfOut1);
			mouseField1.removeEventListener(MouseEvent.CLICK, mfClick1);
		}
		
		private function mfClick1(e:MouseEvent):void{
			Mouse.cursor = "arrow";
			mouseField1.background = false;
			dispatchEvent(new Event(Dialogue.DIASELECT1));
			mouseField1.removeEventListener(MouseEvent.MOUSE_OUT, mfOut1);
			mouseField1.removeEventListener(MouseEvent.CLICK, mfClick1);
		}
		private function mfOver2(e:MouseEvent):void{
			Mouse.cursor = "button";
			mouseField2.background = true;
			//variable.dialogSelect(2);
			mouseField2.addEventListener(MouseEvent.MOUSE_OUT, mfOut2);
			mouseField2.addEventListener(MouseEvent.CLICK, mfClick2);
		}
		
		private function mfOut2(e:MouseEvent):void{
			Mouse.cursor = "arrow";
			mouseField2.background = false;
			//variable.dialogSelect = 0;
			mouseField2.removeEventListener(MouseEvent.MOUSE_OUT, mfOut2);
			mouseField2.removeEventListener(MouseEvent.CLICK, mfClick2);
		}
		
		private function mfClick2(e:MouseEvent):void{
			Mouse.cursor = "arrow";
			mouseField2.background = false;
			dispatchEvent(new Event(Dialogue.DIASELECT2));
			mouseField2.removeEventListener(MouseEvent.MOUSE_OUT, mfOut2);
			mouseField2.removeEventListener(MouseEvent.CLICK, mfClick2);
		}
		
		private function mfOver3(e:MouseEvent):void{
			Mouse.cursor = "button";
			mouseField3.background = true;
			//variable.dialogSelect(3);
			mouseField3.addEventListener(MouseEvent.MOUSE_OUT, mfOut3);
			mouseField3.addEventListener(MouseEvent.CLICK, mfClick3);
		}
		
		private function mfOut3(e:MouseEvent):void{
			Mouse.cursor = "arrow";
			mouseField3.background = false;
			//variable.dialogSelect = 0;
			mouseField3.removeEventListener(MouseEvent.MOUSE_OUT, mfOut3);
			mouseField3.removeEventListener(MouseEvent.CLICK, mfClick3);
		}
		
		private function mfClick3(e:MouseEvent):void{
			Mouse.cursor = "arrow";
			mouseField3.background = false;
			dispatchEvent(new Event(Dialogue.DIASELECT3));
			mouseField3.removeEventListener(MouseEvent.MOUSE_OUT, mfOut3);
			mouseField3.removeEventListener(MouseEvent.CLICK, mfClick3);
		}
		private function mfOver4(e:MouseEvent):void{
			Mouse.cursor = "button";
			mouseField4.background = true;
			//variable.dialogSelect(4);
			mouseField4.addEventListener(MouseEvent.MOUSE_OUT, mfOut4);
			mouseField4.addEventListener(MouseEvent.CLICK, mfClick4);
		}
		
		private function mfOut4(e:MouseEvent):void{
			Mouse.cursor = "arrow";
			mouseField4.background = false;
			//variable.dialogSelect = 0;
			mouseField4.removeEventListener(MouseEvent.MOUSE_OUT, mfOut4);
			mouseField4.removeEventListener(MouseEvent.CLICK, mfClick4);
		}
		
		private function mfClick4(e:MouseEvent):void{
			Mouse.cursor = "arrow";
			mouseField4.background = false;
			dispatchEvent(new Event(Dialogue.DIASELECT4));
			mouseField4.removeEventListener(MouseEvent.MOUSE_OUT, mfOut4);
			mouseField4.removeEventListener(MouseEvent.CLICK, mfClick4);
		}
		
		private function selectSentence():void{
			StrAr=[
				"11111111111111111111111111111111111111\n" +
				"(press any keys or click on the dialogue to continue)",
				"2222222222222222222222222222222222222\n" +
				"(press any keys or click on the dialogue to continue)",
				"33333333333333333333333333333333333333\n" +
				"(press any keys or click on the dialogue to continue)",
				"444444444444444444444444444444444444\n" +
				"(press any keys or click on the dialogue to continue)",
				"55555555555555555555555555555555555555\n" +
				"(press any keys or click on the dialogue to continue)"
			];
			us = [
				"You find nothing here."
			];
			diaaj = [
				"You become your grandpa Steven and you not only can you experience what happened to Steven, but you can also change it.\n" +
				"Now, enjoy!!!!\n\nClick anywhere on screen to go on.",
				"You walk into the lobby and see the manager is heading to you.",
				"Manager: Hello Steven, where have you been? We are assigning jobs now, setting tables in the ballroom" +
				" or doing room service, which one do you prefer?"
			];
			diabr = [
				"Manager: Where is your bow? You know the rules, you have to" +
				"wear it if you work in the ballroom.",
				"Steven: Sorry, I left it in my room. I'm going to fetch it, be right back.",
				"One of Steven's co-workers is heading to him.",
				"Coworker: I have a used one (a little bit dirty) with me now. You can wear" +
				" it, if you don't mind.",
				"Wear the used one.\n" +
				"Go back to get your own.",
				"Steven: Oh, that would be nice, thank you.",
				"Steven: I don't think it's appropriate, I'd better to go back."
			];
			diao1r = [
				"One of Steven's co-workers is heading to him.",
				"Co-worker: Steven, would you like to do me a favor? I was going " +
				"to give this dress to Ms.Parker, but now this boy Jimmy needs help to find " +
				"his mom. Would you please help me do one of them?",
				"Steven: Sure!",
				"Give the washed dress to Ms. Parker.\n" +
				"Help Jimmy find his mom, Rebecca.",
				"Steven: Let me help you with the dress. I will send it to Ms.Parker.",
				"Steven: Come on, Jimmy. I will take you to mom."
			];
			swissknife = [
				"You find a knife while working, how would you handle it?",
				"I like it and I'm gonna keep it.\n" +
				"I like it but I'm gonna put it in the Lost and Found.\n" +
				"I don't like it but I wanna keep it.\n" +
				"I don't like it and I'm gonna throw it away."
			];
			paperclip = [
				"You find a paperclip, how would you handle it?",
				"This paper clip looks too old to be useful. (throw it away)\n" +
				"Why is the paper clip here, I'll just keep it.\n" +
				"Ah. A useless paper clip. (throw it away)\n" +
				"I need a paper clip to collect my paper.(keep it)"
			];
			roseandpencil = [
				"You notice there is a rose and pencil on the ground",
				"I wanna keep this beautiful rose, but the pencil is useless.\n" +
				"Both the rose and the pencil are useless, and I don't want to keep them.\n" +
				"The rose is so dirty that I don't like it at all. I might keep the pencil.\n" +
				"I just wanna keep both of them."
			];
			diahw = [
				"Steven sees a lady sitting on the bench, weeping.",                                      //1
				"Talk to her.\n" +
				"Ignore her",                                                                                //2  S1
				//******Talk to her*********
				"Steven: Are you OK, Ms?",                                                                   //3
				"Rebecca: Yes, I'm fine.",                                                                  //4
				"Give an object you have to Rebecca.",                                                       //5  
				"Give her the rose.\n" +
				"Give nothing and leave.",                                                                   //6  S2
				"Give nothing and leave.\n",                                                                   //7  S2'
				"Give her the pencil.\n" +
				"Give nothing and leave.",                                                                   //8  S2''
				"Give her the rose.\n" +
				"Give her the pencil.\n" +
				"Give nothing and leave.",                                                                   //9  S2'''
				//*********the rose*********
				"Steven: It looks beautiful, doesn't it?",                                                   //10
				"Rebecca: Yes. Actually, I'm not OK. I lost my husband in an accident last week.",        //11
				"Steven: I'm sorry about that. You have my condolence.\n",                                    //12
				//***********Pencil*********
				"Steven: Here, is this your pencil? I found it in the hallway.",                             //13
				"Rebecca: No, it's not mine. Would you please give me some privacy.",                        //14
				"Steven: Of course. Sorry for bothering you.",                                               //15
				"Then Steven leaves."                                                                        //16
			];
			diampr = [
				"Steven knocks the door, and Ms.Parker opens the door.",
				"Steven: Good morning Ms.Parker. Here is your washed dress.",
				"Ms.Parker: Thank you."
			];
			brb = [
				"Steven is standing in the ballroom, looking at the two service sections. One is the Dessert Section, the other is the drinks section."
			];
			ds = [
				"Ms.Parker stands in front of Steven.",
				"Ms.Parker: Hi, nice to see you again.",
				"Steven: Me too. Ms.Parker. What do you want to drink?",
				"Ms.Parker: Wine, please, Actually, I have something to show you. Do you mind going to my room?",
				"Steven: Sure, my pleasure.",
				"Ms.Parker and Steven leave the ball."
			]
			ds2 = [
				"Ms.Parker stands in front of Steven.",
				"Steven: What do you like to drink, Ms?",
				"Ms.Parker: Wine, Please.",
				"Ms.Parker gets a glass of wine and leaves."
			]
			diamprb = [
				"Steven: Ah, you look so beautiful in the dress. Ms.Parker.",
				"Ms.Parker: Thanks",
				"Ms.Parker walks toward her suitcase.",
				"Steven: Ms.Parker, what do you want to show me?",
				"Ms.Parker shows 2 bottles of liquor.",
				"Ms.Parker: See? This one is wine, this one is whisky. Both are very good. Do you want to try?",
				"Steven: May I?",
				"Ms.Parker: Of course. Which one do you want, wine or whisky?"
			];
			des1 = [
				"Rebecca stands in front of Steven.",
				"Rebecca: Hi, good to see you again.(smile).",
				"Steven: Yah. It's great seeing you smile.",
				"Rebecca: Ah, thanks for your rose. Would you mind going to the deck to have a little talk after I " +
				"Get little Jimmy a piece of cake?",
				"Steven: Sure, that will be my pleasure.",
				"Rebecca gives the cake to Jimmy, then Rebecca and Steven leave the ball room."
			];
			des2 = [
				"Rebecca stands in front of Steven.",
				"Rebecca: Hi, it's you.",
				"Steven: Yah. It's a small ship, isn't it?",
				"Rebecca: Ah, I'm sorry for my unfriendliness to you, since I was in a bad mood.",
				"Steven: That's OK, everyone has that kind of moment. Do you want to go to the deck and have a little talk?",
				"Rebecca: Sure, but I need to get a piece of cake for my son first.",
				"Steven: You're married?",
				"Rebecca: Yes, but my husband passed away in an accident last week.",
				"Steven: Oh, I'm so sorry to hear that.",
				"Rebecca gives cake to her son Jimmy, then Rebecca and Steven leave the ballroom."
			];
			des3 = [
				"Rebecca stands in front of Steven.",
				"Rebecca: Hey, it's you. Thank you again for helping my son.",
				"Steven: It's my pleasure. But you shouldn't have left Jimmy alone.",
				"Rebecca: I know it. But I was in a bad mood at that moment.",
				"Steven: Would you like to tell me what happened? If you don't mind.",
				"Rebecca: I lost my husband in an accident last week.",
				"Steven: Oh, I'm so sorry to hear that.",
				"Rebecca: Do you have time now? We can go to the deck and have a little talk.",
				"Steven: Sure, it's my pleasure.",
				"Rebecca: Thanks, it's very kind of you. Please let me get a piece of cake for Jimmy first.",
				"Rebecca gives cake to her son Jimmy, then Rebecca and Steven leave the ball room."
			];
			des4 = [
				"Rebecca stands in front of Steven.",
				"Rebecca: May I have a piece of cake?",
				"Steven: Here it is, Ms. Enjoy.",
				"Rebecca leaves.",
				"Steven keeps working in the ballroom."
			];
			flashlight = [
				"You find a flashlight in the Hallway. How would you handle it?",
				"This flashlight could be useful in the dark night.(keep it)\n" +
				"This flashlight is too old to be useful(throw it away)\n" +
				"Someone lost it, I should take it to the Lost and Found.\n" +
				"I'm gonna keep it even though it looks useless now."
			]	
			nd = [
				"They have a nice conversation on the deck."
			]
			brw = [
				"Steven keeps working in the ballroom.",	
			]	
			brc = [
				"One waiter runs into the ballroom and screams.",
				"Waiter: The ship crashed on the iceberg! The ship crashed on the iceberg! Run! Run! Run!....",
				"All the people in the ball room flow out of the ballroom."
			]
			bdc = [
				"Steven runs to the deck.",
				"The manager runs to Steven.",
				"Manager: Steven, go help evacuate passengers.",
				"Manager runs away",
				"Steven: oh...OK.",
				"Steven's coworker runs to him.",
				"Coworker: Steven, why are you still standing here. Hurry, go save your life.",
				"Coworker jumps into the ocean."
			]
			mprc = [
				"Suddenly, Steven and Ms.Parker hear a big noise of a crash",
				"Ms.Parker: What happened?",
				"Steven: I'm gonna check out."
			]
			hwc = [
				"Steven walks to the hallway and sees a co-worker running.",
				"Coworker: Steven, the ship hit an iceberg. Come with me to the laundry and get some clean blankets for passengers. HURRY!",
				"Steven turns his head back to Ms.Parker.",
				"Steven: Ms.Parker. Leave your room to the deck as quick as possible.",
				"Steven and his coworker run to the laundry."
			]
			tr = [
				"They get in the laundry and get lots of clean blankets. They find the door where they " +
				"Get stuck when they try to leave. Then Steven find there is another door which " +
				"leads to the deck, but they don't have the key to the door.",
				"Choice: pick one of objects you collected in the previous scenes to help open the door."
			]
			fdc1 = [
				"Steven opens the door and gets on the deck.",
				"Steven's other coworker runs to him.",
				"Coworker: Steven, you can speak German, go show those Germans how to be safe in a life boat.",
				"At the same time, Rebecca runs to Steven and his coworker.",
				"Rebecca: Help! Could you gentleman help me find my son?"
			]	
			fdc2 = [
				"Steven's other coworker runs to him.",
				"Coworker: Steven, this ship hit an iceberg. You can speak German, go show those Germans how to be safe in a life boat.",
				"At the same time, Rebecca runs to Steven and his coworker.",
				"Rebecca: Oh my God! Where is my Jimmy. Steven, you must help me find him."
			]	
			phgpr = [
				"Steven looks at Rebecca.",
				"Steven: Don't worry lady, my colleague will help you find your son.",
				"Then Steven's coworker leaves with Rebecca to look for her son. And Steven goes to help those Germans."
			]	
			phrpr = [
				"Steven looks at his coworker.",
				"Steven: Sorry, go and find someone else. I'm going to help this lady look for her son.",
				"Then Steven's coworker runs away to look for another person. And Steven and Rebecca run to look for Rebecca's son, Jimmy."
			]	
			phgd = [
				"Steven: Sorry Rebecca, I have to finish my job first. You can go look for him, I'm gonna catch you as soon as I finish that. Take care!",
				"Rebecca: OK, be careful."
			]
			phrd = [
				"Steven looks at his coworker.",
				"Steven: Sorry, go and find someone else. I'm going to help this lady look for her son.",
				"Then Steven's coworker runs away to look for another person. And Steven and Rebecca run to look for Rebecca's son, Jimmy."
			]
			fdfl = [
				"Unfortunately, you are too late, the life boat has gone. You, Rebecca and Jimmy all fall into the water.",
				"Rebecca: Look, Steven. Is that a rescue boat over there?",
				"Steven: Right, let's try to draw their attention.",
				"Choice: Pick one of the objects you collected in the previous scenes to attract the rescue boat."
			]
			fla = [
				"The flashlight could be used to send an S.O.S signal.",
				"Game: You have 1 second to memorize the order of the arrow keys, then you have two chances to type in the arrow keys with the keyboard to send a correct signal."
			]
			csc = [
				"You have nothing helpful to attract the rescue boat.",
				"Rebecca and Jimmy die due to the cold seawater",
				"Steven has to swim to the rescue boat.",
				"Game: Use the arrow keys to help Steven swim."
			]
			hgb = [
				"Steven stands in the life boat and shows the German people how to be safe when the lifeboat is on the ocean.",
				"Suddenly, the lifeboat starts going down.",
				"Ms.Parker runs toward the lifeboat."
			]	
			hgbstop = [
				"Steven sees Ms.Parker running to the lifeboat.",
				"Steven: Stop! Stop!, There is one more lady.",
				"Ms.Parker gets on the lifeboat, then the lifeboat continues going down."
			]
			hgbnonstop = [
				"Steven doesn't see Ms.Oarker running to the lifeboat and keeps guiding the German people.",
				"The lifeboat keeps going down."
			]
			kob = [
				"The lifeboat goes down to the ocean, but it's stuck by a rope.",
				"Choices: Pick one of the objects you collected in to former scenes to set the lifeboat free.",
				"Unfortunately, you didn't save an object that could help you."
			]
			jw = [
				"You have nothing helpful to cut the rope.",
				"Then all the people on the life boat jump into the ocean."
			]
			iw = [
				//**************in 21, not in 41**********
				"Ms.Parker drowns, since she doesn't know how to swim.",
				//***************mutual*****************
				"Unfortunately, you didn't save an object that could help you.",
				"Steven sees there is a rescue boat far away from him.",
				"Choices: Pick one of the objects you collected in the previous scenes to attract the rescue boat."
			]	
			sr = [
				"You help young Jimmy find his mother, Rebecca.",
				"Steven: Hello, Ms. Your son is here.",
				"Rebecca: Thank you, Sir! Oh my Jimmy, I'm so sorry that he caused you trouble. I appreciate your help, sir.",
				"Steven: My pleasure."
			]	
			sr1 = [
				"You and Rebecca find Jimmy.",
				"Steven: Jimmy!! Let's get out of here!!"
			]	
			sf = [
				"Steven: OH, there is a rescue boat far away from me. I need to try my best to swim to reach it."
			]	
			
			assigningDia();
		}
	}
}