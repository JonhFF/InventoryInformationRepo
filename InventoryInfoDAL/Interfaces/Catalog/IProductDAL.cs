using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InventoryInfoDAL.Interfaces.Catalog
{
    public interface IProductDAL<T> where T : class
    {
        //Get all items of an entity by asynchronous method 
        Task<IList<T>> GetAllAsync();

        //Find one item of an entity synchronous method 
        T Find(params object[] keyValues);

        //Find one item of an entity asynchronous method 
        Task<T> FindAsync(params object[] keyValues);

        //Insert item into an entity by asynchronous method
        Task InsertAsync(T entity, bool saveChanges = true);

        //Insert multiple items into an entity by asynchronous 
        Task InsertRangeAsync(IEnumerable<T> entity, bool saveChanges = true);

        //Remove one item from an entity by asynchronous method 
        Task DeleteAsync(int Id, bool saveChanges = true);

        //Remove one item from an entity by asynchronous method 
        Task DeleteAsync(T entity, bool saveChanges = true);

        //Remove multiple items from an entity by asychronous method 
        Task DeleteRangeAsync(IEnumerable<T> entities, bool saveChanges = true);
    }
}
