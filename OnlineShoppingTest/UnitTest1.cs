using Microsoft.AspNetCore.Mvc;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using OnlineShoppingApplication.Controllers;
using OnlineShoppingService.Controllers;
using OnlineShoppingServices.Models.DB;


namespace OnlineShoppingTests
{
    [TestClass]
    public class OnlineShoppintTests
    {
        //noopur comment neha comment
        SearchController controller;
        AdminController controller1;
        OnlineShoppingDbContext context;
        public OnlineShoppintTests()
        {
            context = new OnlineShoppingDbContext();
            controller = new SearchController();
            controller1 = new AdminController();
        }
        //[TestMethod]
        //public void GetCategoryTest()
        //{
        //    var result=controller.GetCategories();
        //    Assert.IsNotNull(result);
        //}
        //[TestMethod]
        //[TestCategory("SubcategoryTest")]
        //public void GetSubCategoryOnValidcategoryIdTest()
        //{
        //   var result = controller.GetSubCategories(100);
        //    Assert.IsNotNull(result);
        //}
        //[TestMethod]
        //[TestCategory("SubcategoryTest")]
        //public void GetSubCategoryOnInvalidcategoryIdTest()
        //{
        //    var result = controller.GetSubCategories(1000);
        //    Assert.AreEqual(0, result.Count);
        //}
        //[TestMethod]
      
        //public void GetProductsTest()
        //{
        //    Subcategory subCategory = new Subcategory() {
        //         CategoryId=101,
        //         SubCategoryId=105
        //    };
        //    var result = controller.GetProducts(subCategory);
        //    Assert.AreEqual(2, result.Count);
        //}
        [TestMethod]
        public void RegisterTestMethod()
        {
            Customer obj = new Customer()
            {
                Name = "sourabh",
                Email = "abc@gmail.com",
                Address = "Delhi",
                Phone = "6766736747",
                Password = "123"
            };
            var result = (ViewResult)controller1.Signup(obj) ;
            Assert.IsInstanceOfType(result, typeof(ViewResult));

            Assert.AreEqual("SignUpSuccess", result.ViewName);
        }
    }
}
