using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebInventoryInfo.CustomClass
{
    public class ProductPurchasedDetailCustom
    {
        public int Id { get; set; }
        public int ProductPurchasedId { get; set; }
        public int ProductId { get; set; }
        public int QuantityPurchased { get; set; }
        public decimal UnitPrice { get; set; }
    }
}