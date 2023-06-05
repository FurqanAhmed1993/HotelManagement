using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;


namespace HotelManagement_DAL
{
    public class DAL_Login : DAL
    {
        public DataTable usp_UserLogin_Get_UserByLoginId(string LoginId,string Password)
        {
            DataTable dt = new DataTable();
            try
            {
                using (SqlCommand cmd = new SqlCommand("usp_UserLogin_Get_UserByLoginId"))
                {
                    OpenConnection(true);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@LoginId", SqlDbType.VarChar).Value = LoginId;
                    cmd.Parameters.Add("@Password", SqlDbType.VarChar).Value = Password;
                    dt = GetData(cmd);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(string.Format("Error occured during usp_UserLogin_Get_UserByLoginId : {0}", ex.Message), ex);
            }
            return dt;
        }
       
    }
}
