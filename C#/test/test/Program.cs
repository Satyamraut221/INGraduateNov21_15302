using System;
using System.Linq;
namespace Reflection
{
    public class Test1
    {
enum color : int
        {
            red,green, blue =5,cyan,magenta=10,yellow  
        }
        public static void Main()
        {
            Console.WriteLine((int)color.green +", ");
            Console.WriteLine((int) color.yellow);
        
        }

    }
}