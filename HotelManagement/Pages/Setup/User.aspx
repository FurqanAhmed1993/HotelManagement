<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.master" AutoEventWireup="true" CodeFile="User.aspx.cs" Inherits="Pages_Setup_User" %>

<%@ Register Src="~/CustomControls/Shared/InProgress.ascx" TagPrefix="uc" TagName="InProgress" %>
<%@ Register Src="~/CustomControls/Shared/PagingAndSorting.ascx" TagPrefix="uc" TagName="PagingAndSorting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     <style type="text/css">
        .chkChoice label {
            margin-left: 10px;
        }

        .chkChoice input {
            margin-left: 10px;
        }

        .chkChoice td {
            padding-left: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdateProgress ID="UpdateProgress2" runat="server">
        <ProgressTemplate>
            <uc:InProgress runat="server" ID="InProgress" />
        </ProgressTemplate>
    </asp:UpdateProgress>
    <div class="row heading-bg">
        <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
            <h5 class="txt-dark">User</h5>
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
                                    <asp:DropDownList runat="server" ID="ddlRoleSearch" CssClass="form-control"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-3">
                                <div class="form-group">
                                    <label class="mb-5">User</label>
                                    <asp:TextBox ID="txtUserSearch" runat="server" CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6" style="margin-top: 15px;">
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
                                            <th>Role</th>
                                            <th class="AllignCenter">User Name</th>
                                            <th class="AllignCenter">Login Id</th>
                                            <th class="AllignCenter">Email Address</th>
                                            <th class="AllignCenter">Hotels</th>
                                            
                                            <th class="AllignCenter">Active</th>
                                            <th class="AllignCenter">Created By </th>
                                            <th class="AllignCenter">Last Modified By</th>
                                            <th class="AllignCenter">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rpt" runat="server" OnItemDataBound="rpt_ItemDataBound">
                                            <ItemTemplate>
                                                <tr>
                                                    <input type="hidden" runat="server" id="hfUserId" class="hfUserId" value='<%# Eval("UserId") %>' />
                                                    
                                                    <td>
                                                         <%# Container.ItemIndex + 1 %>
                                                    </td>
                                                    <td>
                                                        <%# Eval("RoleName") %>
                                                    </td>
                                                    <td class="AllignCenter">
                                                        <%# Eval("UserName") %>
                                                    </td>
                                                    <td class="AllignCenter">
                                                        <%# Eval("LoginId") %>
                                                    </td>
                                                    <td class="AllignCenter">
                                                        <%# Eval("EmailAddress") %>
                                                    </td>
                                                    <td class="AllignCenter">
                                                        <%# Eval("HotelNames") %>
                                                    </td>
                                                    
                                                    <td class="AllignCenter">
                                                        <%# Convert.ToBoolean(Eval("IsActive")) == true ? "Yes" : "No" %>
                                                    </td>
                                                    <td class="AllignCenter">
                                                        <%# Convert.ToString( Eval("CreatedBy")) == "" ? ""  : (Eval("CreatedBy") + " <br /> <strong>On</strong> <br />")  %>

                                                        <%# Convert.ToString(Eval("CreatedDate")) == "" ? "" :  Convert.ToDateTime(Eval("CreatedDate")).ToString(HotelManagement_Utilities.GenericConstants.DateTimeFormat1_) %>
                                                    </td>
                                                    <td class="AllignCenter">
                                                        <%# Convert.ToString( Eval("ModifiedBy")) == "" ? ""  : (Eval("ModifiedBy") + " <br /> <strong>On</strong> <br />")  %>
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

                                <uc:PagingAndSorting runat="server" ID="PagingAndSorting" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </ContentTemplate>
        <%--<Triggers>
            <asp:PostBackTrigger ControlID="btnExport" />
        </Triggers>--%>
    </asp:UpdatePanel>

    <%-- Modal Start--%>
    <input type="button" data-toggle="modal" data-target="#AddEditModal" class="openmodal" style="display: none;" />
    <div class="modal fade in inmodal " id="AddEditModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog">
            <div class="modal-content animated">
                <div class="modal-header" style="padding-bottom: 9px; padding-top: 9px; text-align: center">
                    <h5 class="modal-title">Add / Update User</h5>
                </div>
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <div class="modal-body">
                            <input type="hidden" id="hfId" runat="server" class="hfId" value="0" />

                            <div class="row">
                                <div class="col-md-6 col-sm-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="mb-5">Role</label>
                                        <span class="MandatoryValue">* </span>
                                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator10" ControlToValidate="ddlRole" InitialValue="" Text="*" ValidationGroup="Add" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator11" ControlToValidate="ddlRole" InitialValue="0" Text="*" ValidationGroup="Add" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:DropDownList runat="server" ID="ddlRole" CssClass="form-control ddlRole clsDropDown" AutoPostBack="true" OnSelectedIndexChanged="ddlRole_SelectedIndexChanged"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="mb-5">User Name</label>
                                        <span class="MandatoryValue">* </span>
                                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="txtUserName" Text="*" ValidationGroup="Add" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txtUserName" runat="server" MaxLength="30" CssClass="form-control txtUserName clsTextBox" AutoCompleteType="Disabled"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-sm-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="mb-5">Login Id</label>
                                        <span class="MandatoryValue">* </span>
                                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator13" ControlToValidate="txtLoginId" Text="*" ValidationGroup="Add" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txtLoginId" runat="server" MaxLength="30" CssClass="form-control txtLoginId clsTextBox " AutoCompleteType="Disabled"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="mb-5">Email Address</label>
                                        <span class="MandatoryValue">* </span>
                                        <asp:RegularExpressionValidator ID="regexResponsibleValid" runat="server" Display="Dynamic" ValidationGroup="Add" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                            ControlToValidate="txtEmailAddress" ForeColor="Red" ErrorMessage="Invalid" Text="Invalid "></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator15" ControlToValidate="txtEmailAddress" Text="*" ValidationGroup="Add" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txtEmailAddress" runat="server" MaxLength="49" CssClass="form-control txtEmailAddress clsTextBox" AutoCompleteType="Disabled"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row">
                                 <div class="col-md-6 col-sm-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="mb-5">Phone Number</label>
                                        <span class="MandatoryValue">* </span>
                                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtPhoneNumber" Text="*" ValidationGroup="Add" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txtPhoneNumber" runat="server" MaxLength="49" CssClass="form-control txtPhoneNumber clsTextBox" AutoCompleteType="Disabled"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="mb-5">Active</label>
                                        <asp:CheckBox runat="server" ID="chk_IsActive" CssClass="form-control " />
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default card-view">
                                <div class="panel-heading text-center">
                                    <h5>User - Hotel Mapping</h5>
                                </div>
                                <div class="panel-wrapper collapse in">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-md-12 col-sm-12 col-lg-12">
                                                <div style="max-height: 100px; overflow: auto;">
                                                     <asp:CheckBoxList ID="chkHotelList" runat="server"  RepeatColumns="5" CellPadding="1" CssClass="cblCheckAll chkChoice" RepeatDirection="Vertical"  ></asp:CheckBoxList>
                                                
                                                </div>
                                            </div>
                                        </div>
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
        function pageLoad() {
            $('.cblCheckAll input').change(function () {
                var currChk = $(this);

                if ($(this).val() == "0") {
                    $(this).closest('table').find('input:checkbox').prop('checked', $(currChk).is(':checked'));
                }
                else {
                    var allCheckboxCount = $(this).closest('table').find('input:checkbox').size();
                    var allCheckedCount = $(this).closest('table').find('input:checkbox:checked').not('input:checkbox[value=0]').size();
                    var isChecked = false;
                    if (allCheckedCount >= allCheckboxCount - 1) {
                        isChecked = true;
                    }
                    $(this).closest('table').find('input:checkbox[value=0]').prop('checked', isChecked);
                }
            });
            $(".integers").on("keypress", function (evt) {
                var charCode = (evt.which) ? evt.which : evt.keyCode;
                if (charCode > 31 && (charCode < 48 || charCode > 57))
                    return false;
                return true;
            });


            $(".decimals").on("keypress", function (evt) {
                var $txtBox = $(this);
                var charCode = (evt.which) ? evt.which : evt.keyCode
                if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46)
                    return false;
                else {
                    var len = $txtBox.val().length;
                    var index = $txtBox.val().indexOf('.');
                    if (index > 0 && charCode == 46) {
                        return false;
                    }
                    if (index > 0) {
                        var charAfterdot = (len + 1) - index;
                        if (charAfterdot > 3) {
                            return false;
                        }
                    }
                }
                return $txtBox; //for chaining
            });
        }

        function AlertBox(title, Message, type) {
            swal(title, Message, type);
        }

        function ClosePopup() {
            $('.hfId').val("0");
            $('.clsTextBox').val("");
            $('.clsDropDown').val("0");
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

