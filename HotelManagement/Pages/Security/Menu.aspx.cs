using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelManagement_BAL;
using HotelManagement_Utilities;
using System.Data;
using OfficeOpenXml;

public partial class Pages_Security_Menu : Base
{
    int? Nullint = null;
    double? Nulldouble = null;
    bool? Nullbool = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SetFeature();
            BindDropDown();
            BindRepeater();
        }
        PagingHandler();

    }

    #region PAGING
    private void PagingHandler()
    {
        PagingAndSorting.ImgNext.Click += ImgNext_Click;
        PagingAndSorting.ImgPrevious.Click += ImgPrevious_Click;
        PagingAndSorting.DdlPage.SelectedIndexChanged += DdlPage_SelectedIndexChanged;
        PagingAndSorting.DdlPageSize.SelectedIndexChanged += DdlPageSize_SelectedIndexChanged;
    }

    void DdlPageSize_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindRepeater();
    }
    void DdlPage_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindRepeater();
    }
    void ImgNext_Click(object sender, ImageClickEventArgs e)
    {
        BindRepeater();
    }
    void ImgPrevious_Click(object sender, ImageClickEventArgs e)
    {
        BindRepeater();
    }
    #endregion

    public void BindDropDown()
    {
        try
        {
            DataTable dt_ParentMenu = new BAL_Setup_MenuItem().usp_GetParentMenuByRoleId(0, Nullbool);
            CommonObjects.BindDropDown(ddlParentMenu, dt_ParentMenu, "Menu_Name", "MenuId", true, false);
            CommonObjects.BindDropDown(ddlParentMenuSearch, dt_ParentMenu, "Menu_Name", "MenuId", true, false);


            DataTable dt_Feature = new BAL_Setup_Feature().Crud_usp_Feature(Nullint, null, true);
            CommonObjects.BindCheckBoxList(chk_Feature, dt_Feature, "Feature", "FeatureId", false, false);

        }
        catch (Exception ex)
        {
            Logger.WriteErrorLog("/Pages/Setup/ProductDetail.aspx", "BindDropDown", ex.ToString());
        }
    }
    public void BindRepeater()
    {
        try
        {

            int pageSize = 100;
            int pageNumber = 1;
            if (PagingAndSorting.DdlPageSize.SelectedValue.toInt() > 0)
            {
                pageSize = PagingAndSorting.DdlPageSize.SelectedValue.toInt();
            }
            if (PagingAndSorting.DdlPage.Items.Count > 0)
            {
                pageNumber = PagingAndSorting.DdlPage.SelectedValue.toInt();
            }

            int skip = pageNumber * pageSize - pageSize;
            int? ParentId = (ddlParentMenuSearch.SelectedValue == "" || ddlParentMenuSearch.SelectedValue == "0") ? Nullint : Convert.ToInt32(ddlParentMenuSearch.SelectedValue);
            string ParentMenu = txtParentMenu.Text.Trim() == "" ? null : txtParentMenu.Text.Trim();
            DataTable dt = new BAL_Setup_MenuItem().usp_Crud_Setup_MenuItem(OperationType.Select,Nullint, ParentMenu, ParentId);
            if (dt != null && dt.Rows.Count > 0)
            {
                var li = dt.Select().Skip(skip).Take(pageSize).CopyToDataTable();
                rpt.DataSource = li;
                rpt.DataBind();
                PagingAndSorting.setPagingOptions(dt.Rows.Count);
            }
            else
            {
                rpt.DataSource = null;
                rpt.DataBind();
                PagingAndSorting.setPagingOptions(0);
            }
        }
        catch (Exception ex)
        {
            Logger.WriteErrorLog("/Pages/Security/Menu.aspx.aspx", "BindRepeater", ex.Message);
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindRepeater();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ResetControl();
        BindRepeater();
    }
    protected void Btn_Add_Click(object sender, EventArgs e)
    {
        ResetModalControls();
        OpenPopup();
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            int? ParentId = (ddlParentMenu.SelectedValue == "" || ddlParentMenu.SelectedValue == "0") ? Nullint : Convert.ToInt32(ddlParentMenu.SelectedValue);
            string menuName = txtMenuName.Text.Trim();
            string Url = txtUrl.Text.Trim();
            int SortOrder = Convert.ToInt32(txtSortOrder.Text.Trim() == "" ? "0" : txtSortOrder.Text.Trim());
            string FeatureIds = "";
            for (int j = 0; j < chk_Feature.Items.Count; j++)
            {
                if (chk_Feature.Items[j].Selected == true)
                {
                    FeatureIds += chk_Feature.Items[j].Value + ",";
                }
            }

            int Id = hfId.Value == string.Empty ? 0 : Convert.ToInt32(hfId.Value);
            if (Id == 0)
            {
                DataTable dt = new BAL_Setup_MenuItem().usp_Crud_Setup_MenuItem(OperationType.Insert,0,menuName,ParentId,Url,txtParentMenuIcon.Text,SortOrder,chk_IsDisplay.Checked,true,UserId,UserIP, FeatureIds);
                if (dt != null && dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["HasError"].ToString() == "1")
                    {
                        Error(dt.Rows[0]["Message"].ToString());
                    }
                    else if (dt.Rows[0]["HasError"].ToString() == "0")
                    {
                        Success(dt.Rows[0]["Message"].ToString());
                        ResetModalControls();
                        BindRepeater();
                    }
                }
            }
            else
            {
                


                DataTable dt = new BAL_Setup_MenuItem().usp_Crud_Setup_MenuItem(OperationType.Update, Id, menuName, ParentId, Url, txtParentMenuIcon.Text, SortOrder, chk_IsDisplay.Checked, true, UserId, UserIP, FeatureIds);

                if (dt != null && dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["HasError"].ToString() == "1")
                    {
                        Error(dt.Rows[0]["Message"].ToString());
                    }
                    else if (dt.Rows[0]["HasError"].ToString() == "0")
                    {
                        Success(dt.Rows[0]["Message"].ToString());
                        ResetModalControls();
                        ClosePopup();
                        BindRepeater();
                    }
                }
            }


        }
        catch (Exception ex)
        {
            Logger.WriteErrorLog("/Pages/Setup/ProductDetail.aspx", "btnAdd_Click", ex.Message);
        }
    }
    protected void lbEdit_Click(object sender, EventArgs e)
    {

        try
        {
            ResetModalControls();
            ImageButton lbEdit = (ImageButton)sender;
            RepeaterItem rptItem = (RepeaterItem)lbEdit.NamingContainer;
            int hfMenuId = int.Parse(((System.Web.UI.HtmlControls.HtmlInputHidden)rptItem.FindControl("hfMenuId")).Value);
            if (hfMenuId > 0)
            {
                DataTable dt = new BAL_Setup_MenuItem().usp_Crud_Setup_MenuItem(OperationType.Select,hfMenuId);
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlParentMenu.SelectedValue = Convert.ToString(dt.Rows[0]["Parent_Id"].ToString() == "" ? "0" : dt.Rows[0]["Parent_Id"].ToString());
                    txtMenuName.Text = Convert.ToString(dt.Rows[0]["Menu_Name"].ToString());
                    txtUrl.Text = Convert.ToString(dt.Rows[0]["Menu_URL"].ToString());
                    txtSortOrder.Text = Convert.ToString(dt.Rows[0]["SortOrder"].ToString());
                    chk_IsDisplay.Checked = Convert.ToBoolean(dt.Rows[0]["Is_Displayed_In_Menu"].ToString() == "" ? "0" : dt.Rows[0]["Is_Displayed_In_Menu"].ToString());
                    chk_IsActive.Checked = Convert.ToBoolean(dt.Rows[0]["IsActive"].ToString() == "" ? "0" : dt.Rows[0]["IsActive"].ToString());
                    txtParentMenuIcon.Text = Convert.ToString(dt.Rows[0]["IconClass"].ToString());
                    if (dt.Rows[0]["FeatureIds"].ToString() != "")
                    {
                        hfFeaturesId.Value = dt.Rows[0]["FeatureIds"].ToString();
                        string[] FeatureIds = dt.Rows[0]["FeatureIds"].ToString().Split(',');
                        for (int i = 0; i < FeatureIds.Length; i++)
                        {
                            if (FeatureIds[i].ToString() != "")
                            {
                                for (int j = 0; j < chk_Feature.Items.Count; j++)
                                {
                                    if (Convert.ToInt32(chk_Feature.Items[j].Value) == Convert.ToInt32(FeatureIds[i].ToString()))
                                    {
                                        chk_Feature.Items[j].Selected = true;
                                        break;
                                    }
                                }
                            }
                        }
                    }

                    hfId.Value = hfMenuId.ToString();
                    OpenPopup();
                }


            }
        }
        catch (Exception ex)
        {
            Logger.WriteErrorLog("/Pages/Security/Menu.aspx.aspx", "lbEdit_Click", ex.Message);
        }

    }
    protected void lbDelete_Click(object sender, EventArgs e)
    {
        try
        {
            ResetModalControls();
            ImageButton lbEdit = (ImageButton)sender;
            RepeaterItem rptItem = (RepeaterItem)lbEdit.NamingContainer;
            int hfMenuId = int.Parse(((System.Web.UI.HtmlControls.HtmlInputHidden)rptItem.FindControl("hfMenuId")).Value);
            if (hfMenuId > 0)
            {
                DataTable dt = new BAL_Setup_MenuItem().usp_Crud_Setup_MenuItem(OperationType.Delete,hfMenuId,null,null,null,null,null,null,false, UserId, UserIP);
                if (dt != null && dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["HasError"].ToString() == "1")
                    {
                        Error(dt.Rows[0]["Message"].ToString());
                    }
                    else if (dt.Rows[0]["HasError"].ToString() == "0")
                    {
                        Success(dt.Rows[0]["Message"].ToString());
                        BindRepeater();
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Logger.WriteErrorLog("/Pages/Security/Menu.aspx.aspx", "lbDelete_Click", ex.Message);
        }
    }
    private void ResetControl()
    {
        txtParentMenu.Text = "";
        ResetModalControls();
    }
    private void ResetModalControls()
    {
        hfFeaturesId.Value = ""; hfId.Value = "0";
        txtParentMenuIcon.Text = txtMenuName.Text = txtParentMenu.Text = txtSortOrder.Text = txtUrl.Text = "";
        chk_IsActive.Checked = true;
        BindDropDown();
    }
    public void ClosePopup()
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "ClosePopup()", "ClosePopup();", true);
    }
    public void OpenPopup()
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "OpenPopup()", "OpenPopup();", true);
    }
    public void Success(string message)
    {
        message = "AlertBox('Success!','" + message + "','success');";
        ScriptManager.RegisterStartupScript(this, GetType(), message, message, true);
    }
    public void Error(string message)
    {
        message = "AlertBox('Error!','" + message + "','error');";
        ScriptManager.RegisterStartupScript(this, GetType(), message, message, true);

    }
    protected void rpt_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                ImageButton lbEdit = (ImageButton)e.Item.FindControl("lbEdit");
                ImageButton lbDelete = (ImageButton)e.Item.FindControl("lbDelete");
                if (IsEdit.Value == "1")
                {
                    lbEdit.Visible = true;
                }
                if (IsDelete.Value == "1")
                {
                    lbDelete.Visible = true;
                }

            }
        }
        catch (Exception ex)
        {
        }
    }
    private void SetFeature()
    {
        try
        {
            Btn_Add.Visible = false;
            string url = HttpContext.Current.Request.Url.PathAndQuery;
            string[] Array = url.Split('?');
            url = Array[0];
            DataTable dt = new BAL_Setup_MenuItem().usp_CheckMenuAccess(RoleId, url);
            if (dt != null && dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    if (Convert.ToInt32(dt.Rows[i]["FeatureId"].ToString()) == (int)Feature.Add)
                    {
                        IsAdd.Value = "1";
                        Btn_Add.Visible = true;
                    }
                    else if (Convert.ToInt32(dt.Rows[i]["FeatureId"].ToString()) == (int)Feature.Update)
                    {
                        IsEdit.Value = "1";
                    }
                    else if (Convert.ToInt32(dt.Rows[i]["FeatureId"].ToString()) == (int)Feature.Delete)
                    {
                        IsDelete.Value = "1";
                    }
                    else if (Convert.ToInt32(dt.Rows[i]["FeatureId"].ToString()) == (int)Feature.View)
                    {
                        IsView.Value = "1";
                    }
                }
            }
        }
        catch (Exception ex) { }
    }
}