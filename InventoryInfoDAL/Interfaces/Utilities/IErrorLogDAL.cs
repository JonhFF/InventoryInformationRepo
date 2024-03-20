using InventoryInfoEntities.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InventoryInfoDAL.Interfaces
{
    public interface IErrorLogDAL
    {
        void LogError(ErrorLog errorLog);
    }
}
