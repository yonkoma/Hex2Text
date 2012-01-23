﻿package {	import flash.display.Stage;	import flash.events.Event;	import flash.events.KeyboardEvent;	public class KeyEdit	{		private static var started:Boolean = false;		private static var keysDown:Object = new Object();		private static var keysDownOnce:Object = new Object();				public static function initialize(place)		{			if (!started)			{				// assign listeners for key presses and deactivation of the player				place.addEventListener(KeyboardEvent.KEY_DOWN, keyPressed, true);				place.addEventListener(KeyboardEvent.KEY_UP, keyReleased, true);				place.addEventListener(Event.DEACTIVATE, clearAllKeys);				// mark initialization as true so redundant				// calls do not reassign the event handlers				started = true;			}		}		public static function isDown(keyCode:uint):Boolean		{			return Boolean(keyCode in keysDown);		}		public static function isUp(keyCode:uint):Boolean		{			return !(Boolean(keyCode in keysDown));		}		public static function isPressed(keyCode:uint):Boolean		{			var re:Boolean = false			if(!keysDownOnce[keyCode]&&isDown(keyCode))			{				keysDownOnce[keyCode] = true;				re = true;			}			return re;		}		private static function keyPressed(event:KeyboardEvent):void		{			keysDown[event.keyCode] = true;		}		private static function keyReleased(event:KeyboardEvent):void		{			if (event.keyCode in keysDown)			{				delete keysDown[event.keyCode];				delete keysDownOnce[event.keyCode];			}		}		private static function clearAllKeys(event:Event):void		{			keysDown = new Object();			keysDownOnce = new Object();		}	}}