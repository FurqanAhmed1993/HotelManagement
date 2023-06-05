using HotelManagement_Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HotelManagement_DAL
{
   public class DAL_HotelMaster:DAL
    {
        DataTable dt = new DataTable();
        protected DataTable usp_HotelMasterCrud(int? HotelId, string HotelCode = null, string HotelName = null
            , int? NoOfRooms = null, string HotelAddress = null, int? HotelRatingId = null
            , string HotelDescription = null,  bool? IsActive = true, int CreatedBy = 0
            , string UserIp = null, int OperationId = OperationType.Select)
        {
            DataTable dt = new DataTable();
            try
            {
                using (SqlCommand cmd = new SqlCommand("sp_HotelMasterCrud"))
                {
                    OpenConnection(true);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@OperationId", SqlDbType.Int).Value = OperationId;
                    cmd.Parameters.Add("@HotelId", SqlDbType.Int).Value = HotelId;
                    cmd.Parameters.Add("@HotelCode", SqlDbType.VarChar).Value = HotelCode;
                    cmd.Parameters.Add("@HotelName", SqlDbType.VarChar).Value = HotelName;
                    cmd.Parameters.Add("@NoOfRooms", SqlDbType.Int).Value = NoOfRooms;
                    cmd.Parameters.Add("@HotelAddress", SqlDbType.VarChar).Value = HotelAddress;
                    cmd.Parameters.Add("@HotelRatingId", SqlDbType.Int).Value = HotelRatingId;
                    cmd.Parameters.Add("@HotelDescription", SqlDbType.VarChar).Value = HotelDescription;
                    cmd.Parameters.Add("@CreatedBy", SqlDbType.Int).Value = CreatedBy;
                    cmd.Parameters.Add("@UserIP", SqlDbType.NVarChar).Value = UserIp;
                    cmd.Parameters.Add("@IsActive", SqlDbType.Bit).Value = IsActive;
                   
                    dt = GetData(cmd);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(string.Format("Error occured during usp_Feature_Get : {0}", ex.Message), ex);
            }
            return dt;
        }
    }
}
