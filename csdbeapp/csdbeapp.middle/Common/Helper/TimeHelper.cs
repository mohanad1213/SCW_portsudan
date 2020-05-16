using System;
using System.Collections.Generic;
using System.Text;

namespace csdbeapp.middle.Common.Helper
{
    public class TimeHelper
    {
       
        public DateTime ConvertFromUnixTime(double UnixTime)
        {
            /*   long time = UnixTime; // Unix time in microseconds.

               time /= 1000; // Divide by 1,000 because we need milliseconds, not microseconds.

               DateTime result = DateTimeOffset.FromUnixTimeMilliseconds(time).DateTime; */


              
            System.DateTime dtDateTime = new System.DateTime(1970, 1, 1, 0, 0, 0, 0);
            dtDateTime = dtDateTime.AddMilliseconds(UnixTime);
            return dtDateTime;
            


         
        }

        public string TimeAgoFromUnixtime(double unixTime)
        {
          
               DateTime dateTime = ConvertFromUnixTime(unixTime);
            string result = string.Empty;
            string Before = "";
            string Second = "ثانية";
            string Minutes = "دقيقة";
            string Minute = "دقيقة";
            string Hours = "ساعة";
            string Hour = "ساعة";

            string Days = "يوم";
            string Yesterday = "امس";

            var timeSpan = DateTime.UtcNow.Subtract(dateTime);


            if (timeSpan <= TimeSpan.FromSeconds(60))
            {
                result = string.Format(Before + " {0} " + Second, timeSpan.Seconds);
            }


            else if (timeSpan <= TimeSpan.FromMinutes(60))
            {
                result = timeSpan.Minutes > 1 ?
                    String.Format(Before + " {0} " + Minutes, timeSpan.Minutes) :
                   Before + " " + Minute;
            }
            else if (timeSpan <= TimeSpan.FromHours(24))
            {
                result = timeSpan.Hours > 1 ?
                    String.Format(Before + " {0} " + Hours, timeSpan.Hours) :
                    Before + " " + Hour;
            }
            else
            {
                result = timeSpan.Days > 1 ?
                    String.Format(Before + " {0}  " + Days, timeSpan.Days) :
                   Yesterday;
            }




            return result;
        }
    }
}
