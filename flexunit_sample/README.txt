実行方法
rascut -s -c -compiler.library-path+=./libs ./src/TestRunner.mxml
http://localhost:3001 で監視できるので、autotest 相当の事ができる。

なお、現行の FlexUnit のバージョンのせい？なのかわからないけれど、
ore.addListener(new UIListener(testRunner));
の行をコメントアウトしてもコンソールに結果が出力されていない気がする。

TODO:テストスイートを作る。

