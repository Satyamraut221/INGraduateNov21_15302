using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace @CSfunda
{
    public enum ShippingMethod
    {
        RegulaAirMail=1,
        RegisterAirMail=2,
        Express=3
    }
    internal class Program
    {
        static void Main(string[] args)
        {
            var method = ShippingMethod.Express;
            Console.WriteLine((int)method);

            var methodid = 3;
            Console.WriteLine((ShippingMethod)methodid);
            Console.WriteLine(method.ToString());

            var methodName = "Express";
            var shippingmethod=(ShippingMethod)Enum.Parse(typeof(ShippingMethod),methodName);

            var a = 10;
            var b = a;
            b++;
            Console.WriteLine(String.Format("a:{0},b:{1}",a,b));//10 ,11
            var array1 = new int[3] { 1, 2, 3 };
            var array2 = array1;
            array1[0] = 0;
            Console.WriteLine(array1[0]);//0
        }
    }
}
