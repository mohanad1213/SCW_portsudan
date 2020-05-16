using System;
using Xunit;
using csdbeapp.middle.Common.Helper;
using Xunit.Abstractions;
using csdbeapp.middle.Repository;

namespace csdbeapp.middle.test.RepositoryTests
{
    public class NewsRepoTest
    {
        [Theory]
        [InlineData(1)]
         void GetAllShouldReturnAllNews(int newsCount)
        {
            var list = new NewsRepo().GetAll();
            Assert.True(list.Count == newsCount);
        
        }


        [Theory]
        [InlineData(33)]
        void GetBookOutOfRangeShouldReturnArgumentNullException(long id)
        {
            var list = new NewsRepo().GetAll();
         
            Assert.Throws<Exception>(() => { new NewsRepo().Get(id); });
        }
    }
}
