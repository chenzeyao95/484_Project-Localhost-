﻿ <%@ Page Language="C#" AutoEventWireup="true" CodeFile="HostDash.aspx.cs" Inherits="HostDash" %>

<!DOCTYPE html>
<script runat="server">


</script>

<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>
    Roommagnet Dashboard
  </title>
  <!-- Favicon -->
  <link href="img/logotransparent.png" rel="icon" type="image/png">
  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <!-- Icons -->
  <link href="assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
  <link href="assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
</head>

<body class="">
<form runat="server"> 
  <nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
    <div class="container-fluid">
      <!-- Toggler -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <!-- Brand -->
      <a class="navbar-brand pt-0" href="index.aspx">
        <img src="img/logotransparent.png" class="navbar-brand-img" alt="room magnet logo">
      </a>
      <!-- User -->
      <ul class="nav align-items-center d-md-none">
        
        <li class="nav-item dropdown">
          <a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <div class="media align-items-center">
              <span class="avatar avatar-sm rounded-circle">
                <img alt="avatar image" src="<%:CurrentSession.Current.hImage%>" class="rounded-circle">
              </span>
            </div>
          </a>
          <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
            <div class=" dropdown-header noti-title">
              <h6 class="text-overflow m-0">Welcome!</h6>
            </div>
            <a href="HostDash.aspx" class="dropdown-item">
              <i class="ni ni-single-02"></i>
              <span>My profile</span>
            </a>
            <a href="help.html" class="dropdown-item">
              <i class="ni ni-support-16"></i>
              <span>Support</span>
            </a>
            <div class="dropdown-divider"></div>
            <a href="Signin.aspx" class="dropdown-item">
              <i class="ni ni-user-run"></i>
              <span>Logout</span>
            </a>
          </div>
        </li>
      </ul>
      <!-- Collapse -->
      <div class="collapse navbar-collapse" id="sidenav-collapse-main">
        <!-- Collapse header -->
        <div class="navbar-collapse-header d-md-none">
          <div class="row">
            <div class="col-6 collapse-brand">
              <a href="index.aspx">
                <img src="img/logotransparent.png">
              </a>
            </div>
            <div class="col-6 collapse-close">
              <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle sidenav">
                <span></span>
                <span></span>
              </button>
            </div>
          </div>
        </div>

        <!-- Navigation -->
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link active" href="HostDash.aspx">
              <i class="ni ni-single-02 text-yellow"></i> Dashboard
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="HostMatches.aspx">
              <i class="ni ni-like-2 text-info"></i> Your Matches
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="HostListing.aspx">
              <i class="ni ni-pin-3 text-pink"></i> Listings
            </a>
              </li>

            
        </ul>
        <!-- Divider -->
        <hr class="my-3">
        <!-- Heading -->
        <h6 class="navbar-heading text-muted">Account</h6>
        <!-- Navigation -->
        <ul class="navbar-nav mb-md-3">
          <li class="nav-item">
            <a class="nav-link" href="https://demos.creative-tim.com/argon-dashboard/docs/getting-started/overview.html">
              <i class="ni ni-settings-gear-65"></i>Settings
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Signin.aspx">
              <i class="ni ni-user-run"></i> Logout
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <div class="main-content">
    <!-- Navbar -->
    <nav class="navbar navbar-top navbar-expand-md navbar-dark" id="navbar-main">
      <div class="container-fluid">
        <!-- Brand -->
        <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block">Homeowner Dashboard</a>

        <!-- User -->
        <ul class="navbar-nav align-items-center d-none d-md-flex">
          <li class="nav-item dropdown">
            <a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <div class="media align-items-center">
                <span class="avatar avatar-sm rounded-circle">
                  <img alt="Image placeholder" src="<%:CurrentSession.Current.hImage%>">
                </span>
                <div class="media-body ml-2 d-none d-lg-block">
                  <span class="mb-0 text-sm  font-weight-bold">
                      <asp:Label
                          id="nameTopRight"
                          Text= " "
                          Runat="server" />

                  </span>
                </div>
              </div>
            </a>
            <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
              <div class=" dropdown-header noti-title">
                <h6 class="text-overflow m-0">Welcome!</h6>
              </div>
              <a href="help.html" class="dropdown-item">
                <i class="ni ni-support-16"></i>
                <span>Support</span>
              </a>
              <div class="dropdown-divider"></div>
              <a href="Signin.aspx" class="dropdown-item">
                <i class="ni ni-user-run"></i>
                <span>Logout</span>
              </a>
            </div>
          </li>
        </ul>
      </div>
    </nav>
    <!-- End Navbar -->
    <!-- Header -->
    <div class="header pb-8 pt-5 pt-lg-8 d-flex align-items-center" style="min-height: 600px; background-image: url(img/plants.jpg); background-size: cover; background-position: center top;">
      <!-- Mask -->
      <span class="mask bg-gradient-default opacity-3"></span>
      <!-- Header container -->
      <div class="container-fluid d-flex align-items-center">
        <div class="row">
          <div class="col-lg-7 col-md-10">
            <h1 class="display-2 text-white">
                <asp:Label
                    id="HelloName"
                    text= " "
                    runat="server" /></h1>
            <p class="text-white mt-0 mb-5">We are excited to get started, take our matchmaking survey to begin your listing</p>
          </div>
        </div>
      </div>
    </div>
    <!-- Page content -->
    <div class="container-fluid mt--7">
      <div class="row">
        <div class="col-xl-4 order-xl-2 mb-5 mb-xl-0">
          <div class="card card-profile shadow">
            <div class="row justify-content-center">
              <div class="col-lg-3 order-lg-2">
                <div class="card-profile-image">
                  <a href="#">
                    <img src="<%:CurrentSession.Current.hImage%>" class="rounded-circle">
                  </a>
                </div>
              </div>
            </div>
            <div class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
            </div>
            <div class="card-body pt-0 pt-md-4">
              <div class="row">
                <div class="col">
                  <div class="card-profile-stats d-flex justify-content-center mt-md-5">
                    
                    <div>
                      <span class="heading"><%:CurrentSession.Current.hListNo %></span>
                      <span class="description">Listing</span>
                    </div>
                    <div>
                      <span class="heading"><%:CurrentSession.Current.hReviewNo %></span>
                      <span class="description">Tenant Reviews</span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="text-center">
                <h3>
                  <span class="font-weight-light"></span>
                    <asp:Label
                        id="userName"
                        Text=" "
                        runat="server" />
                </h3>
                <div class="h5 font-weight-300">
                  <i class="ni location_pin mr-2"></i><asp:Label
                        id="hostLocation"
                        runat="server"
                        text=""/>
                </div>
                <div class="h5 mt-4">
                  <i class="ni business_briefcase-24 mr-2"></i>Host
                </div>
                <div class="h5 mt-4">
                  <i class="ni business_briefcase-24 mr-2"></i><strong>Member Since:</strong> <%:CurrentSession.Current.hLastUp %>
                    <br>
                   <b><asp:Label class="ni business_briefcase-24 mr-2" id="backgroundlbl" runat="server" Text=""></asp:Label></b>
                    <asp:Button ID="BGCheckBtn" runat="server" class="btn btn-sm btn-primary" Text="Apply for Background Screening" OnClick="BGCheckBtn_Click"
                         Visible="False" OnClientClick="return confirm('Are you sure you proceed with background screening? By accepting you are required to pay all associated fees. You will now be taken to the Intellicorp Website.')"/>
                </div>
                  <hr class="my-4" />
                    <i class="ni business_briefcase-24 mr-2"></i><strong>Message</strong>
                  <br><br>
                  <asp:Panel ID="Panel2" runat="server" HorizontalAlign="Right">
                 <asp:DataList ID="ListView2" runat="server">  
                     <FooterTemplate>
                      <i><asp:Label Visible='<%#bool.Parse((ListView2.Items.Count==0).ToString())%>' 
                                   runat="server" ID="lblNoRecord1" Text="No messages from Tenant"></asp:Label></i>
                    </FooterTemplate>
                <ItemTemplate>
                    <div class="row">
                        &nbsp&nbsp&nbsp&nbsp<h4><%#Eval("TenantName") %> (Tenant)</h4>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                        <asp:LinkButton  runat="server" class="btn btn-sm btn-primary"
                            ID="InterestBtn" 
                            Text="Contact" 
                            CommandName="contact" 
                            CommandArgument='<%# Eval("TenantID") %>'
                            OnCommand="Contact_serverClick" CausesValidation="False" />
                        </div>
                    <hr class="my-4" />
                </ItemTemplate>
            </asp:DataList>
          </asp:Panel>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-8 order-xl-1">
          <div class="card bg-secondary shadow">
            <div class="card-header bg-white border-0">
              <div class="row align-items-center">
                <div class="col-8">
                  <h3 class="mb-0">My account</h3>
                </div>
                
                <div class="col-4 text-right">
                  <asp:button id="saveInfoBtn" runat="server" text="Save Changes" class="btn btn-sm btn-primary" OnClick="saveInfoBtn_Click" CausesValidation="False"></asp:button>
                </div>
                   
              </div>
            </div>
            <div class="card-body">
              
                <h6 class="heading-small text-muted mb-4">User information</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-email">Email address</label>
                        <input type="email" id="input-email" class="form-control form-control-alternative" readonly="readonly" placeholder="jesse@example.com" value="<%:CurrentSession.Current.huserEmail%>" />
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-first-name">First name</label>
                        <input type="text" id="input-first-name" class="form-control form-control-alternative" readonly="readonly" placeholder="First name" value="<%:CurrentSession.Current.hfirstName%>" />
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-last-name">Last name</label>
                        <input type="text" id="input-last-name" class="form-control form-control-alternative" readonly="readonly" placeholder="Last name" value="<%:CurrentSession.Current.hlastName%>" />
                      </div>
                    </div>
                  </div>
                </div>
                <hr class="my-4" />
                <!-- Address -->
                <h6 class="heading-small text-muted mb-4">Contact information</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label class="form-control-label" for="input-address">Address</label>
                          <asp:TextBox id="inputAddress" runat="server" class="form-control form-control-alternative" text=""></asp:TextBox>
                        
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-4">
                      <div class="form-group">
                        <label class="form-control-label" for="input-city">City</label>
                          <asp:TextBox id="inputCity" runat="server" class="form-control form-control-alternative" text=""></asp:TextBox>
                        
                      </div>
                    </div>
                    <div class="col-lg-4">
                      <div class="form-group">
                        <label class="form-control-label" for="input-country">State</label>
                          <asp:TextBox id="inputState" runat="server" class="form-control form-control-alternative" text=""></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-lg-4">
                      <div class="form-group">
                        <label class="form-control-label" for="input-country">Postal code</label>
                          <asp:TextBox id="inputZip" runat="server" class="form-control form-control-alternative" text=""></asp:TextBox>

                      </div>
                    </div>
                    <div class="col-lg-4">
                      <div class="form-group">
                        <label class="form-control-label" for="input-phone">Phone Number</label>
                          <asp:TextBox id="inputPhone" runat="server" class="form-control form-control-alternative" text=""></asp:TextBox>

                      </div>
                    </div>
                  </div>
                </div>

                <!-- Password Update -->
                <hr class="my-4" />
                <h6 class="heading-small text-muted mb-4">Update Password</h6>
                <div class="row">
                    <div class="col-lg-4">
                      <div class="form-group">
                        <label class="form-control-label" for="input-city">Old Password</label>
                          <asp:TextBox id="txtOldPass" runat="server" class="form-control form-control-alternative" type="password" text=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqOldPass" ControlToValidate="txtOldPass" runat="server" Display="Dynamic" ForeColor="Red">*Required</asp:RequiredFieldValidator>
                          <asp:Label ID="lblPassNo" runat="server" Text="" ForeColor="Red" Visible="False"></asp:Label>
                      </div>
                    </div>
                    <div class="col-lg-4">
                      <div class="form-group">
                        <label class="form-control-label" for="input-country">New Password</label>
                          <asp:TextBox id="txtNewPass" runat="server" class="form-control form-control-alternative" type="password" text=""></asp:TextBox>
                          <asp:RequiredFieldValidator ID="reqNewPass" ControlToValidate="txtNewPass" runat="server" Display="Dynamic" ForeColor="Red">*Required</asp:RequiredFieldValidator>
                          <asp:RegularExpressionValidator runat="server"
                                ControlToValidate="txtNewPass"
                                ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"
                                Display="Dynamic"
                                ForeColor="Red" Text="*Password must be Minimum 8 characters, at least one uppercase letter, one lowercase letter and one number." />
                      </div>
                    </div>
                    <div class="col-lg-4">
                      <div class="form-group">
                          <br>
                          <asp:Button ID="BtnUpPass" class="mt-2 mb-4 btn btn-info" runat="server" Text="Change Password" OnClick="BtnUpPass_Click" />
                      </div>
                    </div>
                  </div>

                <!--Update Pic-->
                <%--<hr class="my-4" />
                <h6 class="heading-small text-muted mb-4">Update Profile Picture</h6>
                <asp:FileUpload ID="imgUpdate" runat="server" />--%>

            </div>
            
          </div>
        </div>
      </div>  
        
    </div>
      
  </div>
    
  <!--   Core   -->
  <script src="assets/js/plugins/jquery/dist/jquery.min.js"></script>
  <script src="assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <!--   Optional JS   -->
  <!--   Argon JS   -->
  <script src="assets/js/argon-dashboard.min.js?v=1.1.0"></script>
  <script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
  <script>
    window.TrackJS &&
      TrackJS.install({
        token: "ee6fab19c5a04ac1a32a645abde4613a",
        application: "argon-dashboard-free"
      });
  </script>
    </form>
</body>

</html>