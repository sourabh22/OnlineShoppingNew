﻿using System;
using System.Collections.Generic;

namespace OnlineShoppingServices.Models.DB
{
    public partial class Subcategory
    {
        public int SubCategoryId { get; set; }
        public int? CategoryId { get; set; }
        public string SubCategoryName { get; set; }

        public Category Category { get; set; }
    }
}
