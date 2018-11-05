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
    public class AdminService
    {
        HttpClient client;
        public AdminService()
        {
            client = new HttpClient();
            client.BaseAddress = new Uri("http://localhost:65141/");
        }
        public void SignUp(Customer customer)
        {
            string json = JsonConvert.SerializeObject(customer);
            HttpContent content = new StringContent(json, Encoding.UTF8, "application/json");
            HttpResponseMessage response = client.PostAsync("AdminService/SignUp", content).Result;
        }

        public int Authenticate(Credentials credentials)
        {
            string customerId;
            string json = JsonConvert.SerializeObject(credentials);
            HttpContent content = new StringContent(json, Encoding.UTF8, "application/json");
            HttpResponseMessage response = client.PostAsync("AdminService/Login", content).Result;

        if (response.IsSuccessStatusCode ==true)
             {
                customerId = response.Content.ReadAsStringAsync().Result;
                return 1;
             }

            return 0;
        }

    }

}
