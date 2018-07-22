using System;
using System.Threading;

namespace engineApp
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("engineApp is up");
            while (true)
            {
                Console.Write(".");
                Thread.Sleep(1000);
            }
        }
    }
}
