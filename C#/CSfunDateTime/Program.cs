using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CSfunDateTime
{
    internal class Program
    {
        static void Main(string[] args)
        {
            var datetime = new DateTime(2021, 1, 21);
            var now = DateTime.Now;
            var today = DateTime.Today;
            Console.WriteLine("today: " +today);
            Console.WriteLine("Hour: "+ now.Hour);
            Console.WriteLine("Minute: "+ now.Minute);

            var tomrrow = now.AddDays(1);
            var yesterday = now.AddDays(-1);

            Console.WriteLine(now.ToLongDateString());
            Console.WriteLine(now.ToLongTimeString());
            Console.WriteLine(now.ToShortDateString());
            Console.WriteLine(now.ToShortTimeString());
            Console.WriteLine(now.ToString("M"));

            //TimeSpan
            var timespan = new TimeSpan(1, 2, 3);//hour,min,sec
            var timespan1 = new TimeSpan(1, 0, 0);
            var timespan2 = TimeSpan.FromHours(1);

            var start = DateTime.Now;
            var end = DateTime.Now.AddMinutes(2);
            var duration = end - start;
            Console.WriteLine(duration);

            //timespan propeties
            Console.WriteLine("min: "+ timespan.Minutes);
            Console.WriteLine("Total min: "+ timespan.TotalMinutes);

            //Add
            Console.WriteLine("Add Ex :" + timespan.Add(TimeSpan.FromMinutes(10)));
            Console.WriteLine("Subtract Ex :" + timespan.Subtract(TimeSpan.FromMinutes(10)));

            //toString
            Console.WriteLine("Tostring: "+ timespan.ToString());

            //parse
            Console.WriteLine("Parse: " + TimeSpan.Parse("03:01:04"));


        }
    }
}
