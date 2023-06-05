﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="Role.aspx.cs" Inherits="Pages_Security_Role" %>

<%@ Register Src="~/CustomControls/Shared/InProgress.ascx" TagPrefix="uc" TagName="InProgress" %>
<%@ Register Src="~/CustomControls/Shared/PagingAndSorting.ascx" TagPrefix="uc" TagName="PagingAndSorting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdateProgress ID="UpdateProgress2" runat="server">
        <ProgressTemplate>
            <uc:InProgress runat="server" ID="InProgress" />
        </ProgressTemplate>
    </asp:UpdateProgress>
    <div class="row heading-bg">
        <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
            <h5 class="txt-dark">Role</h5>
        </div>
    </div>
    <asp:UpdatePanel ID="upData" runat="server">
        <ContentTemplate>
            <input type="hidden" runat="server" id="IsAdd" value="0" />
            <input type="hidden" runat="server" id="IsView" value="0" />
            <input type="hidden" runat="server" id="IsEdit" value="0" />
            <input type="hidden" runat="server" id="IsDelete" value="0" />

            <div class="panel panel-default card-view">
                <div class="panel-wrapper collapse in">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-3 col-sm-3">
                                <div class="form-group">
                                    <label class="mb-5">Role</label>
                                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-9 col-sm-9" style="margin-top: 15px;">
                                <div class="button-list text-right">
                                    <asp:Button ID="btnSearch" CssClass="btn btn-success" runat="server" Text="Search" OnClick="btnSearch_Click" />
                                    <asp:Button ID="btnCancel" CssClass="btn btn-default" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="panel panel-default border-panel card-view">
                <div class="panel-wrapper collapse in">
                    <div class="panel-body">
                        <div class="text-right mb-15">
                            <asp:Button ID="Btn_Add" runat="server" Visible="false" Text="Add" CssClass="btn btn-success Btn_Add" OnClick="Btn_Add_Click" />
                        </div>
                        <div class="table-wrap">
                            <div class="table-responsive">
                                <table class="table table-striped display pb-30">
                                    <thead>
                                        <tr>
                                            <th>S.No</th>
                                            <th>Role </th>
                                            <th class="AllignCenter">Created By </th>
                                            <th class="AllignCenter">Modified By</th>
                                            <th class="AllignCenter" style="width: 200px;">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rpt" runat="server" OnItemDataBound="rpt_ItemDataBound">
                                            <ItemTemplate>
                                                <tr>
                                                    <input type="hidden" runat="server" id="hfRoleId" class="hfRoleId" value='<%# Eval("RoleId") %>' />
                                                    <input type="hidden" runat="server" id="hfRoleName" class="hfRoleName" value='<%# Eval("RoleName") %>' />
                                                    <input type="hidden" runat="server" id="hfIsactive" class="hfIsactive" value='<%# Eval("IsActive") %>' />
                                                    <td>
                                                        <%# Container.ItemIndex + 1 %>
                                                    </td>
                                                    <td>
                                                        <%# Eval("RoleName") %>
                                                    </td>
                                                    <td class="AllignCenter">
                                                        <%# Convert.ToString( Eval("CreatedBy")) == "" ? ""  : (Eval("CreatedBy") + " <br /> <strong>On</strong>")  %>

                                                        <%# Convert.ToString(Eval("CreatedDate")) == "" ? "" :  Convert.ToDateTime(Eval("CreatedDate")).ToString(HotelManagement_Utilities.GenericConstants.DateTimeFormat1_) %>
                                                    </td>
                                                    <td class="AllignCenter">
                                                        <%# Convert.ToString( Eval("ModifiedBy")) == "" ? ""  : (Eval("ModifiedBy") + " <br /> <strong>On</strong>")  %>
                                                        <%# Convert.ToString(Eval("ModifiedDate")) == "" ? "" :  Convert.ToDateTime(Eval("ModifiedDate")).ToString(HotelManagement_Utilities.GenericConstants.DateTimeFormat1_) %>
                                                    </td>
                                                    <td class="AllignCenter">
                                                        <asp:ImageButton ID="lbEdit" ImageUrl="~/Assets/Images/edit-icon.png" runat="server" Text="Edit" ToolTip="Edit" OnClick="lbEdit_Click" />
                                                        &nbsp
                                                        <asp:ImageButton ID="lbDelete" ImageUrl="~/Assets/Images/delete-icon.png" runat="server" Text="Remove" ToolTip="Remove" OnClick="lbDelete_Click" />
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </table>
                            </div>
                            <uc:PagingAndSorting runat="server" ID="PagingAndSorting" />
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <%-- Modal Start--%>
    <input type="button" data-toggle="modal" data-target="#AddEditModal" class="openmodal" style="display: none;" />
    <div class="modal fade in inmodal " id="AddEditModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog">
            <div class="modal-content animated">
                <div class="modal-header" style="padding-bottom: 9px; padding-top: 9px; text-align: center">
                    <h5 class="modal-title">Add / Update Role</h5>
                </div>
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <div class="modal-body">
                            <input type="hidden" id="hfId" runat="server" class="hfId" value="0" />
                            <div class="row">
                                <div class="col-md-6 col-sm-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="mb-5">Role</label>
                                        <asp:RequiredFieldValidator runat="server" ID="rfv_Product" ControlToValidate="txtRole" Text="*" ValidationGroup="Add" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txtRole" runat="server" MaxLength="30" CssClass="form-control txtRole clsTextBox" AutoCompleteType="Disabled"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6 col-sm-6 col-lg-6" runat="server" visible="false">
                                    <div class="form-group">
                                        <label class="mb-5">Active</label>
                                        <asp:CheckBox runat="server" ID="chk_IsActive" CssClass="form-control" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button Text="Save" CssClass="btn btn-primary" ID="btnAdd" ValidationGroup="Add" runat="server" OnClick="btnAdd_Click" />
                            <asp:Button Text="Cancel" ID="btnCancelEdit" runat="server" CssClass="btnCancelEdit btn btn-default" data-dismiss="modal" />
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
    <%-- Modal End--%>

    <%--Delete Modal Start--%>
    <input type="button" class="OpenDeleteModal" data-toggle="modal" data-target="#DeleteModal" style="display: none;" />
    <div class="modal fade in" id="DeleteModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog" style="width: 478px;">
            <div class="modal-content animated">
                <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                    <ContentTemplate>
                        <div class="modal-body text-center">
                            <input type="hidden" id="hfmodalDeleteId" runat="server" class="" value="" />
                            <i class="fa fa-exclamation-circle" style="font-size: 80px; color: #f83f37;"></i>
                            <h2 style="font-size: 30px; margin: 15px 0px; line-height: 40px;">Are you sure ?</h2>
                            <p style="font-size: 16px; color: #797979;">You want to delete</p>
                        </div>
                        <div class="modal-footer" style="text-align: center;">
                            <asp:Button Text="Yes, Delete it!" ID="btnDelete" runat="server" CssClass="btn btn-danger" OnClick="btnDelete_Click" Style="margin: 5px" />
                            <asp:Button Text="No, Cancel!" ID="btnCancelDelete" runat="server" CssClass="btnCancelDelete btn btn-default" data-dismiss="modal" Style="margin: 5px" />
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>

            </div>
        </div>
    </div>
    <%--Delete Modal End Here --%>


    <script type="text/javascript">

        function AlertBox(title, Message, type) {
            swal(title, Message, type);
        }

        function ClosePopup() {
            $('.hfId').val("0");
            $('.clsTextBox').val("");
            $('.btnCancelEdit').click();
        }

        function OpenPopup() {
            $('.openmodal').click();
        }
        function OpenModalDeleteModal() {
            $('.OpenDeleteModal').click();
        }
        function CloseDeleteModal() {
            $('.hfmodalDeleteId').val("0");
            $('.btnCancelDelete').click();
        }

    </script>

</asp:Content>

