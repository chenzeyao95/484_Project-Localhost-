<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HostAccomInfo.aspx.cs" Inherits="HostAccomInfo" %>

<!DOCTYPE html>
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
      <a class="navbar-brand pt-0" href="index.aspx">
        <img src="img/logotransparent.png" class="navbar-brand-img" alt="roommagnet logo">
      </a>
      <!-- User -->
      <ul class="nav align-items-center d-md-none">
        
        <li class="nav-item dropdown">
          <a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <div class="media align-items-center">
              <span class="avatar avatar-sm rounded-circle">
                <img alt="Image placeholder" src="<%:CurrentSession.Current.hImage%>">
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
        
        <!-- Form -->
        <form class="mt-4 mb-3 d-md-none">
          <div class="input-group input-group-rounded input-group-merge">
            <input type="search" class="form-control form-control-rounded form-control-prepended" placeholder="Search" aria-label="Search">
            <div class="input-group-prepend">
              <div class="input-group-text">
                <span class="fa fa-search"></span>
              </div>
            </div>
          </div>

        </form>
        <!-- Navigation -->
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="HostDash.aspx">
              <i class="ni ni-single-02 text-yellow"></i> Dashboard
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="HostMatches.aspx">
              <i class="ni ni-like-2 text-info"></i> Your Matches
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="HostListing.aspx">
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
        <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block">Listing Information</a>
        
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
                      <%:CurrentSession.Current.hfirstName%> <%:CurrentSession.Current.hlastName%>
                  </span>
                </div>
                <div class="media-body ml-2 d-none d-lg-block">
                  <span class="mb-0 text-sm  font-weight-bold"></span>
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
                  <h3 class="mb-0"><asp:Label ID="lblDetail" runat="server" Text="Label"></asp:Label></h3>
                </div>
                <div class="col-4 text-right">
                  <a href='javascript:history.go(-1)' class="btn btn-sm btn-primary">Go Back</a>
                </div>
              </div>
            </div>
            <div class="card-body">
              <form runat="server">
                <div class="pl-lg-4">
                   <!-- Carousel -->
                    <asp:Panel ID="Panel1" runat="server" HorizontalAlign="left">
                           <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" >
                                  <ol class="carousel-indicators">
                                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                                  </ol>
                                  <div class="carousel-inner">
                                    <div class="carousel-item active">
                                      <img class="d-block w-100" src="<%=getAccomImg1 %>"" alt="First slide" >
                                    </div>
                                    <div class="carousel-item">
                                      <img class="d-block w-100" src="<%=getAccomImg2 %>"" alt="Second slide" >
                                    </div>
                                    <div class="carousel-item">
                                      <img class="d-block w-100" src="<%=getAccomImg3 %>"" alt="Third slide" >
                                    </div>
                                  </div>
                                  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                  </a>
                                  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                  </a>
                                </div>
                        </asp:Panel>
                    <br><br>
                    </div>
                          <!-- End Carousel -->
                  <div class="pl-lg-4">
                      <asp:Panel ID="Panel4" runat="server" HorizontalAlign="Left">
                        <div class="col-lg-6 row">
                        <label class="form-control-label" for="input-make-viewable">Make this accommodation</label>&nbsp&nbsp
                        
                        <asp:DropDownList
                              ID="dropStatus" runat="server">
                              <asp:ListItem Selected ="True" Value="y" runat="server">Viewable</asp:ListItem>
                              <asp:ListItem Value="n" runat="server">Not Viewable</asp:ListItem>
                        </asp:DropDownList>
                        </div>
                        <asp:Button
                            id="btnUpdateStatus"
                            class="mt-2 mb-4 btn btn-info"
                            Text="Update"
                            runat="server" 
                            OnClick="btnComplete_Click" />
                        
                        <!--<div class="row" >                   
                            <div class="col-lg-6">
                             <div class="form-group">
                                <label class="form-control-label" for="input-first-name">Current Tenant</label>
                                <h3><asp:Label ID="lblCurrentTen" runat="server" Text="Label"></asp:Label></h3>
                              </div>
                            </div>                   
                        </div>-->
                      </asp:Panel>
                  

                    <div class="alert alert-danger" role="alert">
                            <strong>Note:</strong> 
                            This accommodation will show up in tenant's search results if it is set to "Viewable"
                    </div>
                  </div>

                  <div class="pl-lg-4">
                    <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-first-name">City</label>
                        <h3><asp:Label ID="lblcity" runat="server" Text="Label"></asp:Label></h3>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-last-name">State</label>
                        <h3><asp:Label ID="lblState" runat="server" Text="Label"></asp:Label></h3>
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="form-group">
                        <label class="form-control-label" for="input-address">Zip Code</label>
                        <h3><asp:Label ID="lblZip" runat="server" Text="Label"></asp:Label></h3>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="pl-lg-4">
                  
                  <div class="row">
                    <div class="col-lg-4">
                      <div class="form-group">
                        <label class="form-control-label" for="input-city">Base Price</label>
                        <h3><asp:Label ID="lblPrice" runat="server" Text="Label"></asp:Label></h3>
                      </div>
                    </div>
                    <div class="col-lg-4">
                      <div class="form-group">
                        <label class="form-control-label" for="input-country">Host Name</label>
                        <h3><asp:Label ID="lblHostName" runat="server" Text="Label"></asp:Label></h3>
                      </div>
                    </div>
                    <div class="col-lg-4">
                      <div class="form-group">
                        <label class="form-control-label" for="input-country">Room Type</label>
                        <h3><asp:Label ID="lblRoomType" runat="server" Text="Label"></asp:Label></h3>
                      </div>
                    </div>
                    <div class="col-lg-6 col-xl-6 col-md-6 col-md-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-phone">Neighborhood</label>
                        <h3><asp:Label ID="lblNeigb" runat="server" Text="Label"></asp:Label></h3>
                      </div>
                    </div>
                      <div class="col-lg-12 col-md-12 col-sm-12 col-xl-12">
                  <div class="form-group">
                    <label class="form-control-label">Description</label>
                    <textarea rows="4" id="txtDes" runat="server" class="form-control form-control-alternative" placeholder="A few words about the property ..." disabled="disabled"></textarea>
                  </div>
                </div>
                  </div>
                </div>
                  <!--Amenities and neighborhood-->
                  <div class="row">
                    <div class="col-lg-6">       
                        <label class="form-control-label">Amenities:</label>
                                                        
                      <div style="float: left; width: 50%;">
                          <input type="checkbox" id="chkBath" name="Private Bathroom" value="Private Bathroom" runat="server" disabled="disabled"> Private Bathroom<br>
                          <input type="checkbox" id="chkLaundry" name="Private Laundry" value="Private Laundry" runat="server" disabled="disabled"> Private Laundry<br>
                          <input type="checkbox" id="chkKitchen" name="Kitchenette" value="Kitchenette" runat="server" disabled="disabled"> Kitchenette<br>
                          <input type="checkbox" id="chkLiving" name="Private living room" value="Private living room" runat="server" disabled="disabled"> Private living room<br>
                          <br>

                          
                        </div>
                        </div>
                        <div class="col-lg-6">
                            <label class="form-control-label">Neighborhood:</label>

                      <div style="float: left; width: 60%;">
                          <input type="checkbox" id="chkLow" name="lownoise" value="Low Noise" runat="server" disabled="disabled"> Low Noise<br>
                          <input type="checkbox" id="chkModerate" name="moderatenoise" value="Moderate Noise" runat="server" disabled="disabled"> Moderate Noise<br>
                          <input type="checkbox" id="chkNoNoise" name="noisepref" value="No Noise Preference" runat="server" disabled="disabled"> No noise preference<br>
                          <input type="checkbox" id="chkPet" name="pet" value="Pet-Friendly" runat="server" disabled="disabled"> Pet Friendly<br>

                        </div>
                            <div style="float: left; width: 60%;">
                          <input type="checkbox" id="chkWatch" name="watch" value="Neighborhood Watch" runat="server" disabled="disabled"> Neighborhood Watch<br>
                          <input type="checkbox" id="chkNonSmoke" name="nonsmoke" value="Non-smoking" runat="server" disabled="disabled"> Non-smoking<br>
                          <input type="checkbox" id="chkSmoke" name="smoke" value="Smoker-friendly" runat="server" disabled="disabled"> Smoker-friendly<br>
                          <input type="checkbox" id="chkChores" name="chores" value="Chores" runat="server" disabled="disabled"> Household Chores<br>
                                <br>
                                </div>
                        </div>
                      </div>
  
<%--                    <asp:Button ID="DeleteBtn" runat="server" Text="Delete" class="mt-2 mb-4 btn btn-info" OnClick="DeleteBtn_Click" OnClientClick="return confirm('Are you sure you want to delete this listing?')"></asp:Button>   --%>
                    <br>
                    <br>
                  <!--comment area-->
                    <asp:Panel ID="Panel3" runat="server" HorizontalAlign="Center">
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
                    </asp:Panel>
                  
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
