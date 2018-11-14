


using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using OnlineShoppingLibrary;
using OnlineShoppingServices.Models.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Category = OnlineShoppingServices.Models.DB.Category;

namespace OnlineShoppingApplication.Models
{          
           public class SearchService
           {
          SearchService service;
           public HttpContext context;
           HttpClient client;
           public SearchService()
           {
            client = new HttpClient();
            client.BaseAddress = new Uri("http://localhost:65141/");
           }
           public List<Category> Getcategories()
           {
            
           // HttpContent content = new StringContent(json, Encoding.UTF8, "application/json");
            HttpResponseMessage response = client.GetAsync("Search/Category").Result;
            string json = response.Content.ReadAsStringAsync().Result;
            List<OnlineShoppingServices.Models.DB.Category> categories = JsonConvert.DeserializeObject<List<Category>>(json);
            return categories;
           }

            public List <Product> GetProducts(Subcategory subcategory )

        {

            string json = "";
            byte[] ary;
            bool isavailable = context.Session.TryGetValue("CatSubCat", out ary);
            json = JsonConvert.SerializeObject(subcategory);
            if (isavailable == false)
            {
                context.Session.SetString("CatSubCat", json);
            }
            HttpContent content = new StringContent(json, Encoding.UTF8, "application/json");
            HttpResponseMessage response = client.PostAsync("Search/GetProducts",content).Result;
             json = response.Content.ReadAsStringAsync().Result;
             List<OnlineShoppingServices.Models.DB.Product > products = JsonConvert.DeserializeObject<List<Product >>(json);
            return products;

        }

        [ErrorFilter]

        public void AddToCart(ProductViewModel model)
           {
            List<ProductViewModel> serializedObjects;
            string json="";
            byte[] ary;
           json= context.Session.GetString("CatSubCat");
            Subcategory subcategory = JsonConvert.DeserializeObject<Subcategory>(json);
            bool isavailable = context.Session.TryGetValue("Cart",out ary);
            if(isavailable==false)
            {
                serializedObjects= new List<ProductViewModel>();
                serializedObjects.Add(model);
                json = JsonConvert.SerializeObject(serializedObjects);
                context.Session.SetString("Cart", json);
            }
            else
            {
                json = context.Session.GetString("Cart");
                serializedObjects= JsonConvert.DeserializeObject<List<ProductViewModel>>(json);
                serializedObjects.Add(model);
                json = JsonConvert.SerializeObject(serializedObjects);
                context.Session.SetString("Cart", json);
            }
           
        }

        [ErrorFilter]
        public List<ProductViewModelCart> ProductCart()
        {
 
           // List<ProductViewModelCart> serializedObjects;
            string json = "";
            byte[] ary;
            bool isavailable = context.Session.TryGetValue("Cart", out ary);
            json = context.Session.GetString("Cart");
            //serializedObjects = JsonConvert.DeserializeObject<List<ProductViewModelCart>>(json);
           
        List<ProductViewModelCart> list = JsonConvert.DeserializeObject<List<ProductViewModelCart>>(json);

            List<ProductViewModelCart> result = (from c in list
                                                 select new ProductViewModelCart()
                                                 {
                                                     CategoryId = c.CategoryId,
                                                     Price = c.Price,
                                                     ProductId = c.ProductId,
                                                     Quantity = c.Quantity,
                                                     SubCategoryId = c.SubCategoryId,
                                                     Title = c.Title,
                                                     Image = c.Image
                                                 }).ToList();

            return result;
        }
        public List<ProductViewModelCart> ProcessOrder()

        {

            string json = "";
            byte[] ary;
            bool isavailable = context.Session.TryGetValue("Cart", out ary);
            json = context.Session.GetString("Cart");
           

            List<ProductViewModelCart> list = JsonConvert.DeserializeObject<List<ProductViewModelCart>>(json);

            List<ProductViewModelCart> result = (from c in list
                                                 select new ProductViewModelCart()
                                                 {
                                                     CategoryId = c.CategoryId,
                                                     Price = c.Price,
                                                     ProductId = c.ProductId,
                                                     Quantity = c.Quantity,
                                                     SubCategoryId = c.SubCategoryId,
                                                     Title = c.Title,
                                                     Image = c.Image
                                                 }).ToList();

            return result;
        }
        public List<ProductViewModelCart> COD()
        {

            string json = "";
            byte[] ary;
            bool isavailable = context.Session.TryGetValue("Cart", out ary);
            json = context.Session.GetString("Cart");


            List<ProductViewModelCart> list = JsonConvert.DeserializeObject<List<ProductViewModelCart>>(json);

            List<ProductViewModelCart> result = (from c in list
                                                 select new ProductViewModelCart()
                                                 {
                                                     CategoryId = c.CategoryId,
                                                     Price = c.Price,
                                                     ProductId = c.ProductId,
                                                     Quantity = c.Quantity,
                                                     SubCategoryId = c.SubCategoryId,
                                                     Title = c.Title,
                                                     Image = c.Image
                                                 }).ToList();

            return result;
        }
        public int saveDetails(string paymode,ProductViewModelCart[] p)
        {
           
            return 1;
        }
    } 

}
