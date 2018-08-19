using DotNetCore.Jenkins.Controllers;
using System;
using Xunit;

namespace DotNetCore.Jenkins.Tests
{
    public class ValuesControllerTests
    {
        [Fact]
        public void Get_Test()
        {
            var controller = new ValuesController();

            var actual = controller.Get(10).Value;

            var expected = "value";

            Assert.Equal(expected, actual);

        }
    }
}
