using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InventoryInfoEntities.Utilities
{
    public class ErrorLog
    {
        public int Id { get; set; }
        public int ErrorNumber { get; set; }
        public DateTime ErrorDate { get; set; }
        public int UserId { get; set; }
        public string ProcedureName { get; set; }
        public string MethodName { get; set; }
        public string ErrorMessage { get; set; }
    }
}
