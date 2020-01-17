<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignUpTenant.aspx.cs" Inherits="SignUpTenant" %>

<!DOCTYPE html>
<script runat="server">

</script>

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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    
<!--===============================================================================================-->
    
    <!-- Custom fonts for this page -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
    
<!-- Javascript links -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  
    <script type="text/javascript">
    function openModal() {
        $('#signupModal').modal('show');
    }
    </script>

</head>
<body>
	
    
	
    <!-- Navigation -->
  <nav class="navbar navbar-light bg-light static-top p-b-50">
    <div class="container">
      <a class="navbar-brand" href="index.aspx"><img src="img/logotransparent.png" alt="roommagnet logo" style="width:100px;"></a>
    </div>
  </nav>
	
    
    <div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-50 p-r-50 p-t-77 p-b-30">
                <form id="form1" runat="server">
					<span class="login100-form-title p-b-55">
						Join Roommagnet
                        <p style="font-size: 18px">Tenant</p>
                        <p>Not a future tenant? <br><a href="SignUpHomeowner.aspx">Sign up as a homeowner</a></p>
					</span>
                      <div class="form-row">
                        <div class="form-group col-md-12">
                          <label for="inputEmail4">Email</label>
                          <input type="email" class="form-control" runat ="server" placeholder="Email" id="txtTenEmail">
                            <asp:RequiredFieldValidator ID="ReqTenEmail" ControlToValidate="txtTenEmail" runat="server" Text="*Required" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:Label ID="lblEmailFormat" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="lblTenEmailNo" runat="server" Visible="False"></asp:Label>
                        </div>
                      </div>
                      <div class="form-row">
                        <div class="form-group col-md-12">
                          <label>Password</label>
                          <input type="password" class="form-control" runat ="server" placeholder="Password" id="txtTenPass">
                          <asp:RequiredFieldValidator ID="ReqTenPass" runat="server" ControlToValidate="txtTenPass" Display="Dynamic" ForeColor="Red">*Required</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server"
                                ControlToValidate="txtTenPass"
                                ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"
                                Display="Dynamic"
                                ForeColor="Red" Text="*Password must be Minimum 8 characters, at least one uppercase letter, one lowercase letter and one number." />
                        </div>
                      </div>
                    <div class="form-group">
                        <label>Name</label>
                    <div class="form-row">
                        
                        <div class="col">
                          <input type="text" class="form-control" runat ="server" placeholder="First name" id="txtTenFN">
                          <asp:RequiredFieldValidator ID="ReqTenFN" runat="server" ControlToValidate="txtTenFN" Display="Dynamic" ForeColor="Red">*Required</asp:RequiredFieldValidator>
                        </div>
                        <div class="col">
                          <input type="text" class="form-control" runat ="server" placeholder="Last name" id="txtTenLN">
                          <asp:RequiredFieldValidator ID="ReqTenLN" runat="server" ControlToValidate="txtTenLN" Display="Dynamic" ForeColor="Red">*Required</asp:RequiredFieldValidator>
                        </div>
                      </div>
                    </div>
                      <div class="form-row">
                          <div class="form-group col-md-6"> <label>Telephone</label>
                          <div class="">
                            <input class="form-control" runat ="server" type="tel" placeholder="555-555-5555" id="txtTenPhone">
                          <asp:RequiredFieldValidator ID="ReqTenPhone" runat="server" ControlToValidate="txtTenPhone" Display="Dynamic" ForeColor="Red">*Required</asp:RequiredFieldValidator>
                          </div>
                        </div>
                      </div>
                    <div class="form-row">
                    <div class="form-group col-md-11"><label>Tenant Type </label>
                    <select id="dropTenType" runat ="server" class="form-control mb-3">
                      <option selected></option>
                      <option value="Undergrad">Undergrad</option>
                      <option value="Student">Student</option>
                      <option value="Graduate Student">Grad Student</option>
                      <option value="Residency">Residency</option>
                      <option value="Young Professional">Young Professional</option>
                      <option value="Other">Other</option>
                    </select><asp:RequiredFieldValidator ID="ReqTenType" runat="server" ControlToValidate="dropTenType" Display="Dynamic" ForeColor="Red">*Required</asp:RequiredFieldValidator>
                     </div>
                    </div>
                    <label>Date of Birth <a class="help" title="Must be 18 or older to join Roommagnet, your date of birth will not be visible to other users"> <i class="fa fa-question-circle" style="font-size: 15px;"></i></a></label>
                    <div class="validate-input m-b-16" data-validate = "Valid date of birth is required: ex: 01/01/1901">
                    <div class="form-group row">
                      <div class="col-10">
                        <input class="form-control" type="date" runat="server" placeholder="01/01/1901" id="txtTenBD">
                          <asp:RequiredFieldValidator ID="ReqTenBD" runat="server" ControlToValidate="txtTenBD" Display="Dynamic" ForeColor="Red">*Required</asp:RequiredFieldValidator>
                        <asp:Label ID="lblTenBDNo" runat="server" Visible="False"></asp:Label>
                      </div>
                    
                    </div>
                    </div>
                     <div class="form-row">
                     <div class="form-group col-md-11"><label>Profile Photo </label>
                      <asp:FileUpload ID="imgUpload" runat="server" />
                      </div>
                         <asp:Label ID="lblUpPic" runat="server" Visible="False"></asp:Label>
                      </div>

            

					<div class="contact100-form-checkbox m-l-4">
						<input class="input-checkbox100" id="ckb2" type="checkbox" name="remember-me">
						<label class="label-checkbox100" for="ckb2">
							Remember me						
						</label>
					</div>
					
					<div class="auto-style48">
					    <asp:Button class="login100-form-btn" ID="BtnTenSingUp" runat="server" Text="Sign Up" OnClick="BtnTenSingUp_Click"/>
                        <asp:Button class="login100-form-btn" ID="BtnTenPop" runat="server" Text="Populate" OnClick="BtnTenPop_Click" CausesValidation="False" />
                        <asp:Button class="login100-form-btn" ID="BtnTenClear" runat="server" Text="Clear" OnClick="BtnTenClear_Click" CausesValidation="False" />
					</div>

					<div class="text-center w-full p-t-42 p-b-22">
						<span class="txt1">
							Or sign up with
						</span>
                        </div>
					<a href="#" class="btn-google" style="margin-left: 89px;">
						<img src="signin_page/images/icons/icon-google.png" alt="GOOGLE">
						Google
					</a>
                    
					<div class="text-center w-full p-t-115">
						<span class="txt1">
							Already a member?
						</span>

						<a class="txt1 bo1 hov1" href="Signin.aspx">
							Log in now							
						</a>
                </div>
                <!-- Modal -->
                <div class="modal fade" id="signupModal" runat="server" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-body">
                        <h10>You have signed up successfully</h10>
                      </div>
                      <div class="modal-footer">
                        <asp:Button ID="btnClose" class="btn btn-secondary" Text="Close"  runat="server" data-dismiss="modal" CausesValidation="False" Height="40" Width="80" />
                        <asp:Button ID="btnGoSignin" class="btn btn-primary" Text="Go Sign in" runat="server" OnClick="btnGoSignin_Click" CausesValidation="False" Height="40" Width="90" />
                      </div>
                    </div>
                  </div>
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