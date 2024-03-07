using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Mvc;
using WebInventoryInfo.CustomClass;
using WebInventoryInfo.Models;

namespace WebInventoryInfo.Controllers
{
    public class ProductPurchasedController : Controller
    {
        //Conexion to database model 
        InventoryInformationEntities dbContext = new InventoryInformationEntities();
        [HttpGet]
        public ActionResult ProductPurchasedView() 
        {
            //Get product list 
            var productList = dbContext.Products.Where(x => x.IsActive == true).ToList();
            ViewBag.ProductList = new SelectList(productList, "Id", "ProductName");
            return View();
        }

        [HttpPost]
        public ActionResult ProductPurchasedView(ProductPurchasedCustom productPur)
        { 
            // Begin a transaction
            using (var transaction = dbContext.Database.BeginTransaction())
            {
                try
                {
                    //save product purchased register 
                    var ProductPurchasedId = dbContext.uspSaveProductPurchasedMaster(productPur.OrderNumber, productPur.OrderDate).FirstOrDefault();

                    foreach(var prodDet in productPur.ProductPurchasedDetail)
                    {
                        //save product purchased register detail
                        var prodDetResul = dbContext.uspSaveProductPurchasedDetail((int)ProductPurchasedId , prodDet.ProductId, prodDet.QuantityPurchased, prodDet.UnitPrice).FirstOrDefault();
                    }
     

                    // Commit the transaction
                    transaction.Commit();
                    return Json(new { status = true, message = "The process was successfully" });
                }
                catch (Exception ex)
                {
                    // An error occurred, so roll back the transaction
                    transaction.Rollback();
                    return Json(new { status = false, message = $"Error: {ex.Message}" });

                }
            }
        }
    }
}