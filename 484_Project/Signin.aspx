<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Signin.aspx.cs" Inherits="Signin" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Roommagnet Login</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="signin_page/images/icons/favicon.ico"/>
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
	
    
    <div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-50 p-r-50 p-t-77 p-b-30">
				<form id="form1" runat="server">
					<span class="login100-form-title p-b-55">
						Login
					</span>

					<div class="wrap-input100 m-b-16">
						<input class="input100" id="txtSignInEmail" type="text" name="email" runat="server" placeholder="Email">
                        <asp:RequiredFieldValidator ID="ReqSigninEmail" ControlToValidate="txtSigninEmail" runat="server" Display="Dynamic" ForeColor="Red">*Required</asp:RequiredFieldValidator>
						<span class="focus-input100"></span>
						<span class="symbol-input100">							
							<span class="lnr lnr-envelope"></span>
						</span>
					</div>

					<div class="wrap-input100 validate-input m-b-16" data-validate = "Password is required">
						<input class="input100" id="txtSignInPass" type="password" name="pass" runat="server" placeholder="Password">
                        <asp:RequiredFieldValidator ID="ReqSigninPass" ControlToValidate="txtSignInPass" runat="server" Display="Dynamic" ForeColor="Red">*Required</asp:RequiredFieldValidator>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<span class="lnr lnr-lock"></span>
						</span>
					</div>

					<div class="contact100-form-checkbox m-l-4">
						<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
						<label class="label-checkbox100" for="ckb1">
							Remember me
						</label>
					</div>
					
                    <div class="auto-style48">
					    <asp:Button class="login100-form-btn" ID="BtnLogin" runat="server" Text="Login" OnClick="BtnLogin_Click"/>
                    </div>

					<div class="text-center w-full p-t-115">
						<span class="txt1">
							Not a member? 
						</span>
                        <br>
						<a class="txt1 bo1 hov1" href="SignUpTenant.aspx">
							Sign up as Tenant						
						</a>
                        <br>
                        <a class="txt1 bo1 hov1" href="SignUpHomeowner.aspx">
							Sign up as Host						
						</a>
                        <br>
                        <a class="txt1 bo1 hov1" href="AdminSignin.aspx">
							<i>Administrator Login</i>				
						</a>

					</div>
				</form>
			</div>
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