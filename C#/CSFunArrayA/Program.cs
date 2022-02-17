using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CSFunArrayA
{
     class Program
    {
        static void Main(string[] args)
        {
            int[] grades = new int[5];
            grades[0] = 10;
            grades[1] = 13;
            grades[2] = 15;
            grades[3] = 17;
            grades[4] = 19;

            Console.WriteLine("grades at index 0 : {0}",grades[0]);

            string input = Console.ReadLine();
            grades[0] = int.Parse(input);
            Console.WriteLine("grades at index 0 : {0}", grades[0]);

            int[] gradesOfmathA = { 21, 69, 54, 67, 97 };
            Console.WriteLine(gradesOfmathA.Length);


            int[] gradesOfmathB = new int[] {76, 12, 34, 56, 88, 98 };
            Console.WriteLine(gradesOfmathB.Length);
            Console.ReadLine();

        }
    }
}
