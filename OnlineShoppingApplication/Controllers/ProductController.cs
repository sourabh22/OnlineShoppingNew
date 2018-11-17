
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Routing;
using Newtonsoft.Json;
using OnlineShoppingApplication.Models;
using OnlineShoppingLibrary;
using OnlineShoppingServices.Models;
using OnlineShoppingServices.Models.DB;
using System;
using System.Collections.Generic;
using System.Linq;

using SearchService = OnlineShoppingApplication.Models.SearchService;

namespace OnlineShoppingApplication.Controllers
{
    public class ProductController : Controller
    {
        SearchService searchService;


        public ProductController()
        {
            searchService = new SearchService();
        }

        //~~~~~~~~~~~~~~~~~~~~~~~GET-PRODUCTS~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

        [ErrorFilter]
        public IActionResult GetProducts(Subcategory subCategory)
        {
            searchService.context = HttpContext;
            var result = searchService.GetProducts(subCategory);  //Control will Redirect to SearchService of Application
            List<ProductViewModel> model = (from p in result
                                            select new ProductViewModel()
                                            {
                                                CategoryId = p.CategoryId.Value,
                                                Price = p.Price.Value,
                                                ProductId = p.ProductId,
                                                SubCategoryId = p.SubCategoryId.Value,
                                                Title = p.Title,
                                                Image = p.Image

                                            }).ToList();

            ViewData["products"] = model;
            return View();
        }


        //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ADD TO CART~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


        [ErrorFilter]
        [HttpPost]
        public IActionResult AddToCart(ProductViewModel model)
        {
            searchService.context = HttpContext;
            //      var result = HttpContext.Session.GetString("Cart");
            searchService.AddToCart(model);
            string json = HttpContext.Session.GetString("CatSubCat");
            Subcategory subcategory = JsonConvert.DeserializeObject<Subcategory>(json);
            return RedirectToAction("GetProducts", subcategory);


        }

        //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~PRODUCT-CART~~~~~~~~~~~~~~~~~~~~~~~~~

        [ErrorFilter]
        public IActionResult ProductCart()
        {
            searchService.context = HttpContext;
            var result = searchService.ProductCart();
            ViewData["products"] = result;
            return View(result);
        }


        //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~INFORMATION WITH PAYMENT MODE~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

        [ErrorFilter]
        public IActionResult ProcessOrder(ProductViewModelCart[] products)
        {
            searchService.context = HttpContext;

            HttpContext.Session.Remove("CatSubCat");
            HttpContext.Session.Remove("Cart");
            string json = JsonConvert.SerializeObject(products);
            HttpContext.Session.SetString("Cart", json);
            var result = searchService.ProcessOrder();
            ViewData["products"] = result;
            return View(result);
        }


        //~~~~~~~~~~~~~~~~~~~~~ CC AND DC VIEW~~~~~~~~~~~~~~~~~~

        public IActionResult ProcessToPay()
        {
            return View();
        }

        //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ MAKE PAYMENT ~~~~~~~~~~~~~~~~~~~~~~~~

        public IActionResult COD(string paymode)
        {
            int InvoiceNo;
            searchService.context = HttpContext;
            ProductService svc = new ProductService();
            svc.context = HttpContext;
            var array = svc.GetOrderDetails(paymode, out InvoiceNo);


            string cid = HttpContext.Session.GetString("cid");
            int customerid = Convert.ToInt32(cid);
            List<Customer> c = svc.Getaddress(customerid);

            //searchService.saveDetails(paymode,result);
            ViewData["products"] = array;
            ViewData["invoiceNo"] = InvoiceNo;
            ViewData["address"] = c;
            return View();

        }
        public IActionResult Remove(int pid)
        {
            string json;
            searchService.context = HttpContext;
            List<ProductViewModelCart> products = searchService.ProductCart();
            // json=HttpContext.Session.GetString("Cart");
            //List<ProductViewModel> products = JsonConvert.DeserializeObject<List<ProductViewModel>>(json);
            for (int i = 0; i < products.Count; i++)
            {
                if (products[i].ProductId == pid)
                {
                    products.RemoveAt(i);
                    break;
                }

            }
            json = JsonConvert.SerializeObject(products);
            HttpContext.Session.SetString("Cart", json);
            ViewData["products"] = products;
            return View("ProductCart");
        }
        public bool IsCartValid()
        {
            ProductService productService = new ProductService();
            productService.context = HttpContext;
            return productService.IsCartValid();

        }
        public IActionResult OrderView()
        {
            return View();
        }
    }


}
