using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace CSfunFilesinfo
{
    internal class Program
    {
        static void Main(string[] args)
        {
        var Path1= @"c:\somefile.jpg";
           File.Copy(@"c:\temp\myfile.jpg", @"d:\temp\myfile.jpg", true);
            File.Delete(Path1);
            if (File.Exists(Path1))
            {
                //
            }
           var content= File.ReadAllText(Path1);
            //fileinfo
            var fileinfo1 = new FileInfo(Path1);
            //directory
            Directory.CreateDirectory(@"c:\temp\folder1");
            var files = Directory.GetFiles(@"c:\project\CSfun", "*.s1n*", SearchOption.AllDirectories);
            foreach(var file in files)
            {
                Console.WriteLine(file);
            }
            var directories = Directory.GetDirectories(@"c:\project\CSfun", "*.*", SearchOption.AllDirectories);
            foreach(var directory in directories)
            {
                Console.WriteLine(directory);
            }

            //path
            var path = @"c:\project\CSfunFileinfo.sln";
            Console.WriteLine(Path.GetExtension(path)); //sln
            Console.WriteLine(Path.GetFileName(path)); 
            Console.WriteLine(Path.GetFileNameWithoutExtension(path)); 
            Console.WriteLine(Path.GetDirectoryName(path)); 

        }
    }
}
