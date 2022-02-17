using person.Math;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace person
{
    internal class Program
    {
        static void Main(string[] args)
        {
            var john = new Person();
            john.FirstName = "john";
            john.LastName = "smith";
            john.Introduce();
            Calculator calculator = new Calculator();
            var result=calculator.Add(20, 21);
            System.Console.WriteLine("i am  " + result + " year old");
            
            //Array
            var number = new int[3];
            number[0] = 1;
            number[1] = 2;
            number[2] = 3;
            System.Console.WriteLine(number[0]);
            System.Console.WriteLine(number[1]);
            System.Console.WriteLine(number[2]);

            var names = new string[3] { "jack", "john", "mary" };
            System.Console.WriteLine(names[0]);
            System.Console.WriteLine(names[1]);
            System.Console.WriteLine(names[2]);

            //String
            var fname = "satyam";
            string lname = "raut";
            var fullname = fname + " " + lname;
            var myfullname = string.Format("My Name is {0}{1}", fname, lname);


            var name = new string[3] { "john", "jack", "mary" };
            var formattedname = string.Join(",", name);

            System.Console.WriteLine(formattedname);

            var text = @"hi john 
                        lookng  into the following paths
                        :\folder\folder1";
            System.Console.WriteLine(text);


        }
    }
}
