using InventoryInfoDAL.Interfaces;
using InventoryInfoEntities.Products;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InventoryInfoDAL.Models;
using InventoryInfoDAL.Interfaces.Catalog;

namespace InventoryInfoDAL.Implementation
{
    public class ProductDAL<T> : IProductDAL<T> where T : class
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


        public async Task DeleteAsync(int Id, bool saveChanges = true)
        {
            var product = await dbContext.Products.FindAsync(Id);
            await DeleteAsync(product.Id);
            if (saveChanges)
               await dbContext.SaveChangesAsync();
        }

        public async Task DeleteAsync(T entity, bool saveChanges = true)
        {
           // dbContext.Products.Remove(entity);
        }

        public Task DeleteRangeAsync(IEnumerable<T> entities, bool saveChanges = true)
        {
            throw new NotImplementedException();
        }

        public T Find(params object[] keyValues)
        {
            throw new NotImplementedException();
        }

        public Task<T> FindAsync(params object[] keyValues)
        {
            throw new NotImplementedException();
        }

        public Task<IList<T>> GetAllAsync()
        {
            throw new NotImplementedException();
        }

        public Task InsertAsync(T entity, bool saveChanges = true)
        {
            throw new NotImplementedException();
        }

        public Task InsertRangeAsync(IEnumerable<T> entity, bool saveChanges = true)
        {
            throw new NotImplementedException();
        }
    }
}
