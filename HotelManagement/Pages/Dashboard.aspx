<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Pages_Dashboard" MasterPageFile="~/MasterPage/AdminMaster.master" %>

<%@ Register Src="~/CustomControls/Shared/InProgress.ascx" TagPrefix="uc" TagName="InProgress" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style>
        .sm-data-box .data-wrap-left, .sm-data-box .data-wrap-right {
            padding-top: 5px;
            padding-bottom: 5px;
            min-height: 90px;
        }

        .sm-data-box {
            background: #ACB316;
            color: #fff !important;
            border: 1px solid #7c820c;
            padding-right: 5px;
        }

            .sm-data-box .counter {
                font-size: 40px;
                font-weight: 600;
            }

        .sm-data-img {
            background-color: #fff;
            border-radius: 50px;
            width: 60px;
            height: 60px;
            padding: 10px;
            margin-top: 10px;
        }

        .sm-data-box .progress {
            margin-bottom: 10px;
        }

            .sm-data-box .progress .progress-bar {
                font-size: 6px;
                background: #cbd245;
            }



        /* width */
        ::-webkit-scrollbar {
            width: 7px;
        }

        /* Track */
        ::-webkit-scrollbar-track {
            background: #f1f1f1;
        }

        /* Handle */
        ::-webkit-scrollbar-thumb {
            background: #c5c4c4;
        }

            /* Handle on hover */
            ::-webkit-scrollbar-thumb:hover {
                background: #555;
            }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="pt-20">
        <asp:UpdateProgress ID="UpdateProgress2" runat="server">
            <ProgressTemplate>
                <uc:InProgress runat="server" ID="InProgress" />
            </ProgressTemplate>
        </asp:UpdateProgress>

        <asp:UpdatePanel ID="upData" runat="server">
            <ContentTemplate>
                <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="60000" Enabled="false"></asp:Timer>

                <div runat="server" id="Div_Main" visible="false">
                    <div class="row">
                        <div id="divError1" runat="server" visible="false" class="card-view panel-danger1">
                            <asp:Label ID="lblError1" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-lg-2 col-md-4 col-sm-4 col-xs-6">
                            <div class="panel panel-default card-view pa-0">
                                <div class="panel-wrapper collapse in">
                                    <div class="panel-body pa-0">
                                        <div class="sm-data-box">
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-xs-8 text-center pl-0 pr-0 data-wrap-left">
                                                        <span class="block counter"><span class="counter-anim">
                                                            <asp:Label runat="server" ID="lbl_ConfirmedOrders" CssClass="number" Text="0"></asp:Label>
                                                        </span></span>
                                                        <span class="capitalize-font block">Confirmed</span>
                                                    </div>
                                                    <div class="col-xs-4 text-center  pl-0 pr-0 data-wrap-right">
                                                        <div class="sm-data-img">
                                                            <asp:Image runat="server" ID="img_Confirmed_status" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-4 col-xs-6">
                            <div class="panel panel-default card-view pa-0">
                                <div class="panel-wrapper collapse in">
                                    <div class="panel-body pa-0">
                                        <div class="sm-data-box">
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-xs-8 text-center pl-0 pr-0 data-wrap-left">
                                                        <span class="block counter"><span class="counter-anim">
                                                            <asp:Label runat="server" ID="lbl_ReceivedOrders" CssClass="number" Text="0"></asp:Label>
                                                        </span></span>
                                                        <span class="capitalize-font block">Received</span>
                                                    </div>
                                                    <div class="col-xs-4 text-center  pl-0 pr-0 data-wrap-right">
                                                        <div class="sm-data-img">
                                                            <asp:Image runat="server" ID="img_Received_status" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-4 col-xs-6">
                            <div class="panel panel-default card-view pa-0">
                                <div class="panel-wrapper collapse in">
                                    <div class="panel-body pa-0">
                                        <div class="sm-data-box">
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-xs-8 text-center pl-0 pr-0 data-wrap-left">
                                                        <span class="block counter"><span class="counter-anim">
                                                            <asp:Label runat="server" ID="lbl_DispatchedOrders" CssClass="number" Text="0"></asp:Label>
                                                        </span></span>
                                                        <span class="capitalize-font block">Dispatched</span>
                                                    </div>
                                                    <div class="col-xs-4 text-center  pl-0 pr-0 data-wrap-right">
                                                        <div class="sm-data-img">
                                                            <asp:Image runat="server" ID="img_Dispatched_status" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-4 col-xs-6">
                            <div class="panel panel-default card-view pa-0">
                                <div class="panel-wrapper collapse in">
                                    <div class="panel-body pa-0">
                                        <div class="sm-data-box">
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-xs-8 text-center pl-0 pr-0 data-wrap-left">
                                                        <span class="block counter"><span class="counter-anim">
                                                            <asp:Label runat="server" ID="lbl_DeliveredOrders" CssClass="number" Text="0"></asp:Label>
                                                        </span></span>
                                                        <span class="capitalize-font block">Delivered</span>
                                                    </div>
                                                    <div class="col-xs-4 text-center  pl-0 pr-0 data-wrap-right">
                                                        <div class="sm-data-img">
                                                            <asp:Image runat="server" ID="img_Delivered_status" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-4 col-xs-6">
                            <div class="panel panel-default card-view pa-0">
                                <div class="panel-wrapper collapse in">
                                    <div class="panel-body pa-0">
                                        <div class="sm-data-box">
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-xs-8 text-center pl-0 pr-0 data-wrap-left">
                                                        <span class="block counter">
                                                            <span class="counter-anim">
                                                                <asp:Label runat="server" ID="lbl_CanceledOrders" CssClass="number" Text="0"></asp:Label>
                                                            </span>
                                                        </span>
                                                        <span class="capitalize-font block">Canceled</span>

                                                    </div>
                                                    <div class="col-xs-4 text-center  pl-0 pr-0 data-wrap-right">
                                                        <div class="sm-data-img">
                                                            <asp:Image runat="server" ID="img_Cancel_status" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-2 col-md-4 col-sm-4 col-xs-6">
                            <div class="panel panel-default card-view pa-0">
                                <div class="panel-wrapper collapse in">
                                    <div class="panel-body pa-0">
                                        <div class="sm-data-box">
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-xs-8 text-center pl-0 pr-0 data-wrap-left">
                                                        <span class="block counter"><span class="counter-anim">
                                                            <asp:Label runat="server" ID="lbl_TotalOrders" CssClass="number" Text="0"></asp:Label>
                                                        </span></span>
                                                        <span class="capitalize-font block">Total Orders</span>
                                                    </div>
                                                    <div class="col-xs-4 text-center  pl-0 pr-0 data-wrap-right">
                                                        <div class="sm-data-img">
                                                            <asp:Image runat="server" ID="img_TotalOrders_status" ImageUrl="/Assets/Images/Status/totalo.png" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" runat="server" id="Div_Dashboard">
                        <div class="col-sm-3">
                            <div class="panel panel-default border-panel card-view">
                                <div class="panel-heading">
                                    <div class="pull-left">
                                        <h6 class="panel-title txt-dark">Orders Not Confirmed</h6>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="panel-wrapper collapse in">
                                    <div class="panel-body">
                                        <div class="label-chatrs">
                                            <div class="">
                                                <span class="clabels-text font-12 inline-block txt-dark capitalize-font pull-left"><span class="block font-15 weight-500 mb-5">Total</span><span class="block txt-grey">Orders</span></span>
                                                <div class="pull-right">
                                                    <span class="font-26">
                                                        <asp:Label runat="server" ID="lbl_OrdersNotConfirmed" CssClass="number" Text="0"></asp:Label></span>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default border-panel card-view">
                                <div class="panel-heading">
                                    <div class="pull-left">
                                        <h6 class="panel-title txt-dark">Patient</h6>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="panel-wrapper collapse in">
                                    <div class="panel-body">
                                        <div class="label-chatrs">
                                            <div class="">
                                                <span class="clabels-text font-12 inline-block txt-dark capitalize-font pull-left"><span class="block font-15 weight-500 mb-5">New</span><span class="block txt-grey">patients</span></span>
                                                <div class="pull-right">
                                                    <span class="font-26">
                                                        <asp:Label runat="server" ID="lbl_NewPatients" CssClass="number" Text="0"></asp:Label></span>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                        <hr class="light-grey-hr row mt-10 mb-15">
                                        <div class="label-chatrs">
                                            <div class="">
                                                <span class="clabels-text font-12 inline-block txt-dark capitalize-font pull-left"><span class="block font-15 weight-500 mb-5">Repeat</span><span class="block txt-grey">patients</span></span>
                                                <div class="pull-right">
                                                    <span class="font-26">
                                                        <asp:Label runat="server" ID="lbl_RepeatPatients" CssClass="number" Text="0"></asp:Label></span>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default border-panel card-view">
                                <div class="panel-heading">
                                    <div class="pull-left">
                                        <h6 class="panel-title txt-dark">Follow-Up</h6>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="panel-wrapper collapse in">
                                    <div class="panel-body">
                                        <div class="label-chatrs">
                                            <div class="">
                                                <span class="clabels-text font-12 inline-block txt-dark capitalize-font pull-left"><span class="block font-15 weight-500 mb-5">Total</span><span class="block txt-grey">Follow-up (Today)</span></span>
                                                <div class="pull-right">
                                                    <span class="font-26">
                                                        <asp:Label runat="server" ID="lbl_TotalFollowUp" CssClass="number" Text="0"></asp:Label></span>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                        <hr class="light-grey-hr row mt-10 mb-15">
                                        <div class="label-chatrs">
                                            <div class="">
                                                <span class="clabels-text font-12 inline-block txt-dark capitalize-font pull-left"><span class="block font-15 weight-500 mb-5">Done</span><span class="block txt-grey">Follow-up (Today)</span></span>
                                                <div class="pull-right">
                                                    <span class="font-26">
                                                        <asp:Label runat="server" ID="lbl_DoneFollowUp" CssClass="number" Text="0"></asp:Label></span>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                        <hr class="light-grey-hr row mt-10 mb-15">
                                        <div class="label-chatrs">
                                            <div class="">
                                                <span class="clabels-text font-12 inline-block txt-dark capitalize-font pull-left"><span class="block font-15 weight-500 mb-5">Remaining</span><span class="block txt-grey">Follow-up (Today)</span></span>
                                                <div class="pull-right">
                                                    <span class="font-26">
                                                        <asp:Label runat="server" ID="lbl_RemainingFollowUp" CssClass="number" Text="0"></asp:Label></span>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>


                                        <hr class="light-grey-hr row mt-10 mb-15">
                                        <div class="label-chatrs">
                                            <div class="">
                                                <span class="clabels-text font-12 inline-block txt-dark capitalize-font pull-left"><span class="block font-15 weight-500 mb-5">Pending</span><span class="block txt-grey">Follow-up (Before Today)</span></span>
                                                <div class="pull-right">
                                                    <span class="font-26">
                                                        <asp:Label runat="server" ID="lbl_PendingFollowUp" CssClass="number" Text="0"></asp:Label></span>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-9">
                            <div id="orderdetailp">
                                <div class="panel">
                                    <div class="panel-wrapper collapse in">
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-2 col-sm-2 col-lg-2 col-xs-4">
                                                    <div class="form-group">
                                                        <label class="mb-5">From Date</label>
                                                        <span class="MandatoryValue">* </span>
                                                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtFromDate" Text="*" ValidationGroup="Search" ForeColor="Red"></asp:RequiredFieldValidator>
                                                        <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control txtFromDate  datetime" AutoCompleteType="Disabled"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-2 col-sm-2 col-lg-2 col-xs-4">
                                                    <div class="form-group">
                                                        <label class="mb-5">To Date</label>
                                                        <span class="MandatoryValue">* </span>
                                                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtToDate" Text="*" ValidationGroup="Search" ForeColor="Red"></asp:RequiredFieldValidator>
                                                        <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control txtToDate  datetime" AutoCompleteType="Disabled"></asp:TextBox>
                                                    </div>
                                                </div>

                                                <div class="col-md-2 col-sm-2 col-lg-2 col-xs-4">
                                                    <div class="form-group">
                                                        <label class="mb-5">Order From</label>
                                                        <span class="MandatoryValue">* </span>
                                                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="txtToDate" Text="*" ValidationGroup="Search" ForeColor="Red"></asp:RequiredFieldValidator>
                                                        <asp:CheckBoxList ID="chkboxorderfrom" runat="server" AutoPostBack="false" Width="250px" RepeatDirection="Horizontal" >
                                                            <asp:ListItem Value="1"> From Mobile </asp:ListItem>
                                                            <asp:ListItem Value="0"> From Web </asp:ListItem>
                                                            <asp:ListItem  Value ="-1" Selected="True"> All </asp:ListItem>
                                                        </asp:CheckBoxList>
                                                    </div>
                                                </div>

                                                <div class="col-md-8 col-sm-8 col-lg-8 col-xs-4" style="margin-top: 9px;">
                                                    <div class="button-list text-right">
                                                        <asp:Button ID="btnSearch" CssClass="btn btn-success btnSearch" runat="server" ValidationGroup="Search" Text="Search" OnClick="btnSearch_Click" />
                                                        <asp:Button ID="btnCancel" CssClass="btn btn-default" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-6 col-xs-12">
                                    <div class="panel" style="border: 1px solid #efede6;">
                                        <div class="panel-heading">
                                            Product Wise Number Of Orders
                                        </div>
                                        <div class="panel-wrapper collapse in">
                                            <div class="panel-body">
                                                <div class="table-wrap">
                                                    <div class="table-responsive" style="height: 200px;">
                                                        <table class="table mb-0">
                                                            <thead>
                                                                <tr>
                                                                    <th class="" style="width: 20px;">S.No </th>
                                                                    <th class="">Product </th>
                                                                    <th class="AllignCenter">Total Quantity </th>
                                                                    <th class="AllignCenter">Total Orders </th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <asp:Repeater ID="rpt_Product" runat="server">
                                                                    <ItemTemplate>
                                                                        <tr id="tr1" runat="server">
                                                                            <td class="">
                                                                                <%#(((RepeaterItem)Container).ItemIndex+1).ToString()%>
                                                                            </td>
                                                                            <td class="">
                                                                                <%# Eval("ProductName") %>
                                                                            </td>
                                                                            <td class="AllignCenter">
                                                                                <asp:Label runat="server" CssClass="number" Text='<%# Eval("TotalOrderedQuantity") %>'></asp:Label>
                                                                            </td>
                                                                            <td class="AllignCenter">
                                                                                <asp:Label runat="server" CssClass="number" Text='<%# Eval("TotalOrders") %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-xs-12">
                                    <div class="panel" style="border: 1px solid #efede6;">
                                        <div class="panel-heading">
                                            Distributor Wise Number Of Orders
                                        </div>
                                        <div class="panel-wrapper collapse in">
                                            <div class="panel-body">
                                                <div class="table-wrap">
                                                    <div class="table-responsive" style="height: 200px;">
                                                        <table class="table mb-0">
                                                            <thead>
                                                                <tr>
                                                                    <th class="" style="width: 20px;">S.No </th>
                                                                    <th class="">Distributor </th>
                                                                    <th class="AllignCenter">Total Orders </th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <asp:Repeater ID="rpt_Distributor" runat="server">
                                                                    <ItemTemplate>
                                                                        <tr id="tr1" runat="server">
                                                                            <td class="">
                                                                                <%#(((RepeaterItem)Container).ItemIndex+1).ToString()%>
                                                                            </td>
                                                                            <td class="">
                                                                                <%# Eval("DistributorName") %>
                                                                            </td>
                                                                            <td class="AllignCenter">
                                                                                <asp:Label runat="server" CssClass="number" Text='<%# Eval("TotalOrders") %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                            </tbody>
                                                            <tfoot>
                                                                <tr runat="server" id="tr_Total_DistributorWiseNumberOfOrders" visible="false">
                                                                    <th>Total</th>
                                                                    <th></th>
                                                                    <th class="AllignCenter">
                                                                        <asp:Label runat="server" ID="lbl_Total_DistributorWiseNumberOfOrders" CssClass="number" Text="0"></asp:Label></th>
                                                                </tr>
                                                            </tfoot>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-xs-12">
                                    <div class="panel" style="border: 1px solid #efede6;">
                                        <div class="panel-heading">
                                            Nature Wise Number Of Complaints / Inqueries
                                        </div>
                                        <div class="panel-wrapper collapse in">
                                            <div class="panel-body">
                                                <div class="table-wrap">
                                                    <div class="table-responsive" style="height: 200px;">
                                                        <table class="table mb-0">
                                                            <thead>
                                                                <tr>
                                                                    <th class="" style="width: 20px;">S.No </th>
                                                                    <th class="">Nature </th>
                                                                    <th class="AllignCenter">Type </th>
                                                                    <th class="AllignCenter">Count </th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <asp:Repeater ID="rpt_Complaint_Inquiry" runat="server">
                                                                    <ItemTemplate>
                                                                        <tr id="tr1" runat="server">
                                                                            <td class="">
                                                                                <%#(((RepeaterItem)Container).ItemIndex+1).ToString()%>
                                                                            </td>
                                                                            <td class="">
                                                                                <%# Eval("Nature") %>
                                                                            </td>
                                                                            <td class="AllignCenter">
                                                                                <%# Eval("Type") %>
                                                                            </td>
                                                                            <td class="AllignCenter">
                                                                                <asp:Label runat="server" CssClass="number" Text='<%# Eval("Total") %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                            </tbody>
                                                            <tfoot>
                                                                <tr runat="server" id="tr_Total_NatureWiseNumberOfComplaints_Inqueries" visible="false">
                                                                    <th>Total</th>
                                                                    <th></th>
                                                                    <th></th>
                                                                    <th class="AllignCenter">
                                                                        <asp:Label runat="server" ID="lbl_Total_NatureWiseNumberOfComplaints_Inqueries" CssClass="number" Text="0"></asp:Label></th>
                                                                </tr>
                                                            </tfoot>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-xs-12">
                                    <div class="panel" style="border: 1px solid #efede6;">
                                        <div class="panel-heading">
                                            Number Of Orders Booked By User
                                        </div>
                                        <div class="panel-wrapper collapse in">
                                            <div class="panel-body">
                                                <div class="table-wrap">
                                                    <div class="table-responsive" style="height: 200px;">
                                                        <table class="table mb-0">
                                                            <thead>
                                                                <tr>
                                                                    <th class="" style="width: 20px;">S.No </th>
                                                                    <th class="">Role </th>
                                                                    <th class="AllignCenter">User Name </th>
                                                                    <th class="AllignCenter">Total Orders </th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <asp:Repeater ID="rpt_NumberOfOrdersBookedByEach" runat="server">
                                                                    <ItemTemplate>
                                                                        <tr id="tr1" runat="server">
                                                                            <td class="">
                                                                                <%#(((RepeaterItem)Container).ItemIndex+1).ToString()%>
                                                                            </td>
                                                                            <td class="">
                                                                                <%# Eval("RoleName") %>
                                                                            </td>
                                                                            <td class="AllignCenter">
                                                                                <%# Eval("CreatedBy") %>
                                                                            </td>
                                                                            <td class="AllignCenter">
                                                                                <asp:Label runat="server" CssClass="number" Text='<%# Eval("TotalOrders") %>'></asp:Label>
                                                                            </td>
                                                                        </tr>

                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                            </tbody>
                                                            <tfoot>
                                                                <tr runat="server" id="tr_Total_NumberOfOrdersBookedByEachUser" visible="false">
                                                                    <th>Total</th>
                                                                    <th></th>
                                                                    <th></th>
                                                                    <th class="AllignCenter">
                                                                        <asp:Label runat="server" ID="lbl_Total_NumberOfOrdersBookedByEachUser" CssClass="number" Text="0"></asp:Label></th>
                                                                </tr>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>

    <script type="text/javascript">

        function CurrencyFormate() {
            $('.money').each(function () {
                var value = $(this).html();
                value = value.replace(",", "");
                value = parseFloat(value);
                $(this).html(accounting.formatMoney(value, ''))
            });

            $('.number').each(function () {
                var value = $(this).html();
                value = value.replace(",", "");
                value = parseFloat(value);
                $(this).html(accounting.formatNumber(value))
            });
        }

        function pageLoad() {
            CurrencyFormate();

            $('.datetime').datepicker({
                forceParse: false,
                calendarWeeks: true,
                autoclose: true,
                format: 'dd-M-yyyy',
            });
            $('.datetime').keydown(function () {
                return false;
            });
        }


    </script>

</asp:Content>
