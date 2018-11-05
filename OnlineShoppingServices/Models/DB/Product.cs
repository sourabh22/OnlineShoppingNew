using System;
using System.Collections.Generic;

namespace OnlineShoppingServices.Models.DB
{
    public partial class Product
    {
        public Product()
        {
            Orderdetails = new HashSet<Orderdetails>();
        }

        public int ProductId { get; set; }
        public string Title { get; set; }
        public int? CategoryId { get; set; }
        public int? SubCategoryId { get; set; }
        public decimal? Price { get; set; }
        public int? Quantity { get; set; }
        public int? ReorderLevel { get; set; }
        public string Image { get; set; }

        public Category Category { get; set; }
        public ICollection<Orderdetails> Orderdetails { get; set; }
    }
}
