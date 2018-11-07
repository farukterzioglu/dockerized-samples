using System;

namespace ConsoleApp
{
    public class Greeter
    {
        public string GreetText()
        {
            return "Hello World!";
        }
    }

    class Program
    {
        private static readonly Greeter greeter = new Greeter();

        static void Main(string[] args)
        {
            var greetText = greeter.GreetText();
            Console.WriteLine(greetText);
        }
    }
}
