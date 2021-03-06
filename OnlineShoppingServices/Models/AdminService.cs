﻿using OnlineShoppingLibrary;
using OnlineShoppingServices.Models.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace OnlineShoppingServices.Models

{
    public class AdminService

    {
        OnlineShoppingDbContext context;

        public AdminService()
        {
            context = new OnlineShoppingDbContext();
        }


        public int SignUp(Customer customer)
        {
            var result = (from c in context.Customer where c.Email == customer.Email select c).Any();
            var check = result;

            if (check == false)
            {
                context.Customer.Add(customer);
                int entry = context.SaveChanges();
                return entry;
            }

            return 0 ;
           
        }

        public int Authenticate(Credentials credentials)
        {
            var result = (from c in context.Customer
                          where c.Email == credentials.Email && c.Password == credentials.Password
                          select c.CustomerId).FirstOrDefault();

            return result;
        }
    }
}
