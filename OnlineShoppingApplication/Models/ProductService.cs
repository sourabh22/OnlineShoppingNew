using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using OnlineShoppingLibrary;
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
        public HttpContext context;
        HttpClient client;
        public ProductService()
        {
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
    }
}
