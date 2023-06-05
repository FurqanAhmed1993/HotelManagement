using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelManagement_BAL;
using HotelManagement_Utilities;
using System.Data;
using System.Web.UI.HtmlControls;

public partial class Pages_Dashboard : Base
{
    string Page = "/Pages/Dashboard.aspx";
    int? Nullint = null;
    bool? Nullbool = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindRepetersControls();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtFromDate.Text = txtToDate.Text = DateTime.Now.Date.ToString(GenericConstants.DateFormat1_);
        BindRepetersControls();
    }
    private void Exception(string Excep)
    {
        divError1.Visible = true;
        divError1.Attributes.Add("class", "validationSummary");
        lblError1.Text = Excep;
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        BindCountControls();
    }
    public void BindRepetersControls()
    
    {
       
    }
    public void BindCountControls()
    {
       
       
    }
}