using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace OnlineShoppingApplication.Models
{
     public class ProductViewModel
     {
        public int ProductId { get; set; }
        public string Title { get; set; }
        public int CategoryId { get; set; }
        public int SubCategoryId { get; set; }
        public decimal Price { get; set; }
        public string Image { get; set; }
    }

    public class ProductViewModelCart:ProductViewModel
    {
        public int Quantity { get;set; }
    }
}
