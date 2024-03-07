using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace WebInventoryInfo.CustomClass
{
    public class ProductSoldCustom
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "The Order Number field is required.")]
        public int OrderNumber { get; set; }

        [Required(ErrorMessage = "The Order Date field is required.")]
        public DateTime OrderDate { get; set; }

        public List<ProductSoldDetailCustom> ProductSoldDetail { get; set; }

    }
}