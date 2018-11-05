using System;
using System.Collections.Generic;

namespace OnlineShoppingServices.Models.DB
{
    public partial class Payment
    {
        public int PaymentId { get; set; }
        public int? OrderId { get; set; }
        public string Mode { get; set; }
        public decimal? Amount { get; set; }
        public DateTime? PaymentDate { get; set; }
        public int? Invoice { get; set; }

        public Ordertable Order { get; set; }
    }
}
