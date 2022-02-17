using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CSfunMultiArray
{
    class Program
    {
        static void Main(string[] args)
        {
            //declare 2d array
            string[,] matrix;

            //declare 3d array
            int[,,] threeD;


            //two d array
            int[,] array2d = new int[,]
            {
                {1,2,3},//row 0
                {4,5,6},//row 1
                {7,8,9},//row 2
            };
            Console.WriteLine("central value is {0}", array2d[1, 1]);
            Console.WriteLine("central value is {0}", array2d[2, 0]);

            //2d
            int[,] array2d1 = { { 1, 2 }, { 3, 4 } };
            //3d
            string[,,] array3D = new string[,,]
            {
                {
                    {"000","001"},
                    {"010","011"},
                  { "hi there","whats up"}
               },
            {
                {"100","101"},
                {"110","111"},
               {"Another One","Last Entry"}
            }
        };
            Console.WriteLine("central value is {0}", array3D[1, 1,0]);
            Console.WriteLine("central value is {0}", array3D[1, 2,1]);

            //2d
            string[,] array2dString = new string[3, 2] { { "one", "two" }, { "three", "four" }, { "five", "six" } };
            //values update
            array2dString[1, 1] = "chicken";
            Console.WriteLine("central value is {0}", array2dString[1, 1]);

            //Finding Dimension
            int dimenstion = array3D.Rank;
            Console.WriteLine(dimenstion);
        }
    }
}
