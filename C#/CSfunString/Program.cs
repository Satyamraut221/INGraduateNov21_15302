using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CSfunString
{
    internal class Program
    {
        static void Main(string[] args)
        {
            var fullName = "Satyam Raut ";
            Console.WriteLine("Trim: '{0}'",fullName.Trim());
            Console.WriteLine("ToUpper: '{0}'",fullName.Trim().ToUpper());

            var index = fullName.IndexOf(' ');
            var firstname = fullName.Substring(0, index);
            var lastname = fullName.Substring(index + 1);
            Console.WriteLine("firsname: "+ firstname);
            Console.WriteLine("lastname: "+ lastname);
            
            //spilt
            var names = fullName.Split(' ');
            Console.WriteLine("firstname: "+ names[0]);
            Console.WriteLine("lastname: "+ names[1]);

            //replace
            Console.WriteLine(fullName.Replace("Satyam","Sharad"));

            if(string.IsNullOrWhiteSpace(" "))
                Console.WriteLine("Invalid");

            //converting
            var str = "21";
           var age = Convert.ToByte(str);
            Console.WriteLine(age);

            float price = 29.95f;
            Console.WriteLine(price.ToString("C0"));


            //StringBulider
            var builder = new StringBuilder();
            builder.Append('-', 10);
            builder.AppendLine();
            builder.Append("Header");
            builder.AppendLine();
            builder.Append('-', 10);
            builder.Replace('-', '+');
            builder.Remove(0, 8);
            builder.Insert(0, new string('-', 8));

            Console.WriteLine(builder);            



        }
    }
}
