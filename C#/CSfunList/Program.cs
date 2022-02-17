using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CSfunList
{
    internal class Program
    {
        static void Main(string[] args)
        {
            var numbers = new List<int>() { 1, 2, 3, 4, 5, 6, 7, 8 };
            numbers.Add(9);
            numbers.AddRange(new int[3] { 4, 7 ,1});
            foreach(var m in numbers)
                Console.WriteLine(m);
            Console.WriteLine("----------");
            Console.WriteLine("index of 1: "+numbers.IndexOf(1));
            Console.WriteLine("Lastindex of 1: " + numbers.LastIndexOf(1));

            Console.WriteLine("Count: " + numbers.Count);
           
            /*numbers.Remove(1);
            foreach(var r in numbers)
                Console.WriteLine(r);*/


            for(var i = 0; i < numbers.Count; i++)
            {
                if (numbers[i] == 1)
                    numbers.Remove(numbers[i]);
            }
            foreach(var number in numbers)
                Console.WriteLine(number);

            //clear to remove all
            numbers.Clear();
            Console.WriteLine("count"+ numbers.Count);




        }
    }
}
