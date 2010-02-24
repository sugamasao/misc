package test {
	import org.flexunit.Assert;
	import test.sample.*;
	import test.*;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]   
	public class TestSuiteAll {
		public var t1:CalculateTest;
		public var t2:FlexSampleTest;
	}
}
