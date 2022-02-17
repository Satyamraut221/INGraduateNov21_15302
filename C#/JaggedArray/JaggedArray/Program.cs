using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace jaggerArray
{
    class Program
    {
        static void Main(string[] args)
        {
            int[][] jaggedArray = new int[3][];

            jaggedArray[0] = new int[5];
            jaggedArray[1] = new int[3];
            jaggedArray[2] = new int[2];

            jaggedArray[0] = new int[] { 1, 2, 3, 4, 5 };
            jaggedArray[1] = new int[] { 9, 8, 7 };
            jaggedArray[2] = new int[] { 6, 7 };

            //alternative way
            int[][] jaggedArray1 = new int[][]
            {
                 new int[] { 1, 2, 3, 4, 5 },
                 new int[] { 9, 8, 7 },
                 new int[] { 6, 7 }
        };
            Console.WriteLine(jaggedArray1[0][2]);
            Console.WriteLine("----------------------------------");

            for(int i = 0; i < jaggedArray1.Length; i++)
            {
                for(int j = 0; j < jaggedArray1[i].Length; j++)
                {
                    Console.WriteLine(jaggedArray1[i][j]);
                }            
            }
            Console.WriteLine("----------------------------------");
            string[] joesFamily = new string[] { "Martha", "Roberts" };

            string[][] friendsAndFamily = new string[][]
            {
                new string[] {"Michael","Sandy"},
                new string[] {"Frank","Claudia"},
                new string[]{"Andrew","Kim"},
                joesFamily
            };
            Console.WriteLine("hi {0},i would like to introduce {1} to you.",friendsAndFamily[0][0],friendsAndFamily[1][0]);
            Console.WriteLine("hi {0},i would like to introduce {1} to you.",friendsAndFamily[1][1],friendsAndFamily[2][0]);
            Console.WriteLine("hi {0},i would like to introduce {1} to you.",friendsAndFamily[0][0],friendsAndFamily[2][1]);
            Console.WriteLine("hi {0},i would like to introduce {1} to you.",friendsAndFamily[2][1],joesFamily[1]);

        }
    }
}