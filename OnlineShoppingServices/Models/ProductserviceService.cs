using OnlineShoppingLibrary;
using OnlineShoppingServices.Models.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace OnlineShoppingServices.Models
{
    public class ProductserviceService
    {
           OnlineShoppingDbContext context;
        public ProductserviceService()
        {
            context = new OnlineShoppingDbContext();
        }
          public int PlaceOrder(OrderFinalDetails details)
            {

                Ordertable order = new Ordertable();
                order.TotalAmount = details.TotalAmount;
                order.CustomerId = details.Cid;
                order.OrderDate = DateTime.Now;
                order.CategoryId = details.Products[0].CategoryId;

            context.Ordertable.Add(order);
            context.SaveChanges();
            //~~~~~~~~~~~~~~~~~~OrderDetails table~~~~~~~~~~~~~~~~~~~~~~

            Orderdetails[] products = new Orderdetails[details.Products.Length];
            for (var i=0;i<details.Products.Length;i++)
            {
                products[i] = new Orderdetails() {
                    OrderId = order.OrderId,
                    Price =details.Products[i].Price,
                    Quantity=details.Products[i].Quantity,
                    ProductId=details.Products[i].ProductId
                };
               // context.Orderdetails.Add(products[i]);
            }
              context.Orderdetails.AddRange(products);
            //~~~~~~~~~~~~~~~~~~~~~payment table~~~~~~~~~~~~~~~~~~~~~

            Payment payment = new Payment();

            payment = new Payment()
            {
                OrderId = order.OrderId,
                Amount = (decimal)order.TotalAmount.Value,
                PaymentDate = DateTime.Now,
                Mode = details.PaymentMode
             };

            context.Payment.Add(payment);
            context.SaveChanges();
            return payment.InvoiceId;

        }
      }
}
