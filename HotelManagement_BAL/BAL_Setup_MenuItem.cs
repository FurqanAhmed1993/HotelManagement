using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using HotelManagement_Utilities;

namespace HotelManagement_BAL
{
    public class BAL_Setup_MenuItem : HotelManagement_DAL.DAL_Setup_MenuItem
    {
        DataTable dt = new DataTable();
        public DataTable usp_GetParentMenuByRoleId(int RoleId, bool? Is_Displayed_In_Menu)
        {
            dt = usp_Setup_MenuItem_GetParentMenuByRoleId(RoleId, Is_Displayed_In_Menu);
            return dt;
        }
        public DataTable usp_Get_ChildMenuByRoleId_ParentId(int RoleId, int ParentId, bool? Is_Displayed_In_Menu)
        {
            dt = usp_Setup_MenuItem_Get_ChildMenuByRoleId_ParentId(RoleId, ParentId, Is_Displayed_In_Menu);
            return dt;
        }
        public DataTable usp_Get_MenuItemFeatureMapping(int? MenuItemFeatureId, int? MenuId, int? FeatureId, int? RoleId)
        {
            dt = usp_MenuItemFeatureMapping_Get(MenuItemFeatureId, MenuId, FeatureId, RoleId);
            return dt;
        }
        public DataTable usp_CheckMenuAccess(int RoleId, string Url)
        {
            dt = usp_Setup_MenuItem_CheckMenuAccess(RoleId, Url);
            return dt;
        }
       
        public DataTable usp_Insert_RoleAccess_RoleMenuItemFeatureMapping_(int RoleId, int MenuId, string MenuItemFeatureId, bool IsInsert, int UserId, string Userip)
        {
            dt = usp_RoleAccess_RoleMenuItemFeatureMapping_Insert(RoleId, MenuId, MenuItemFeatureId, IsInsert, UserId, Userip);
            return dt;
        }
        
        public DataTable usp_Crud_Setup_MenuItem(int OperationId = OperationType.Select,int ? MenuId = null, string Menu_Name = null, int? Parent_Id = null, string Menu_URL = null, string IconClass = null, int? Sort_Order = null
            , bool? Is_Displayed_In_Menu = null, bool? IsActive = null, int? CreatedBy = null, string UserIP = null, string FeatureIds = null)
        {
            dt = usp_Setup_MenuItem_Crud(MenuId ,  Menu_Name ,  Parent_Id ,  Menu_URL ,  IconClass,  Sort_Order 
            , Is_Displayed_In_Menu , IsActive ,  CreatedBy,  UserIP ,  FeatureIds ,  OperationId);
            return dt;
        }
    }
}
