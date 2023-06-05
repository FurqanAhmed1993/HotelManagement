using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;


namespace HotelManagement_DAL
{
    public class DAL_Setup_Feature : DAL
    {
        public DataTable usp_Feature_Crud(int? FeatureId, string Feature, bool? IsActive,int? CreatedBy,string UserIP,int OperationId)
        {
            DataTable dt = new DataTable();
            try
            {
                using (SqlCommand cmd = new SqlCommand("usp_Feature_Crud"))
                {
                    OpenConnection(true);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@OperationId", SqlDbType.Int).Value = OperationId;
                    cmd.Parameters.Add("@FeatureId", SqlDbType.Int).Value = FeatureId;
                    cmd.Parameters.Add("@Feature", SqlDbType.VarChar).Value = Feature;
                    cmd.Parameters.Add("@IsActive", SqlDbType.Bit).Value = IsActive;
                    cmd.Parameters.Add("@CreatedBy", SqlDbType.Int).Value = CreatedBy;
                    cmd.Parameters.Add("@UserIP", SqlDbType.NVarChar).Value = UserIP;
                    
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
