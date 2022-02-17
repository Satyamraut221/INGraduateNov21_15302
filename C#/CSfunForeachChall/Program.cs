using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CSfunForeachChall
{
     class Program
    {
        static void Main(string[] args)
        {
            Boolean valid = false;
            string inputValueType;

            Console.WriteLine("Enter  a value: ");
            string inputValue = Console.ReadLine();

            Console.WriteLine("Select the datatype to validate the input you have entered");
            Console.WriteLine("Press 1 for string");
            Console.WriteLine("Press 2 for Integer");
            Console.WriteLine("Press 3 for Boolean");
            
            
            Console.WriteLine("Enter :");
            int inputtype = Convert.ToInt32(Console.ReadLine());

            switch (inputtype)
            {
                case 1:
                    valid = IsAllAlphabetic(inputValue);
                    inputValueType = "String";
                    break;
                case 2:
                    int retValue = 0;
                    valid = int.TryParse(inputValue, out retValue);
                    inputValueType = "Integer";
                    break;
                case 3:
                    bool retFlag = false;
                    valid = bool.TryParse(inputValue, out retFlag);
                    inputValueType = "Boolean";
                    break;
                default:
                    inputValueType = "unknown";
                    Console.WriteLine("Not able to detect the input type, something is wrong");
                    break;
            }
            Console.WriteLine("You have entered a value : {0}", inputValue);
            if(valid)
            {
                Console.WriteLine("Its valid : {0}", inputValueType);
            }
            else
            {
                Console.WriteLine("it is invalid : {0}", inputValueType);
            }
            Console.ReadKey();
        }
        static bool IsAllAlphabetic(string value)
        {
            foreach(char c in value)
            {
                if (!char.IsLetter(c))
                    return false;
            }
            return true;
        }
    }
}
