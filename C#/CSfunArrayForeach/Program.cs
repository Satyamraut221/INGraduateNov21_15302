using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CSfunArrayForeach
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int[] nums = new int[10];
            for(int i = 0; i < nums.Length; i++)
            {
                nums[i] = i + 10;
            }
            for(int j=0;j<nums.Length;j++)
            {
                Console.WriteLine("Element {0} = {1} ",j,nums[j]);
            }
            Console.WriteLine("-------------------------------------------");
            int counter = 0;
            foreach(int k in nums)
            {
                Console.WriteLine("Element {0} = {1} ", counter++, k);
            }
            Console.WriteLine("-------------------------------------------");

            int no = 0;
            string[] friends ={ "rohit", "sid", "omkar", "madhav", "mac" };
            foreach(string name in friends)
            {
                Console.WriteLine(" Hi There my friend {0}",name);
            }
        }
    }
}
