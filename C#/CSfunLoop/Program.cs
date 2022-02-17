using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CSfunLoop
{
    internal class Program
    {
        static void Main(string[] args)
        {/*
            for(var i = 1; i <= 20; i++)
            {
                if(i%2 == 0)
                {
                    Console.WriteLine(i);
                }
            }
            for(var i = 20; i >= 1; i--)
            {
                if(i%2 == 0)
                {
                    Console.WriteLine(i);
                }*/

            /*var name = "john smith";
            for(var i=0; i < name.Length; i++)
            {
                Console.WriteLine(name[i]);
            }
            
            foreach(var character in name)
            {
                Console.WriteLine(character);
            }*/
            /*var numbers = new int[] { 1, 2, 3, 4, 5 };
            foreach(var number in numbers)
            {
                Console.WriteLine(number);
            }*/

            //while loop
            /*var i = 0;
            while (i <= 10)
            {
                if(i%2 == 0)
                {
                    Console.WriteLine(i);
                i++;

                }*/

            /*while (true)
            {
                Console.WriteLine("type your name");
                var input = Console.ReadLine();
                if (!string.IsNullOrWhiteSpace(input))
                {
                    Console.WriteLine("@Echo:" + input);
                    continue;
                }
                break;
            }*/

            //random
            var random = new Random();
            const int passwordlength = 10;
            var buffer = new char[passwordlength];
            for (var i = 0; i < passwordlength; i++)
                buffer[i] = (char)('a' + random.Next(0, 26));
            var password = new string(buffer);
            Console.WriteLine(password);            
        }
    }
}
