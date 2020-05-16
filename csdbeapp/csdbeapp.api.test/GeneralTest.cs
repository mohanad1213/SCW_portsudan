using System;
using Xunit;
using csdbeapp.middle.Common.Helper;
using Xunit.Abstractions;

namespace csdbeapp.middle.test
{
    public class GeneralTest
    {
        private readonly ITestOutputHelper output;

        public GeneralTest(ITestOutputHelper output)
        {
            this.output = output;
        }

        [Fact]
        
        public void TimeAgoTest()
        {
            TimeHelper timeHelper = new TimeHelper();
            

            double UnixDate = 1587806837897;

           DateTime Datetime = timeHelper.ConvertFromUnixTime(UnixDate);


          output.WriteLine(Datetime.ToString());

            string timeAgoResult = timeHelper.TimeAgoFromUnixtime(UnixDate);
             output.WriteLine(timeAgoResult);
            
        }

        //[Theory]
        //public void TestTheory()
        //{
            
        //}
    }
}
