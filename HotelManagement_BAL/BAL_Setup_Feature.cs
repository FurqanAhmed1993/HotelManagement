using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using HotelManagement_Utilities;

namespace HotelManagement_BAL
{
    public class BAL_Setup_Feature : HotelManagement_DAL.DAL_Setup_Feature
    {
        DataTable dt = new DataTable();
        public DataTable Crud_usp_Feature(int? FeatureId, string Feature, bool? IsActive, int? CreatedBy = null, string UserIP = null, int OperationId=OperationType.Select)
        {
            dt = usp_Feature_Crud(FeatureId, Feature, IsActive,CreatedBy,UserIP,OperationId);
            return dt;
        }

    }
}
