<%@ WebHandler Language="C#" Class="PrescriptionUpload" %>

using System;
using System.Transactions;
using System.Web;
using System.IO;
using System.Web.Script.Serialization;
using System.ServiceModel.Web;
using System.Text;
using System.Collections.Generic;
using HotelManagement_Utilities;
using HotelManagement_BAL;
using System.Data;
using Newtonsoft.Json;

public class PrescriptionUpload : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
       
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }


}