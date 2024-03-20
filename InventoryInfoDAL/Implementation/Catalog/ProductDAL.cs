using InventoryInfoDAL.Interfaces;
using InventoryInfoEntities.Products;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InventoryInfoDAL.Models;

namespace InventoryInfoDAL.Implementation
{
    public class ProductDAL
    {
        //Instance to DBContext
        private readonly InventoryInformationEntities dbContext;
        //Instance to error log 
        private readonly IErrorLogDAL ErrorLog;
        public ProductDAL(InventoryInformationEntities _dbContext, IErrorLogDAL errorLog)
        {
            dbContext = _dbContext;
            ErrorLog = errorLog;
        }

        public async Task DeleteAsync(int Id)
        {
            var entity = await dbContext.Products.FindAsync(Id);
        }




    }
}
