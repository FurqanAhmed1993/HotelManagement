using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using HotelManagement_Utilities;

namespace HotelManagement_BAL
{
    public class BAL_Role : HotelManagement_DAL.DAL_Role
    {
        DataTable dt = new DataTable();

        public DataTable usp_UserRoleCrud(int? RoleId, string RoletName, bool? IsActive=true,int CreatedBy=0,string UserIP="",int OperationId=OperationType.Select)
        {
            dt = usp_CrudUserRole(RoleId, RoletName, IsActive,CreatedBy,UserIP, OperationId);
            return dt;
        }
       
    }
}
