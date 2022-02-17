using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FirstClass
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Human danis = new Human("satyam", "Raut","blue",26);
            
            danis.InstroducesMyself();
/*
            Human NewHuman = new Human();
            NewHuman.firstName = "cane";
            NewHuman.lastName = "tean";
            NewHuman.InstroducesMyself();*/

            Human sissy = new Human("sissy", "wagner","blue");
            sissy.InstroducesMyself();

            Human Cane = new Human("John");
            Cane.InstroducesMyself();

            Human basicHuman = new Human("john","admas","gray",65);
            basicHuman.InstroducesMyself();



        }
    }
}
