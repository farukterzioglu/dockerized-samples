using System;
using consoleAppNetCore.ConsoleApp;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace consoleAppNetCore.Tests
{
    [TestClass]
    public class GreeterTests
    {
        [TestMethod]
        public void TestGreetText()
        {
            var greeter = new Greeter();
            var text = greeter.GreetText();

            Assert.AreEqual("Hello World!", text);
        }
    }
}
