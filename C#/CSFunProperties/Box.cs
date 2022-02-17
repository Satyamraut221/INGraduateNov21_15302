using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CSFunProperties
{
    class Box
    {
        //members variable
        private int length = 3;
        private int height;
        // public int width;
        //public int volume;
        private int volume;

        public Box (int length,int height,int Width)
        {
            this.length = length;
            this.height = height;
            this.Width = Width;
        }


        //create properties
        public int Width { get; set; }
        //create properties
        public int Height
        {
            get
            {
                return height;
            }
            set
            {
                if(value < 0) 
                {
                    height = -value;
                }
                else
                {
                    height = value;
                }
                

            }
        }

        public int Volume
        {
            get
            {
                return this.length * this.height * this.Width;
            }
            
        }



        //setter
        public void SetLength(int length)
        {
            if(length < 0)
            {
                throw new Exception("Length should be higer then 0");
            }
            this.length = length;
        } 

        public int GetLength()
        {
            return this.length;
        }
        /*public int GetVolume()
        {
            return this.length * this.height * this.Width;
        }*/
        public int FrontSurface
        {
            get
            {
                return height * length;
            }
        }
        public void DisplayInfo()
        {
            Console.WriteLine("length is {0} height is {1} width is {2} volume is {3}",
                length,height, Width, volume= length * height * Width);
        }
    }
}
