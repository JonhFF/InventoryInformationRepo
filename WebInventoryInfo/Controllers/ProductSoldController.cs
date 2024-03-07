using System;
using System.Linq;
using System.Web.Mvc;
using WebInventoryInfo.CustomClass;
using WebInventoryInfo.Models;

namespace WebInventoryInfo.Controllers
{
    public class ProductSoldController : Controller
    {
        //Conexion to database model 
        InventoryInformationEntities dbContext = new InventoryInformationEntities();

        [HttpGet]
        public ActionResult GetProductAvailableQuanitity(int productId)
        {
            var quantityAvailable = 0;
            try
            {
                //Get list of product with disponibility 
                var quantityAvailableResult =  dbContext.uspGetProductAvailableQuanitity().Where(x => x.Id == productId).ToList();

                //verify if the product select has disponibility 
                if (quantityAvailableResult.Any())
                    //Asign the current of product selected 
                    quantityAvailable = quantityAvailableResult[0].Quantity ?? 0;
            }
            catch (Exception ex)
            {
                return Json(new { status = false, message = ex.Message, JsonRequestBehavior.AllowGet});

            }
            return Json(new { status = true,  dispobility = quantityAvailable }, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult ProductTransactionHistoryView()
        {
            
            ViewBag.productTransactionHistory = dbContext.uspGetProductTransactionHistory().ToList();
            return View();
        }

        [HttpGet]
        public ActionResult ProductSoldView() 
        {
            //Get product list 
            var productList = dbContext.Products.Where(x => x.IsActive == true).ToList();
            ViewBag.ProductList = new SelectList(productList, "Id", "ProductName");
            return View();
        }

        [HttpPost]
        public ActionResult ProductSoldView(ProductSoldCustom productSold)
        { 
            // Begin a transaction
            using (var transaction = dbContext.Database.BeginTransaction())
            {
                try
                {
                    //save product purchased register 
                    var ProductSolddId = dbContext.uspSaveProductSoldMaster(productSold.OrderNumber, productSold.OrderDate).FirstOrDefault();

                    foreach(var prodDet in productSold.ProductSoldDetail)
                    {
                        //save product purchased register detail
                        var prodDetResul = dbContext.uspSaveProductSolddDetail((int)ProductSolddId, prodDet.ProductId, prodDet.QuantitySold).FirstOrDefault();
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