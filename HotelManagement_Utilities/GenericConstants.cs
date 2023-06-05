using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HotelManagement_Utilities
{
    public struct GenericConstants
    {
        public const string ConnectionStringKey = "ConnectionString";
        public static int Sql_CommandTimeout = 36000;
        public const string DefaultDate = "01/01/1900";
        public const string MYDateFormatLong = "dd/MM/yyyy";
        public const string NEWDateFormat = "yyyy/MM/dd";
        public const string DateFormat1_ = "dd-MMM-yyyy";
        public const string DateTimeFormat11_ = "yyyy/MM/dd hh:mm";
        public const string DateTimeFormat1_ = "dd-MMM-yyyy hh:mm:ss tt";
        public const string DateTimeFormat2_ = "dd MMM yyyy";
        public const string DateTimeFormat2 = "dd-MMM-yyyy";
        public const string DateFormat2 = "MM/dd/yyyy";
        public const string DateFormatWithTime = "MM/dd/yyyy ddd HH:mm";
        public const string DateFormat = "MMM dd,yyyy";
        public const string DateFormat1 = "dd-MMM-yyyy ddd";
        public const string DateTimeFormat1 = "dd-MMM-yyyy ddd hh:mm:ss tt";
        public const string IntDateFormat = "yyyyMMdd";
        public const string TimeFormat = "mm:tt";
        public const string DateFormatLong = "dd/MM/yyyy HH:mm:ss";
        public const string TimeFormatLong = "HH:mm:ss";
        public const string TimeFormatAMPM = "hh:mm:ss tt";
        public const string Password = "ppcrm123$";
        public const string ErrorLog = "ExceptionsLogs";
        public const string GetDefaultPage = "/Pages/Dashboard.aspx";
        public const string EmailLog = "EmailLog";
        public const string SMSLog = "SMSLog";
    }

    public struct UserRole
    {
        public const int SuperAdmin = 1;
        public const int Admin = 2;

    }
    public struct OperationTypes
    {
        public const string Select = "Select";
        public const string Populate = "Populate";
        public const string Insert = "Insert";
        public const string Update = "Update";
        public const string Delete = "Delete";
        public const string GetEducatorOnCity = "GetEducatorOnCity";
    }
    public struct Setup_Master
    {
        public const int HotelRating = 1;
        public const int RoomCategory = 2;
        public const int Floor = 3;
        public const int RoomStatus = 4;
        public const int BookingStatus = 5;
        public const int CustomerBookerType = 6;
    }

    public struct Setup_MasterDetail
    {
        public const int ThreeStar =1;
        public const int FourStar =2;
        public const int SevenStar =3;
        public const int FiveStar =4;
        public const int Normal = 5;
        public const int Single = 6;
        public const int Double = 7;
        public const int Quard = 8;
        public const int Twin = 9;
        public const int QueenBed =10;
        public const int KingBed =11;
        public const int G =12;
        public const int RoomIsokay = 13;
        public const int UnderConstruction =14;
        public const int New = 15;
        public const int Pending = 16;
        public const int Confirmed = 17;
        public const int Customer = 18;
        public const int Booker = 19;

    }

    public struct Feature
    {
        public const int Add = 1;
        public const int Update = 2;
        public const int Delete = 3;
        public const int View = 4;
        public const int Submit = 5;
       
    }




    public struct OperationType
    {
        public const int Select = 1;
        public const int Insert = 2;
        public const int Update = 3;
        public const int Delete = 4;
    }


}
