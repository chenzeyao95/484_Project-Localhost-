<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin-Backgrounds.aspx.cs" Inherits="Admin_Backgrounds" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>
    Admin Dashboard
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
      <a class="navbar-brand pt-0" href="admin.aspx">
        <img src="img/logotransparent.png" class="navbar-brand-img" alt="roommagnet logo">
      </a>

      <!-- Collapse -->
      <div class="collapse navbar-collapse" id="sidenav-collapse-main">
        <!-- Collapse header -->
        <div class="navbar-collapse-header d-md-none">
          <div class="row">
            <div class="col-6 collapse-brand">
              <a href="./index.html">
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
          <a class=" nav-link" href="admin.aspx"> <i class="ni ni-tv-2 text-primary"></i> Dashboard
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="admin-backgrounds.aspx">
              <i class="ni ni-bullet-list-67 text-red"></i> Background Check Statuses
            </a>
          </li>
            <li class="nav-item">
            <a class="nav-link " href="admin-finduser.aspx">
              <i class="ni ni-circle-08 text-red"></i> User Manager
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="adminsignin.aspx">
              <i class="ni ni-user-run text-pink"></i> Logout
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
        <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="">Dashboard</a>
        
        <!-- User -->
        <ul class="navbar-nav align-items-center d-none d-md-flex">
          <li class="nav-item dropdown">
            <a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <div class="media align-items-center">
                <span class="avatar avatar-sm rounded-circle" style="background-color: white;">
                  <img alt="profile logo" src="img/logotransparent.png">
                </span>
                <div class="media-body ml-2 d-none d-lg-block">
                  <span class="mb-0 text-sm  font-weight-bold">Admin</span>
                </div>
              </div>
            </a>
            <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
              <div class=" dropdown-header noti-title">
                <h6 class="text-overflow m-0">Welcome!</h6>
              </div>
              
              <a href="adminsignin.aspx" class="dropdown-item">
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
      <form runat="server">
    <div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
      <div class="container-fluid">
        <div class="header-body"> 
            <asp:Button ID="tenBTN" class="mt-2 mb-4 btn btn-info" runat="server" Text="View Tenants" OnClick="tenBTN_Click" />
            <asp:Button ID="hostBTN" class="mt-2 mb-4 btn btn-info" runat="server" Text="View Hosts" OnClick="hostBTN_Click" />
        </div>
      </div>
    </div>


         <!-- BG information -->
        <br /> <br />
          <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center">
                 <asp:ListView ID="ListView1" runat="server">       
                  <ItemSeparatorTemplate>
                      <hr class="my-4" />
                         </ItemSeparatorTemplate>
                <ItemTemplate>
                    <div class="row">
                        <div class="list" style="width:10%;">
                            <tr><td><img src='data:image/jpg;base64,<%# Convert.ToBase64String((byte[])Eval("tenImage")) %>' width="50px" height="50" class="rounded-circle"></td></tr>
                            </div>
                        <div class="list">
                            <h4><span1><%#Eval("FirstName") %>  <%#Eval("LastName") %></span1></h4>
                            </div>
                        <div class="list">    
                                <td><asp:LinkButton class="mt-2 mb-4 btn btn-info" runat="server" 
                                    ID="InterestBtn" 
                                    Text="Approve" 
                                    CommandName="imInterested" 
                                    CommandArgument='<%# Eval("TenantID") %>'
                                    OnCommand="Update_ServerClick"
                                    OnClientClick="return confirm('Are you sure you want to approve?')" /></td>
                            <td><asp:LinkButton class="mt-2 mb-4 btn btn-info" runat="server"
                                ID="DenyBtn"
                                Text="Deny"
                                CommandName="notInterested"
                                CommandArgument='<%# Eval("TenantID") %>'
                                OnCommand="Deny_ServerClick"
                                OnClientClick="return confirm('Are you sure you want to deny?')" /></td>
                            </div>
                        </div>
                </ItemTemplate>
            </asp:ListView>
          </asp:Panel>

          <asp:Panel ID="Panel2" runat="server" HorizontalAlign="Center">
                 <asp:ListView ID="ListView2" runat="server">       
                  <ItemSeparatorTemplate>
                      <hr class="my-4" />
                         </ItemSeparatorTemplate>
                <ItemTemplate>
                    <div class="row">
                        <div class="list" style="width:10%;">
                            <tr><td><img src='data:image/jpg;base64,<%# Convert.ToBase64String((byte[])Eval("hostImage")) %>' width="50px" height="50" class="rounded-circle"></td></tr>
                            </div>
                        <div class="list">
                            <h4><span1><%#Eval("HostFirstName") %>  <%#Eval("HostLastName") %></span1></h4>
                            </div>
                        <div class="list">    
                                <td><asp:LinkButton class="mt-2 mb-4 btn btn-info" runat="server" 
                                    ID="InterestBtn" 
                                    Text="Approve" 
                                    CommandName="imInterested" 
                                    CommandArgument='<%# Eval("HostID") %>'
                                    OnCommand="Update_ServerClick2"
                                    OnClientClick="return confirm('Are you sure you want to approve?')" /></td>
                            <td><asp:LinkButton class="mt-2 mb-4 btn btn-info" runat="server"
                                ID="DenyBtn"
                                Text="Deny"
                                CommandName="notInterested"
                                CommandArgument='<%# Eval("HostID") %>'
                                OnCommand="Deny_ServerClick2"
                                OnClientClick="return confirm('Are you sure you want to deny?')" /></td>
                            </div>
                        </div>
                </ItemTemplate>
            </asp:ListView>
          </asp:Panel>

        </form>
      
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