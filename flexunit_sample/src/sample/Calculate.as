package sample
{
	import flash.display.Sprite;

	/**
	 * テスト対象クラスのサンプル
	 */
	public class Calculate extends Sprite
	{
		public function Calculate() {
			trace("init.");
		}

		/**
		 * 引数で渡された値を合計して返すだけ。
		 */
		public function add(i:int, j:int):int
		{
			return i + j;
		}
	}
}
