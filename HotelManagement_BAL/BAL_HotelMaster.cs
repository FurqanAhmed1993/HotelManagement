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
    public class BAL_HotelMaster: HotelManagement_DAL.DAL_HotelMaster
    {
        DataTable dt = new DataTable();
        public DataTable usp_HotelMaster_Crud(int? HotelId, string HotelCode=null, string HotelName=null
            , int? NoOfRooms=null, string HotelAddress = null, int? HotelRatingId = null
            , string HotelDescription = null, bool? IsActive = true, int CreatedBy = 0
            , string UserIp = null,  int OperationId = OperationType.Select)
        {
            dt = usp_HotelMasterCrud(HotelId, HotelCode, HotelName, NoOfRooms, HotelAddress, HotelRatingId
                , HotelDescription,IsActive, CreatedBy, UserIp, OperationId);
            return dt;
        }
    }
}
