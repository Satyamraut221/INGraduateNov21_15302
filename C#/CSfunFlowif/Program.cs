using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CSfunFlowif
{
    internal class Program
    {
        static void Main(string[] args)
        {
            /*            int hour = 19;
                        if(hour > 0 && hour < 12) 
                        {
                            Console.WriteLine("its morning.");
                        }
                        else if(hour >= 12 && hour < 18)
                        {
                            Console.WriteLine("its afternoon");

                        }
                        else
                        {
                            Console.WriteLine("its night");

                        }
            */
            // bool isgold = false;
            /* float price;
             if (isgold)
             {
                 price = 99.6f;
             }
             else
                 price = 10.0f;*/

            // float price = (isgold) ? 99.9f : 19.9f;
            //Console.WriteLine(price);

            var season = Season.Autumn;
            switch(season)
            {
                case Season.Autumn:
                    Console.WriteLine("its autumn and its beatuful");
                    break;
                case Season.Summer:
                case Season.Spring:
                    Console.WriteLine("its summer and its hot day");
                    break;
                default:
                    Console.WriteLine("no idea what it is ");
                    break;
            }
        }
    }
}
