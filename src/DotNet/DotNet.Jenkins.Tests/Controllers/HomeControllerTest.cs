using System.Web.Mvc;
using DotNet.Jenkins;
using DotNet.Jenkins.Controllers;
using Xunit;

namespace DotNet.Jenkins.Tests.Controllers
{
    public class HomeControllerTest
    {
        [Fact]
        public void Index()
        {
            // Arrange
            HomeController controller = new HomeController();

            // Act
            ViewResult result = controller.Index() as ViewResult;

            // Assert
            Assert.Null(result);
            Assert.Equals("Home Page", result.ViewBag.Title);
        }
    }
}
