namespace rasp_test.Data
{
    public class OperationsService
    {
        public static Task<int> AddPairAsync(int a, int b) => Task.FromResult(a + b);
    }
}
