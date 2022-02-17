using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CSfunArray
{
     class Program
    {
        static void Main(string[] args)
        {
            var numbers = new int[] { 3, 4, 6, 8, 1, 2 };
            //Length
            Console.WriteLine("Length: " + numbers.Length);

            //Indexof()
            var index=Array.IndexOf(numbers, 1);
            Console.WriteLine("index of 1 is : "+index);

            //Clear()
            Array.Clear(numbers, 0, 4);//(arrayName, startingIndex,endingIndex)

            Console.WriteLine("effect of clear()");
            foreach(var n in numbers)
                Console.WriteLine(n);

            //copy 
            int[] anotherOne = new int[3];
            Array.Copy(numbers, anotherOne, 3);
            Console.WriteLine("anotherOne array");
            foreach(var m in anotherOne)
                Console.WriteLine(m);

            //sort()
            var numbers1 = new int[] { 3, 4, 6, 8, 1, 2 };
            Array.Sort(numbers1);
            Console.WriteLine("Sorted Array:");
            foreach(var c in numbers1)
                Console.WriteLine(c);

            //reverse
            Array.Reverse(numbers1);
            Console.WriteLine("reverse Array");
            foreach(var s in numbers1)
                Console.WriteLine(s);

        }
    }
}
