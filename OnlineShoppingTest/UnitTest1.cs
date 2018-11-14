using Microsoft.AspNetCore.Mvc;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using OnlineShoppingApplication.Controllers;
using OnlineShoppingLibrary;

using OnlineShoppingServices.Controllers;
using OnlineShoppingServices.Models;
using OnlineShoppingServices.Models.DB;
using System;
using System.Linq;

namespace OnlineShoppingTests
{
    [TestClass]
    public class OnlineShoppintTests
    {
        static int CustomerId;
        AdminServiceController controllerservice;
        SearchServiceController controller;
        AdminController controller1;
        ProductserviceController proservice;
        static  OnlineShoppingDbContext context;


        public OnlineShoppintTests()
        {
            context = new OnlineShoppingDbContext();
           controller = new SearchServiceController(context);
            controller1 = new AdminController();
            proservice = new ProductserviceController();
            controllerservice = new AdminServiceController();
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
            CustomerId = obj.CustomerId;
            Assert.IsInstanceOfType(result, typeof(ViewResult));

            Assert.AreEqual("SignUpSuccess", result.ViewName);
        }


       [TestMethod]

            public void LoginTestMethod()

         { 
            Credentials cre = new Credentials()
            {
                Email = "so@123.com",
                Password = "123"
            };

            var result = controllerservice.Authenticate(cre);
            Assert.IsInstanceOfType(result, typeof(OkObjectResult));
        }

        [TestMethod]

        public void EmailWrongTestMethod()

        {
            Credentials cre = new Credentials()
            {
                Email = "s@123.com",
                Password = "123"
            };

            var result = controllerservice.Authenticate(cre);
            Assert.IsInstanceOfType(result, typeof(NotFoundResult));
        }


        public void PasswordWrongTestMethod()

        {
            Credentials cre = new Credentials()
            {
                Email = "so@123.com",
                Password = "1234"
            };

            var result = controllerservice.Authenticate(cre);
            Assert.IsInstanceOfType(result, typeof(NotFoundResult));
        }

        public void BothWrongTestMethod()

        {
            Credentials cre = new Credentials()
            {
                Email = "s@123.com",
                Password = "1234"
            };

            var result = controllerservice.Authenticate(cre);
            Assert.IsInstanceOfType(result, typeof(NotFoundResult));
        }

        public void NullLoginTestMethod()
           {
            Credentials cre = new Credentials()
            {
                Email = "",
                Password = ""
            };

            var result = controllerservice.Authenticate(cre);
            Assert.IsInstanceOfType(result, typeof(NotFoundResult));
        }


        [TestMethod]
        public void ProductTestMethod()
        {
            Subcategory pro = new Subcategory()
            {
                CategoryId = 100,
                SubCategoryId=100
           };
            var result = controller.GetProducts(pro);
            Assert.IsInstanceOfType(result, typeof(OkObjectResult));

        }

        [TestMethod]
        public void PlaceorderTestMethod()
        {
           
        }








        [ClassCleanup]
        public static void CleanUp()
        {
            var customer=context.Customer.SingleOrDefault(c => c.CustomerId == CustomerId);
            context.Customer.Remove(customer);
            context.SaveChanges();
        }
       
    }
}
