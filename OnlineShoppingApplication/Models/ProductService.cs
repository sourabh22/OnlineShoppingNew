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

namespace OnlineShoppingApplication.Models
{
    public class ProductService
    {
        OnlineShoppingDbContext context1;
        public HttpContext context;
        HttpClient client;
        public ProductService()
        {
            context1 = new OnlineShoppingDbContext();
            client = new HttpClient();
            client.BaseAddress = new Uri("http://localhost:65141/");
        }
        public ProductViewModelCart[] GetOrderDetails(string paymode, out int InvoiceId)
        {
             InvoiceId=0;
            string json = context.Session.GetString("Cart");
            ProductViewModelCart[] result = JsonConvert.DeserializeObject<ProductViewModelCart[]>(json);
            int customerId = Convert.ToInt32( context.Session.GetString("cid"));
           
            int Tamount=0;
            foreach( var p in result)
            {
                Tamount += (int)p.Price * p.Quantity;
            }

            OrderFinalDetails obj = new OrderFinalDetails();
            obj.Cid = customerId;
            obj.TotalAmount = Tamount;
            obj.PaymentMode = paymode;
            obj.Products = result;
           
            string json1 = JsonConvert.SerializeObject(obj);
            HttpContent content = new StringContent(json1, Encoding.UTF8, "application/json");
            HttpResponseMessage response = client.PostAsync("ProductOrder/PlaceOrder", content).Result;

            if (response.IsSuccessStatusCode)
            {
                InvoiceId = Convert.ToInt32(response.Content.ReadAsStringAsync().Result);
            }
            return result; // product array
        }


        public List<Customer> Getaddress(int cid)
        {
            var result = (from c in context1.Customer where c.CustomerId == cid select c).ToList();
            return result;
        }

        public bool IsCartValid()
        { byte[] ary;
           bool result=  context.Session.TryGetValue("Cart", out ary);
            return result;
        }

    }
}
