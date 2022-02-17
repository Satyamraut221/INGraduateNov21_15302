
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
            int[] studentsGrades = new int[] { 15, 16, 6, 14, 19, 11 };

            int[] happiness = { 2, 3, 4, 5, 6 };
            SunisShining(happiness);
            foreach(int y in happiness)
            {
                Console.WriteLine(y);

            }
            Console.WriteLine("--------------------------------");

            double avarageresult =GetAverage(studentsGrades);

            foreach (int i in studentsGrades)
            {
                Console.WriteLine("The stdent Grades {0}",i);
            }
            Console.WriteLine("--------------------------------");
            Console.WriteLine("The Average is : {0} ",avarageresult);



        }
        static double GetAverage(int[] gradesArray)
        {
            int size = gradesArray.Length;
            double average;
            int sum=0;

            for(int i = 0; i < size; i++)
            {
                sum+=gradesArray[i];
            }
            average=(double)sum/size;
            return average;
            
        }
        static void SunisShining(int [] x)
        {
            for (int i = 0; i < x.Length; i++)
                x[i] += 2;
        }
    }
}