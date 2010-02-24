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
		private static var target:Calculate = new Calculate();

		/**
		 * Javaでいう@Testの役割をメタタグの[Test]が果たす。
		 * JUnit4ライクということでIgnoreやBefore,Afterも使える。
		 * 詳しくはドキュメントに色々書いてある。
		 */
		[Test]
		public function testAdd():void
		{
			Assert.assertEquals(2, target.add(1, 1));
		}
	}
}
