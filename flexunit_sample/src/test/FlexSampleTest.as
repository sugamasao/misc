package test
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import mx.events.FlexEvent;
	import org.flexunit.Assert;
	import org.flexunit.async.Async;
	import org.fluint.uiImpersonation.UIImpersonator;

	/**
	 * メインMXMLのテストクラス
	 */
	public class FlexSampleTest
	{
		/** テスト対象クラスのインスタンス */
		private var target:FlexSample = null;

		/******************************************************
		* セットアップ実施
		*******************************************************/
		/*
		 * テスト毎に実行される
		 */
		[Before]
		public function alsoRunBeforeEveryTest():void { 
			trace("before");
			target = new FlexSample(); 
			UIImpersonator.addChild(target);
		} 
		
		/*
		 * テスト毎に実行される
		 */
		[After] 
		public function runAfterEveryTest():void { 
			trace("after");
			UIImpersonator.removeChild(target);
			target = null; 
		}
		
		/******************************************************
		* テスト実施
		*******************************************************/

		/**
		* Javaでいう@Testの役割をメタタグの[Test]が果たす。
		* 下を見ると、単発のイベント以外にも、複数の影響を表すようなテストを sequences なんちゃらでテストしてる。
		* http://www.insideria.com/2009/05/flashbuilder4-will-support-fle.html
		*/
		[Test(description="ユーザアクションに対する処理をテスト", async, ui, timeout="500")]
		public function buttonHandlerTest():void {
			// 発火するイベントをウォッチする
			Async.handleEvent(this, target, MouseEvent.CLICK, buttonHandlerTestHandler, 500);
			 
			// テストしたいイベントを実際にディスパッチして実行する
			target.button.dispatchEvent( new MouseEvent(MouseEvent.CLICK));
		}
 
		/**
		* 実際の検証用メソッド
		* @param e
		* @param passThroughData
		*
		*/
		private function buttonHandlerTestHandler(e:Event, passThroughData:Object):void {
			trace(e, passThroughData);
			Assert.assertEquals(target.targetText.text, "30");
		}
		
		/*
		[Test(async,timeout="500")] 
		public function testSample():void { 
			//Async.proceedOnEvent( testCase, target, eventName ); 
			//Async.failOnEvent( testCase, target, eventName ); 
			//Async.handleEvent( testCase, target, MouseEvent,  ); 
			//Async.asyncHandler( testCase, eventHandler ); 
			//Async.asyncResponder( testCase, responder ); 
		}
		*/
	}
}
