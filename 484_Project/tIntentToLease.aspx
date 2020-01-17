<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tIntentToLease.aspx.cs" Inherits="tIntentToLease" %>

<!DOCTYPE html>
<script runat="server">


</script>

<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>
    Roommagnet
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
    
<style>
  /* modal for see more button in area search */

.modalDialog {
        position: fixed;
        font-family: Arial, Helvetica, sans-serif;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        background: rgba(0,0,0,0.8);
        z-index: 99999;
        opacity:0;
        -webkit-transition: opacity 400ms ease-in;
        -moz-transition: opacity 400ms ease-in;
        transition: opacity 400ms ease-in;
        pointer-events: none;
        
        
    }

    .modalDialog:target {
        opacity:1;
        pointer-events: auto;
    }

    .modalDialog > div {
        width: 400px;
        position: relative;
        margin: 10% auto;
        padding: 5px 20px 13px 20px;
        border-radius: 10px;
        background: #fff;
        border: 1px solid #DB464D;
     
    }
.closef {
        background: #606061;
        color: #FFFFFF;
        line-height: 25px;
        position: absolute;
        right: -12px;
        text-align: center;
        top: -10px;
        width: 24px;
        text-decoration: none;
        font-weight: bold;
        -webkit-border-radius: 12px;
        -moz-border-radius: 12px;
        border-radius: 12px;
        -moz-box-shadow: 1px 1px 3px #000;
        -webkit-box-shadow: 1px 1px 3px #000;
        box-shadow: 1px 1px 3px #000;
    }

    .closef:hover { background: #DB464D; }  
    
    
    
    
</style>
</head>

<body class="">
  <nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
    <div class="container-fluid">
      <!-- Toggler -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <!-- Brand -->
      <a class="navbar-brand pt-0" href="tenantDash.aspx">
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
        <!-- Navigation -->
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link active" href="tenantDash.aspx">
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
        <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block">Lease Confirmation</a>
          
          
        <!-- User -->
        <ul class="navbar-nav align-items-center d-none d-md-flex">
          <li class="nav-item dropdown">
            <a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <div class="media align-items-center">
                <span class="avatar avatar-sm rounded-circle">
                  <img alt="Image placeholder" src="<%=CurrentSession.Current.tImage %>">
                </span>
                <div class="media-body ml-2 d-none d-lg-block">
                  <span class="mb-0 text-sm  font-weight-bold"><%=CurrentSession.Current.firstName%> <%=CurrentSession.Current.lastName%></span>
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
    <div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
      <div class="container-fluid">
        <div class="header-body">
          
        </div>
      </div>
    </div>
      
    <div class="container-fluid mt--9">
     <div class="col-xl-8 order-xl-1">
          <div class="card bg-secondary shadow">
            <div class="card-header bg-white border-0">
              <div class="row align-items-center">
                <div class="col-8">
                  <h2 class="mb-0"><asp:Label ID="lblDetail" runat="server" Text="Your Intent To Lease Form"></asp:Label></h2>
                </div>
                <div class="col-4 text-right">
                  <a href='javascript:history.go(-1)' class="btn btn-sm btn-primary">Go Back</a>
                </div>
              </div>
            </div>
            <div class="card-body">
              <form runat="server">

               <div class="pl-lg-4">
                   <div class="row">
                   <div class="alert alert-danger" role="alert">
                            <strong>Note:</strong>
                             <i>This letter of intent (Intent to Lease) sets forth the general terms of the proposal. The provisions of this letter of intent shall serve as the basis
                                 for a definitive lease agreement to be negotiated and entered into between the tenant and landlord (The Lease).
                             </i>
                        </div>
                       </div>
                  <div class="row">
                        <h3>Tenant Name: </h3>&nbsp&nbsp&nbsp&nbsp&nbsp
                        <asp:Textbox ID="txtTenantName" runat="server" Text="" ReadOnly="true" BackColor="#E9E9E9" class="form-control-alternative"></asp:Textbox>
                      </div>

                      <div class="row">
                         <h3>Host Name: </h3>&nbsp&nbsp&nbsp&nbsp&nbsp
                          <h3><asp:Textbox ID="txtHostName" runat="server" Text="" ReadOnly="true" BackColor="#E9E9E9" class="form-control-alternative"></asp:Textbox></h3>
                          </div>


                   <div class="row"> 
                        <h3>Street: </h3>&nbsp&nbsp&nbsp&nbsp&nbsp
                        <h3><asp:Textbox ID="txtStreet" runat="server" Text="" ReadOnly="true" BackColor="#E9E9E9" class="form-control-alternative"></asp:Textbox></h3>
                   </div>

                       <div class="row">
                          <h3>City: </h3>&nbsp&nbsp&nbsp&nbsp&nbsp
                        <h3><asp:Textbox ID="txtcity" runat="server" Text="" ReadOnly="true" BackColor="#E9E9E9" class="form-control-alternative"></asp:Textbox></h3>
                      </div>
                    
                    <div class="row">
                        <h3>State: </h3>&nbsp&nbsp&nbsp&nbsp&nbsp
                        <h3><asp:Textbox ID="txtState" runat="server" Text="" ReadOnly="true" BackColor="#E9E9E9" class="form-control-alternative"></asp:Textbox></h3>
                    </div>

                  <div class="row">
                    <h3>Monthly Price: $</h3>
                    <h3><asp:Label ID="lblPrice" runat="server" Text=""></asp:Label></h3>
                    </div>
                  <div class="row">
                        <h3>Agreement Date: </h3>
                        <h3><asp:Label ID="lblDate" runat="server" Text=""></asp:Label></h3>
                            </div>
                   <hr />
                   <div class="row">
                   <div class="alert alert-danger" role="alert">
                            <strong>Note:</strong>
                            <i>By Typing your name below, you agree to the terms set forth above and RoomMagnet's Terms and Conditions. Please type your name exactly as listed above.</i>
                        </div><br><br>
                   <div class="row">
                        <h3>Tenant: </h3>&nbsp&nbsp&nbsp
                        <asp:Textbox ID="txtSignature" runat="server" Text="" ReadOnly="false" Font-Italic="True" class="form-control-alternative"></asp:Textbox>&nbsp&nbsp&nbsp&nbsp&nbsp
                       <h3>Landlord: </h3>&nbsp&nbsp&nbsp
                        <asp:Textbox ID="txtLandlord" runat="server" Text="" ReadOnly="true" BackColor="#E9E9E9" Font-Italic="True" class="form-control-alternative"></asp:Textbox>
                      </div>
                    <asp:Button ID="ConfirmLease" runat="server" Text="Sign and Confirm" class="mt-2 mb-4 btn btn-info" OnClick="ConfirmLease_Click" ></asp:Button> 

                </div>
       
                
                  
                   <br>
                   <br>
                  <!--comment area-->
<%--                    <asp:Panel ID="Panel3" runat="server" HorizontalAlign="Center">
                        <h3>Tenant Review</h3>
                        <br>
                    </asp:Panel>
                    <asp:Panel ID="Panel2" runat="server" HorizontalAlign="Left">
                    
                    <asp:ListView ID="ListView1" runat="server">
                        <EmptyDataTemplate>
                                <h3><i>No Reviews</i></h3>
                            </EmptyDataTemplate>
                         <ItemTemplate>
                             <div class="list">
                                     <tr><td><h3><%#Eval("TenFName") %> <%#Eval("TenLName") %></h3></td></tr>
                                     Posted on <%#Eval("ReviewDate", "{0:MM/dd/yyyy}") %>
                                     <div class="alert alert-danger" role="alert">
                                            <strong>Rating:  <%#Eval("ReviewStars") %> out of 5</strong><br><br>
                                             <%#Eval("ReviewText")%>
                                        </div>  
                                 <br>
                                 </div>
                            </ItemTemplate>
                        </asp:ListView>
                    </asp:Panel>--%>
                </div>
              </form>
                
          </div>
        </div>
    <!-- Page content -->
     
      </div>
        </div>          
  <!--   Core   -->
  <script src="assets/js/plugins/jquery/dist/jquery.min.js"></script>
  <script src="assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
 
    <!--   Optional JS   -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
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

