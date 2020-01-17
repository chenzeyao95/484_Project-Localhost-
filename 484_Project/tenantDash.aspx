<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tenantDash.aspx.cs" Inherits="tenantDash" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>
    Dashboard
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

  <nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
    <div class="container-fluid">
      <!-- Toggler -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <!-- Brand -->
      <a class="navbar-brand pt-0" href="index.aspx">
        <img src="img/logotransparent.png" class="navbar-brand-img" alt="roommagnet logo">
      </a>
      <!-- User -->
      <ul class="nav align-items-center d-md-none">
        
        <li class="nav-item dropdown">
          <a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <div class="media align-items-center">
              <span class="avatar avatar-sm rounded-circle">
                <img alt="Image placeholder" src="<%=CurrentSession.Current.tImage %>">
              </span>
            </div>
          </a>
          <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
            <div class=" dropdown-header noti-title">
              <h6 class="text-overflow m-0">Welcome!</h6>
            </div>
            <a href="tenantDash.aspx" class="dropdown-item">
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
            <a class="nav-link  active " href="tenantDash.aspx">
              <i class="ni ni-single-02 text-yellow"></i> Dashboard
            </a>
          </li>
            <li class="nav-item">
            <a class="nav-link" href="tenantSearch.aspx">
              <i class="ni fas fa-search"></i> Search
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="tenantSpace.aspx">
              <i class="ni ni-bullet-list-67 text-red"></i> My Favorites
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
            <a class="nav-link" href="">
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
        <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block">Tenant Dashboard</a>

        <!-- User -->
        <ul class="navbar-nav align-items-center d-none d-md-flex">
          <li class="nav-item dropdown">
            <a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <div class="media align-items-center">
                <span class="avatar avatar-sm rounded-circle">
                  <img alt="User profile image" src="<%:CurrentSession.Current.tImage%>">
                </span>
                <div class="media-body ml-2 d-none d-lg-block">
                  <span class="mb-0 text-sm  font-weight-bold">
                      <asp:Label
                          id="nameTopRight"
                          Text=" "
                          Runat="server" /></span>
                </div>
              </div>
            </a>
            <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
              <div class=" dropdown-header noti-title">
                <h6 class="text-overflow m-0">Welcome!</h6>
              </div>
              <a href="tenantDash.aspx" class="dropdown-item">
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
      </div>
    </nav>
    <!-- End Navbar -->
    <!-- Header -->
    <div class="header pb-8 pt-5 pt-lg-8 d-flex align-items-center" style="min-height: 600px; background-image: url(img/homeimage2.jpg); background-size: cover; background-position: center;">
      <!-- Mask -->
      <span class="mask bg-gradient-default opacity-3"></span>
      <!-- Header container -->
      <div class="container-fluid d-flex align-items-center">
        <div class="row">
          <div class="col-lg-7 col-md-10">
            <h1 class="display-2 text-white">
                <asp:Label
                    id="helloName"
                    Text=" "
                    Runat = "server" /> </h1>
            <p class="text-white mt-0 mb-5">We are excited to get started, take our matchmaking survey to begin searching for your future home</p>
            <a href="tenantSurvey.aspx" class="btn btn-info" style="background-color: #DB464D; border: 0px;">Take tenant survey</a>
          </div>
        </div>
      </div>
    </div>
    <!-- Page content -->
      <form runat="server">
    <div class="container-fluid mt--7">
      <div class="row">
        <div class="col-xl-4 order-xl-2 mb-5 mb-xl-0">
          <div class="card card-profile shadow">
            <div class="row justify-content-center">
              <div class="col-lg-3 order-lg-2">
                <div class="card-profile-image">
                  <a href="#">
                    <img src="<%:CurrentSession.Current.tImage%>" class="rounded-circle">
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
                        <!-- !!!!!!!!!!!!!!!!!!!!!!! -->
                  </div>
                </div>
              </div>
              <div class="text-center">
                <h3>
                    <asp:Label
                        id="userName"
                        Text =" "
                        Runat="server" />
                  <span class="font-weight-light"></span>
                </h3>
                <div class="h5 font-weight-300">
                  <i class="ni location_pin mr-2"></i>
                    <asp:Label
                        id="dashboardType"
                        Text =" "
                        Runat="server" />
                </div>
                 <div class="h5 mt-4">
                  <i class="ni business_briefcase-24 mr-2"></i><strong>Member Since:</strong> <%:CurrentSession.Current.tLastUp %>
                     <br>
                   <b><asp:Label class="ni business_briefcase-24 mr-2" id="backgroundlbl" runat="server" Text=""></asp:Label></b><br>
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
                                   runat="server" ID="lblNoRecord1" Text="No messages from Host"></asp:Label></i>
                    </FooterTemplate>
                <ItemTemplate>
                    <div class="row">
                        &nbsp&nbsp&nbsp&nbsp<h4><%#Eval("HostName") %> (Host)</h4>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                        <asp:LinkButton  runat="server" class="btn btn-sm btn-primary"
                            ID="InterestBtn" 
                            Text="Contact" 
                            CommandName="contact" 
                            CommandArgument='<%# Eval("HostID") %>'
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
                  <h3 class="mb-0">My Profile</h3>
                </div>
              </div>
            </div>
            <div class="card-body">
              
                <h6 class="heading-small text-muted mb-4">User information</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-email">Email Address</label>
                        <input type="email" id="input-email"  ReadOnly="readonly" class="form-control form-control-alternative" placeholder="email address" value="<%:CurrentSession.Current.userEmail%>"/>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-first-name">First Name</label>
                        <input type="text" id="input-first-name" ReadOnly="readonly" class="form-control form-control-alternative" placeholder="First name" value="<%:CurrentSession.Current.firstName%>" />
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-last-name">Last Name</label>
                        <input type="text" id="input-last-name" readonly="readonly" class="form-control form-control-alternative" placeholder="Last name" value="<%:CurrentSession.Current.lastName%>" />
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

                <hr class="my-4" />
                <h6 class="heading-small text-muted mb-4">My Current Space</h6>
                <div class="pl-lg-4">
                    <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Justify">
                  <asp:DataList ID="ListView1" runat="server" RepeatDirection="Vertical" RepeatLayout="Flow" CssClass="row">  
                  <FooterTemplate>
                      <asp:Label Visible='<%#bool.Parse((ListView1.Items.Count==0).ToString())%>' 
                                   runat="server" ID="lblNoRecord1" Text="You don't have current spaces."></asp:Label>
                      <asp:LinkButton ID="noRecordBtn" runat="server" 
                          Visible='<%#bool.Parse((ListView1.Items.Count==0).ToString())%>'
                          OnCommand="noRecordBtn_Command"
                          class="btn btn-sm btn-primary" CausesValidation="False">Search Now</asp:LinkButton>
                    </FooterTemplate>
                 <ItemTemplate>
                     <div class="list">
                         <table>
                             <tr><td><img src='data:image/jpg;base64,<%# Convert.ToBase64String((byte[])Eval("Image1")) %>' width="330px" height="200"></td></td>
                             <tr><td><h4><span2><%#Eval("Street") %></span2></h4></td></tr>
                             <tr><td><span2>Type: <%#Eval("RoomType") %></span2></td></tr>
                                <tr><td>
                                  <asp:LinkButton class="mt-2 mb-4 btn btn-info" runat="server" 
                                    ID="SelectAccomBtn" 
                                    Text="See Details" 
                                    CommandName="SeeDetail" 
                                    CommandArgument='<%# Eval("AccommodationID") %>' 
                                    OnCommand="SeeDetailsBtn_Command" CausesValidation="False" />
                                    
                                    <asp:LinkButton class="mt-2 mb-4 btn btn-info" runat="server" 
                                    ID="LinkButton1" 
                                    Text="Review Space" 
                                    CommandName="review" 
                                    CommandArgument='<%# Eval("AccommodationID") %>' 
                                    OnCommand="WriteReviewBtn_Command" CausesValidation="False" />
                                </td></tr>
                             </table>
                         </div>
                    </ItemTemplate>
                </asp:DataList>
                       </asp:Panel>
                    </div>
                <hr class="my-4" />
                <h6 class="heading-small text-muted mb-4">My Lease Agreements</h6>
                <div class="pl-lg-4">
                    <asp:Panel ID="Panel3" runat="server" HorizontalAlign="Justify">
                  <asp:DataList ID="DataList1" runat="server" RepeatDirection="Vertical" RepeatLayout="Flow" CssClass="row">  
                  <FooterTemplate>
                      <asp:Label Visible='<%#bool.Parse((DataList1.Items.Count==0).ToString())%>' 
                                   runat="server" ID="lblNoRecord1" Text="You do not have any Lease Agreements at this time."></asp:Label>
                    </FooterTemplate>
                 <ItemTemplate>
                     <div class="list">
                         <table>
                             <tr><td><img src='data:image/jpg;base64,<%# Convert.ToBase64String((byte[])Eval("Image1")) %>' width="330px" height="200"></td></td>
                             <tr><td><h4><span2><%#Eval("AccomName") %></span2></h4></td></tr>
                             <tr><td><span2>Agreement Sent: <%#Eval("PreConDate", "{0:MM/dd/yyyy}") %></span2></td></tr>
                                <tr><td>
                                  <asp:LinkButton class="mt-2 mb-4 btn btn-info" runat="server" 
                                    ID="ConfirmAccomBtn" 
                                    Text="Confirm Lease" 
                                    CommandName="ConfirmLease" 
                                    CommandArgument='<%# Eval("PreConID") %>' 
                                    OnCommand="ConfirmLeaseBtn_Command" CausesValidation="False" />
                                </td></tr>
                             </table>
                         </div>
                    </ItemTemplate>
                </asp:DataList>
                       </asp:Panel>
                    </div>
              </form>
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
</body>

</html>
