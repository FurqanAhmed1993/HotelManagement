<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login"  %>
<%--EnableEventValidation="false"--%>
<%@ Register Src="~/CustomControls/Shared/InProgress.ascx" TagPrefix="uc" TagName="InProgress" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>Sanofi CRM - Patient Program</title>
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <!-- Favicon -->
    <link rel="shortcut icon" href="favicon.ico" />
    <link rel="icon" href="favicon.ico" type="image/x-icon" />
    <!-- vector map CSS -->
    <link href="Assets/vendors/bower_components/jasny-bootstrap/dist/css/jasny-bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Sweet Alert CSS -->
    <link href="../Assets/vendors/bower_components/sweetalert/dist/sweetalert.css" rel="stylesheet" type="text/css" />

    <!-- Custom CSS -->
    <link href="Assets/dist/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>

    <div class="wrapper pa-0" >
        <header class="sp-header">
            <div class="sp-logo-wrap pull-left">
                <a href="index-2.html">
                    <span class="brand-text">
                        <img src="Assets/img/sgso-logo.png" alt="brand" /></span>
                </a>
            </div>
            <div class="clearfix"></div>
        </header>

        <!-- Main Content -->
        <div class="page-wrapper pa-0 ma-0 auth-page">

            <div class="container">
                <!-- Row -->
                <div class="table-struct full-width full-height">
                    <div class="auth-form-wrap">
                        <div class="ml-auto mr-auto no-float">
                            <div class="row">
                                <div class="col-lg-8 col-md-10 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-1">
                                    <div class="auth-limage">
                                    </div>
                                    <form id="form1" runat="server">
                                        <asp:ScriptManager runat="server" />
                                        <div class="aform-wrap" >
                                            <div class=" auth-form">
                                                <h2 class="text-center">WELCOME</h2>
                                                <h6 class="text-center nonecase-font mb-20">Sign in to continue</h6>

                                                <div class="form-group">
                                                    <label class="control-label mb-5" for="inputLogin">Login id</label>
                                                    <asp:TextBox runat="server" ID="txtUserName" CssClass="form-control" placeholder="Login Id" />
                                                </div>
                                                <div class="form-group">
                                                    <label class="pull-left control-label mb-5" for="inputpwd">Password</label>
                                                    <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="form-control" placeholder="Password" />
                                                </div>
                                                <div class=" text-left">
                                                    <asp:Label runat="server" ID="lblValidation" Style="color: white;"></asp:Label>
                                                </div>
                                                <div class="text-center mb-20">
                                                    <asp:Button Text="Login" ID="btnLogin" CssClass="btn btn-block btn-green" ValidationGroup="LoginGroup" OnClick="btnLogin_Click" runat="server" />
                                                </div>
                                                <div class="form-copyright text-center">
                                                    Copyright © <span>
                                                        <asp:Label runat="server" ID="lblYear"></asp:Label></span> Sybrid Pvt Ltd. 
											
                                                </div>

                                            </div>
                                            <a href="#" class="form-forgot">Forgot Password</a>
                                        </div>

                                        <!-- Modal -->
                                        <input type="button" class="OpenModal" data-toggle="modal" data-target="#CreateProjectModal" style="display: none;" />
                                        <div class="modal fade in" id="CreateProjectModal" tabindex="-1" role="dialog" aria-hidden="true" >
                                            <div class="modal-dialog">
                                                <div class="modal-content animated ">
                                                    <div class="modal-header" style="padding-bottom: 9px; padding-top: 9px;">
                                                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                                        <h5 class="modal-title">Forgot Password</h5>

                                                        <input type="hidden" id="Hidden1" runat="server" class="hfCompanyId" />
                                                    </div>

                                                    <div class="modal-body" style="padding-bottom: 10px; border-bottom-width: 10px; padding-top: 10px;">
                                                        <asp:UpdatePanel runat="server">
                                                            <ContentTemplate>
                                                                <div class="panel" style="margin-bottom: 0px;">
                                                                    <div class="panel-body">
                                                                        <div class="col-lg-12">
                                                                            <div class="form-group">
                                                                                <label for="exampleInputPassword2">
                                                                                    We'll email your password after reset. Please enter your login Id</label>
                                                                                <asp:RequiredFieldValidator ID="rfvtxtnic" runat="server" ValidationGroup="Save" Text="*"
                                                                                    ErrorMessage="*" ForeColor="Red"
                                                                                    Display="Dynamic" ControlToValidate="txtLoginId" CssClass="rfv"></asp:RequiredFieldValidator>
                                                                                <asp:TextBox ID="txtLoginId" runat="server" CssClass="form-control numeric txtLoginId" placeholder="Login Id" AutoCompleteType="Disabled"></asp:TextBox>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <label id="Label2" runat="server" class="label label-danger" visible="false"></label>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <asp:Button Text="Reset Password" class="btn btn-success btn-outline " ID="btnForgetPassword" ValidationGroup="Save" runat="server" OnClick="btnForgetPassword_Click" />
                                                                    
                                                                </div>
                                                                
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>

                                                        <asp:UpdateProgress ID="UpdateProgress2" runat="server">
                                                            <ProgressTemplate>
                                                                <uc:InProgress runat="server" ID="InProgress" />
                                                            </ProgressTemplate>
                                                        </asp:UpdateProgress>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Row -->




            </div>

        </div>
        <!-- /Main Content -->

    </div>
    <!-- /#wrapper -->

    <!-- JavaScript -->

    <!-- SweetAlert JavaScript -->
    <script src="../Assets/vendors/bower_components/sweetalert/dist/sweetalert.min.js"></script>

    <!-- jQuery -->
    <script src="Assets/vendors/bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="Assets/vendors/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="Assets/vendors/bower_components/jasny-bootstrap/dist/js/jasny-bootstrap.min.js"></script>

    <!-- Slimscroll JavaScript -->
    <script src="Assets/dist/js/jquery.slimscroll.js"></script>

    <!-- Init JavaScript -->
    <script src="Assets/dist/js/init.js"></script>

    <script>
        function pageLoad() {
            $('.form-forgot').click(function () {
                $('.txtLoginId').val('');
                $(".OpenModal").click();
            });
        }
        function AlertBox(title, Message, type) {
            swal(title, Message, type);
        }
        function ClosePopup() {
            $('.modal').hide();
            $('body').removeClass('modal-open');
            $('.modal-backdrop').remove();
        }
    </script>
</body>
</html>

