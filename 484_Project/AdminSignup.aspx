<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminSignup.aspx.cs" Inherits="AdminSignup" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Roommagnet Admin</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="img/logotransparent.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="signin_page/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="signin_page/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="signin_page/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="signin_page/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="signin_page/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="signin_page/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="signin_page/css/util.css">
	<link rel="stylesheet" type="text/css" href="signin_page/css/main.css">
<!--===============================================================================================-->
    <!-- Custom fonts for this page -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- Navigation -->
  <nav class="navbar navbar-light bg-light static-top">
    <div class="container">
      <a class="navbar-brand" href="index.aspx"><img src="img/logotransparent.png" alt="roommagnet logo" style="width:100px;"></a>
    </div>
  </nav>
		<div class="container-login100">
			<div class="wrap-login100 p-l-50 p-r-50 p-t-77 p-b-30">
				<form class="login100-form" runat="server">
					<span class="login100-form-title p-b-55">
						Admin Signup
					</span>

                    <div class="wrap-input100 m-b-16">
						<input class="input100" id="txtAdminID" type="number" name="User" runat="server" placeholder="Admin ID">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtAdminID" runat="server" Display="Dynamic" ForeColor="Red">*Required</asp:RequiredFieldValidator>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<span class="lnr lnr-user"></span>
						</span>
					</div>

                    <div class="wrap-input100 m-b-16">
						<input class="input100" id="txtFN" type="text" name="User" runat="server" placeholder="FirstName" maxlength="25">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtFN" runat="server" Display="Dynamic" ForeColor="Red">*Required</asp:RequiredFieldValidator>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<span class="lnr lnr-user"></span>
						</span>
					</div>

                    <div class="wrap-input100 m-b-16">
						<input class="input100" id="txtLN" type="text" name="User" runat="server" placeholder="LastName" maxlength="25">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtLN" runat="server" Display="Dynamic" ForeColor="Red">*Required</asp:RequiredFieldValidator>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<span class="lnr lnr-user"></span>
						</span>
					</div>

					<div class="wrap-input100 m-b-16">
						<input class="input100" id="txtAdminUser" type="text" name="User" runat="server" placeholder="Username" maxlength="50">
                        <asp:RequiredFieldValidator ID="ReqSigninUser" ControlToValidate="txtAdminUser" runat="server" Display="Dynamic" ForeColor="Red">*Required</asp:RequiredFieldValidator>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<span class="lnr lnr-user"></span>
						</span>
					</div>

					<div class="wrap-input100 validate-input m-b-16" data-validate = "Password is required">
						<input class="input100" id="txtAdminPass" runat="server" type="password" name="pass" placeholder="Password" maxlength="50">
                        <asp:RequiredFieldValidator ID="ReqSigninPass" ControlToValidate="txtAdminPass" runat="server" Display="Dynamic" ForeColor="Red">*Required</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server"
                                ControlToValidate="txtAdminPass"
                                ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"
                                Display="Dynamic"
                                ForeColor="Red" Text="*Password must be Minimum 8 characters, at least one uppercase letter, one lowercase letter and one number." />
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<span class="lnr lnr-lock"></span>
						</span>
					</div>
					
					<div class="container-login100-form-btn p-t-25">
						<asp:Button class="login100-form-btn" ID="BtnLogin" runat="server" Text="Sign Up" OnClick="BtnSignUp_Click" />
					</div>
                    <div class="text-center w-full p-t-115">
                        <a class="txt1 bo1 hov1" href="AdminSignin.aspx">
							<i>Administrator Login</i>				
						</a>
                        </div>
				</form>
			</div>
		</div>
	
	

	
<!--===============================================================================================-->	
	<script src="signin_page/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="signin_page/vendor/bootstrap/js/popper.js"></script>
	<script src="signin_page/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="signin_page/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="signin_page/js/main.js"></script>

</body>
</html>
