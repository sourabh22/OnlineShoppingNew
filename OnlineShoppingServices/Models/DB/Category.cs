using System;
using System.Collections.Generic;

namespace OnlineShoppingServices.Models.DB
{
    public partial class Category
    {
        public Category()
        {
            Product = new HashSet<Product>();
            Subcategory = new HashSet<Subcategory>();
        }

        public int CategoryId { get; set; }
        public string CategoryName { get; set; }

        public ICollection<Product> Product { get; set; }
        public ICollection<Subcategory> Subcategory { get; set; }
    }
}
