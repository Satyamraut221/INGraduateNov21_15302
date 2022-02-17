using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FirstClass
{
     class Human
    {
        
            private string firstName;
            public string lastName;
        private string eyeColor;
        private int age;

        //counstructor
        public Human(string myFirstName, string lastName,string eyeColor, int age)
        {
            firstName = myFirstName;
            this.lastName = lastName;
            this.eyeColor = eyeColor;
            this.age = age;
        }
        //default constructor
         public Human()
        {
            Console.WriteLine("new object is created by constructor");
        }

        public Human(string myFirstName, string lastName, string eyeColor)
        {
            firstName = myFirstName;
            this.lastName = lastName;
            this.eyeColor = eyeColor;
        }
        public Human(string firstName,string lastName,int age)
        {
            this.firstName = firstName;
            this.lastName = lastName;
            this.age = age;

        }
        public Human(string lastName)
        {
            this.lastName = lastName;

        }

        public void InstroducesMyself()
            {
            if(age != 0 && lastName != null && eyeColor != null && firstName !=null)
            Console.WriteLine("Hi, I'm {0} {1}  My eye color is {2} {3} years old", firstName,lastName,eyeColor,age);
            else if (age != 0 && lastName != null && firstName != null)
            {
                Console.WriteLine("Hi, I'm {0} {1} and {2} year old ", firstName, lastName,age);

            }
            else if (lastName != null && firstName != null)
            {
                Console.WriteLine("Hi, I'm {0} {1}", firstName, lastName);

            }
            else if (firstName != null)
            {
                Console.WriteLine("Hi, I'm {0}", firstName);

            }
        }
        
    }
}
