using System;
using System.Collections.Generic;
using System.Text;

namespace OnlineShoppingLibrary
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

    public class ProductViewModelCart : ProductViewModel
    {
        public int Quantity { get; set; }
    }
    public class Orderview
    {
        public ProductViewModelCart[] PVMC { get; set; }
        public int Cid { get; set; }
        public int TotalAmount { get; set; }
    }
}
