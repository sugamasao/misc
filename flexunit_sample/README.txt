■実行環境
1.コンパイラについて
	FlexSDK3.4 で実行しています.

2.FlexUnit について
	http://opensource.adobe.com/wiki/display/flexunit/Downloads
	上記から FlexUnit を DL し、中身の swc ファイルを libs にコピーする。
	※このソース一式には FlexUnit が含まれてるので、DLする必要はない。

■実行方法
rascut -s -c -compiler.library-path+=./libs ./src/TestRunner.mxml
http://localhost:3001 で監視できるので、autotest 相当の事ができる。

なお、現行の FlexUnit のバージョンのせい？なのかわからないけれど、
ore.addListener(new UIListener(testRunner));
の行をコメントアウトしてもコンソールに結果が出力されていない気がする。

■TODO
1.まっとうなテストを作る（ボタン押したとか、そーいうの）

■情報源
http://katapad.com/flash/wiki/index.php?FlexUnit4
http://d.hatena.ne.jp/ActionScript/20091121/fd_flex_unit_4_test

