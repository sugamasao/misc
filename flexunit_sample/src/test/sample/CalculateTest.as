package test.sample
{
	import org.flexunit.Assert;

	import sample.Calculate;

	/**
	 * Calculateのテストクラス
	 */
	public class CalculateTest
	{
		/** テスト対象クラスのインスタンス */
		private var target:Calculate = null;
		/*
		 * テスト毎に実行される
		 */
		[Before]
		public function alsoRunBeforeEveryTest():void {
			trace("before");
			target = new Calculate();
		} 
		
		/*
		 * テスト毎に実行される
		 */
		[After]
		public function runAfterEveryTest():void { 
			trace("after");
			target = null; 
		}
		

		/**
		 * Javaでいう@Testの役割をメタタグの[Test]が果たす。
		 * JUnit4ライクということでIgnoreやBefore,Afterも使える。
		 * 詳しくはドキュメントに色々書いてある。
		 */
		[Test(description="ボタンが押下されたことを確認するテスト")]
		public function testAdd():void
		{
			Assert.assertEquals(2, target.add(1, 1));
		}
	}
}
