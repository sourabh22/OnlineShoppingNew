using System;
using System.Collections.Generic;

namespace OnlineShoppingServices.Models.DB
{
    public partial class Ordertable
    {
        public Ordertable()
        {
            Orderdetails = new HashSet<Orderdetails>();
            Payment = new HashSet<Payment>();
        }

        public int OrderId { get; set; }
        public int? CategoryId { get; set; }
        public DateTime? OrderDate { get; set; }
        public double? TotalAmount { get; set; }
        public int? CustomerId { get; set; }

        public Customer Customer { get; set; }
        public ICollection<Orderdetails> Orderdetails { get; set; }
        public ICollection<Payment> Payment { get; set; }
    }
}
