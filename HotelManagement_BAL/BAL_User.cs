using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using HotelManagement_Utilities;
using HotelManagement_DAL;

namespace HotelManagement_BAL
{
    public class BAL_User : DAL_User
    {
        DataTable dt = new DataTable();
        public DataTable usp_UserLogin_Get( int? UserId, string UserName, string LoginId, string Password=null, string EmailAddress=null, string PhoneNumber=null, int? RoleId=null, bool? IsActive=true, int CreatedBy=0,string UserIp=null,string HotelIds=null,int OperationId= OperationType.Select)
        {
            dt = Crud_UserLogin(UserId, UserName, LoginId, Password, EmailAddress, PhoneNumber, RoleId, IsActive, CreatedBy, UserIp, HotelIds, OperationId);
            return dt;
        }
        public DataTable UserHotelMapping_Crud(int? UserId, int? HotelId, int OperationId=OperationType.Select)
        {
            dt = Crud_UserHotelMapping(UserId,  HotelId, OperationId);
            return dt;
        }
            public DataTable Insert_UserLoginHistory(int UserId, bool IsSuccess, string UserIp)
        {
            dt = usp_UserLoginHistory_Insert(UserId, IsSuccess, UserIp);
            return dt;
        }

        public DataTable UpdatePassword(int UserId, string OldPassword, string NewPassword, string UserIp)
        {
            dt = usp_UserLogin_UpdatePassword(UserId, OldPassword, NewPassword, UserIp);
            return dt;
        }

    }
}
