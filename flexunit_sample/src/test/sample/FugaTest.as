package test.sample
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.events.FlexEvent;
	
	import org.flexunit.Assert;
	import org.flexunit.async.Async;
	import org.fluint.uiImpersonation.UIImpersonator;
	
	import sample.Fuga;

	/**
	 * Calculateのテストクラス
	 */
	public class FugaTest
	{
		/**
		 * テスト対象のオブジェクトを格納するための入れ物
		 */
//		private var component:UIComponent;
		
		/** 
		 * テスト対象クラスのインスタンス
		 */
		private var target:Fuga;

		/******************************************************
		* セットアップ実施
		*******************************************************/
		/*
		 * テスト毎に実行される
		 */
		[Before(async,ui)]
		public function alsoRunBeforeEveryTest():void {
			trace("before");
			target = new Fuga();
			Async.proceedOnEvent( this, target, FlexEvent.CREATION_COMPLETE, 500);
			UIImpersonator.addChild(target);
		} 
		
		/*
		 * テスト毎に実行される
		 */
		[After(async,ui)]
		public function runAfterEveryTest():void { 
			trace("after");
			UIImpersonator.removeChild(target);
			target = null; 
		}
		
		/******************************************************
		* テスト実施
		*******************************************************/
		
		/**
		 * handleEvent でイベントを監視する。その後、実際に dispatchEvent でイベント発火
		 * http://www.insideria.com/2009/05/flashbuilder4-will-support-fle.html
		 * 
		 * 一連の流れ（フォームに入力してサブミット、みたいなヤツ）は
		 * http://sites.google.com/site/shin1ogawa/adobe-air/fluint
		 * を参考に SequenceRunner を使うと良い
		 */
		[Test(description="ボタンが押下されたことを確認するテスト", async, ui)]
		public function buttonHandlerTest():void {
			// 発火するイベントをウォッチする
			Async.handleEvent(this, target, MouseEvent.CLICK, buttonHandlerTestHandler, 500); 
			
			// テストしたいイベントを実際にディスパッチして実行する
			target.fugabutton.dispatchEvent( new MouseEvent(MouseEvent.CLICK, true));
		}
		
		/******************************************************
		* テスト検証ハンドラ
		*******************************************************/
		
		/**
		 * 実際の検証用メソッド
		 * このメソッドではボタンを押下して意図したイベントが発生しているかを確認する
		 * @param e
		 * @param passThroughData
		 * 
		 */
		private function buttonHandlerTestHandler(e:Event, passThroughData:Object):void {
			trace(e, passThroughData);
			Assert.assertEquals(e.type, MouseEvent.CLICK);
		}
	}
}
