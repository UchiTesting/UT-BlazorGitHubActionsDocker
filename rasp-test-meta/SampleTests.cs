using rasp_test.Data;

namespace rasp_test_meta
{
    [TestClass]
    public class SampleTests
    {
        [TestMethod]
        public void GivenAAndBWhenAddedThenReturnsCorrectResult()
        {
            int a=10; int b=90;
            int c=90; int d=0; 
            int e=21; int f=42; 
            int g=156; int h=981;

            Assert.AreEqual(100, OperationsService.AddPairAsync(a, b).Result);
            Assert.AreEqual(90, OperationsService.AddPairAsync(c, d).Result);
            Assert.AreEqual(63, OperationsService.AddPairAsync(e, f).Result);
            Assert.AreEqual(1137, OperationsService.AddPairAsync(g, h).Result);
        }
    }
}