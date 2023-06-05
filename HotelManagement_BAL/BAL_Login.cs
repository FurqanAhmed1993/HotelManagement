using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace HotelManagement_BAL
{
    public class BAL_Login : HotelManagement_DAL.DAL_Login
    {
        DataTable dt = new DataTable();
        public DataTable Get_UserByLoginId(string LoginId,string Password=null)
        {
            dt = usp_UserLogin_Get_UserByLoginId(LoginId,Password);
            return dt;
        }
        
    
    }
}
