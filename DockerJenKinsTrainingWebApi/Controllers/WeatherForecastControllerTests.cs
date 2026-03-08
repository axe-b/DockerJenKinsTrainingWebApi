using DockerJenKinsTrainingWebApi.Controllers;
using Xunit;
using Moq;
using Microsoft.Extensions.Logging;
 
using System.Collections.Generic;
using System.Linq;
namespace DockerJenKinsTrainingWebApi.Controllers
{



    public class WeatherForecastControllerTests
    {
        [Fact]
        public void Get_ReturnsFiveWeatherForecasts()
        {
            // Arrange
            var loggerMock = new Mock<ILogger<WeatherForecastController>>();
            var controller = new WeatherForecastController(loggerMock.Object);

            // Act
            var result = controller.Get();

            // Assert
            Assert.NotNull(result);
            var forecasts = result.ToList();
            Assert.Equal(5, forecasts.Count);
            Assert.All(forecasts, f => Assert.NotNull(f.Summary));
        }
    }
}