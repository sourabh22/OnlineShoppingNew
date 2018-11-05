﻿using System;
using System.Collections.Generic;

namespace OnlineShoppingServices.Models.DB
{
    public partial class Orderdetails
    {
        public int OrderId { get; set; }
        public int ProductId { get; set; }
        public int? Quantity { get; set; }
        public decimal? Price { get; set; }

        public Ordertable Order { get; set; }
        public Product Product { get; set; }
    }
}
