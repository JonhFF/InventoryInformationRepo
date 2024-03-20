using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InventoryInfoDAL.Interfaces.Catalog
{
    public interface IProductDAL<T> where T : class
    {
        Task<IList<T>> GetAllAsync();

    }
}
