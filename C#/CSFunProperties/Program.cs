using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CSFunProperties
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Box box = new Box(3,4,5);
           /* //  box.length = 3;
            box.SetLength(5);
           //using properties
            box.Height = -4;
            box.Width = 5;*/
            Console.WriteLine("box Width is " + box.Width);
            box.Width = 10;
            Console.WriteLine("box Width is " + box.Width);

            Console.WriteLine("box volume is "+box.Volume);
            box.DisplayInfo();
            Console.WriteLine("frontSurface {0}",box.FrontSurface);
        }
    }
}
