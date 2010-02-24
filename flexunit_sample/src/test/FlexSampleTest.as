package test
{
	import org.flexunit.Assert;

	/**
	 * Calculateのテストクラス
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
		} 
		
		/*
		 * テスト毎に実行される
		 */
		[After] 
		public function runAfterEveryTest():void { 
			trace("after");
			target = null; 
		}
		
		/******************************************************
		* テスト実施
		*******************************************************/
		/**
		 * Javaでいう@Testの役割をメタタグの[Test]が果たす。
		 * JUnit4ライクということでIgnoreやBefore,Afterも使える。
		 * 詳しくはドキュメントに色々書いてある。
		 */
		[Test]
		public function testAdd():void
		{
		}

		/* 非同期のテスト */
		[Test(async,timeout="500")] 
		public function buttonHandlerTest():void { 
			//Async.proceedOnEvent( testCase, target, eventName ); 
			//Async.failOnEvent( testCase, target, eventName ); 
			//Async.handleEvent( testCase, target, MouseEvent,  ); 
			//Async.asyncHandler( testCase, eventHandler ); 
			//Async.asyncResponder( testCase, responder ); 
		}
	}
}
