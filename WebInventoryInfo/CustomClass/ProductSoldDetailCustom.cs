using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebInventoryInfo.CustomClass
{
    public class ProductSoldDetailCustom
    {
        public int Id { get; set; }
        public int ProductSoldId { get; set; }
        public int ProductId { get; set; }
        public int QuantitySold { get; set; }
    }
}