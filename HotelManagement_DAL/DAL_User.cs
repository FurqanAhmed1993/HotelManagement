using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace HotelManagement_DAL
{
    public class DAL_User : DAL
    {
        protected DataTable Crud_UserLogin(int? UserId, string UserName, string LoginId, string Password, string EmailAddress, string PhoneNumber, int? RoleId, bool? IsActive, int CreatedBy,string UserIp,string HotelIds, int OperationId)
        {
            DataTable dt = new DataTable();
            try
            {
                using (SqlCommand cmd = new SqlCommand("sp_UserCrud"))
                {
                    OpenConnection(true);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@OperationId", SqlDbType.Int).Value = OperationId;
                    cmd.Parameters.Add("@UserId", SqlDbType.Int).Value = UserId;
                    cmd.Parameters.Add("@LoginId", SqlDbType.VarChar).Value = LoginId;
                    cmd.Parameters.Add("@Password", SqlDbType.VarChar).Value = Password;
                    cmd.Parameters.Add("@RoleId", SqlDbType.Int).Value = RoleId;
                    cmd.Parameters.Add("@UserName", SqlDbType.VarChar).Value = UserName;
                    cmd.Parameters.Add("@EmailAddress", SqlDbType.VarChar).Value = EmailAddress;
                    cmd.Parameters.Add("@PhoneNumber", SqlDbType.VarChar).Value = PhoneNumber;
                    cmd.Parameters.Add("@CreatedBy", SqlDbType.Int).Value = CreatedBy;
                    cmd.Parameters.Add("@UserIP", SqlDbType.NVarChar).Value = UserIp;
                    cmd.Parameters.Add("@IsActive", SqlDbType.Bit).Value = IsActive;
                    cmd.Parameters.Add("@HotelIds", SqlDbType.VarChar).Value = HotelIds;
                   
                    
                    dt = GetData(cmd);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(string.Format("Error occured during usp_UserLogin_Get : {0}", ex.Message), ex);
            }
            return dt;
        }

        protected DataTable Crud_UserHotelMapping(int? UserId,int? HotelId, int OperationId)
        {
            DataTable dt = new DataTable();
            try
            {
                using (SqlCommand cmd = new SqlCommand("sp_UserHotelMapping"))
                {
                    OpenConnection(true);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@OperationId", SqlDbType.Int).Value = OperationId;
                    cmd.Parameters.Add("@UserId", SqlDbType.Int).Value = UserId;
                    cmd.Parameters.Add("@HotelId", SqlDbType.Int).Value = HotelId;


                    dt = GetData(cmd);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(string.Format("Error occured during Crud_UserHotelMapping : {0}", ex.Message), ex);
            }
            return dt;
        }
        public DataTable usp_UserLoginHistory_Insert(int UserId, bool IsSuccess, string UserIp)
        {
            DataTable dt = new DataTable();
            try
            {
                using (SqlCommand cmd = new SqlCommand("usp_UserLoginHistory_Insert"))
                {
                    OpenConnection(true);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@UserId", SqlDbType.Int).Value = UserId;
                    cmd.Parameters.Add("@IsSuccess", SqlDbType.Bit).Value = IsSuccess;
                    cmd.Parameters.Add("@UserIp", SqlDbType.VarChar).Value = UserIp;
                    dt = GetData(cmd);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(string.Format("Error occured during usp_UserLogin_Insert_UserLoginHistory : {0}", ex.Message), ex);
            }
            return dt;
        }
        public DataTable usp_UserLogin_UpdatePassword(int UserId, string OldPassword, string NewPassword, string UserIp)
        {
            DataTable dt = new DataTable();
            try
            {
                using (SqlCommand cmd = new SqlCommand("usp_UserLogin_UpdatePassword"))
                {
                    OpenConnection(true);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@UserId", SqlDbType.Int).Value = UserId;
                    cmd.Parameters.Add("@OldPassword", SqlDbType.VarChar).Value = OldPassword;
                    cmd.Parameters.Add("@NewPassword", SqlDbType.VarChar).Value = NewPassword;
                    cmd.Parameters.Add("@UserIp", SqlDbType.VarChar).Value = UserIp;
                    dt = GetData(cmd);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(string.Format("Error occured during Usp_UserLogin_UpdatePassword : {0}", ex.Message), ex);
            }
            return dt;
        }

    }
}
