


using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Routing;
using Newtonsoft.Json;
using OnlineShoppingApplication.Models;
using OnlineShoppingServices.Models.DB;
using System.Collections.Generic;
using System.Linq;

namespace OnlineShoppingApplication.Controllers
{  
    public class ProductController : Controller
    {
        SearchService searchService;

        public ProductController()
    {
            searchService = new SearchService();
    }
        [ErrorFilter]
        public IActionResult GetProducts(Subcategory subCategory)
        {
            searchService.context = HttpContext;
            var result = searchService.GetProducts(subCategory);
            List<ProductViewModel> model = (from p in result select new ProductViewModel() {
                 CategoryId=p.CategoryId.Value,
                 Price=p.Price.Value,
                 ProductId=p.ProductId,
                 SubCategoryId=p.SubCategoryId.Value, Title=p.Title,
                 Image=p.Image
                   
            }).ToList();
            ViewData["products"] = model;
            return View();
        }
        [ErrorFilter]
        [HttpPost]
            public IActionResult AddToCart(ProductViewModel model)
            {
                searchService.context = HttpContext;
          //      var result = HttpContext.Session.GetString("Cart");
                searchService.AddToCart(model);
            string json = HttpContext.Session.GetString("CatSubCat");
            Subcategory subcategory = JsonConvert.DeserializeObject<Subcategory>(json);
               return RedirectToAction("GetProducts",subcategory);

               
            }

        [ErrorFilter]
        public IActionResult ProductCart()
        {
            searchService.context = HttpContext;
            var result=searchService.ProductCart();
            ViewData["products"] = result;
            return View(result); 
        }

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

        public IActionResult ProcessToPay()
        {
            return View();
        }
        public IActionResult COD(ProductViewModelCart[] products)
        {


            searchService.context = HttpContext;
            var result = searchService.ProductCart();
            ViewData["products"] = result;
            return View(result);
        }
    }


    }
