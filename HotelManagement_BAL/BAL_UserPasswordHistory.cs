﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace HotelManagement_BAL
{
    public class BAL_UserPasswordHistory : HotelManagement_DAL.DAL_UserPasswordHistory
    {
        DataTable dt = new DataTable();
        public DataTable Get_UserPasswordHistory_ByLoginId(int UserId)
        {
            dt = usp_UserPasswordHistory_GetByUserId(UserId);
            return dt;
        }
    }
}
