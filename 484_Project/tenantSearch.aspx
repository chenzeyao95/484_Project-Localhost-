<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tenantSearch.aspx.cs" Inherits="tenantSearch" %>

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
      <a class="navbar-brand pt-0" href="index.aspx">
        <img src="img/logotransparent.png" class="navbar-brand-img" alt="roommagnet logo">
      </a>
      <!-- User -->
      <ul class="nav align-items-center d-md-none">
        
        <li class="nav-item dropdown">
          <a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <div class="media align-items-center">
              <span class="avatar avatar-sm rounded-circle">
                <img alt="Image placeholder" src="<%=CurrentSession.Current.tImage %>
">
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
            <a class="nav-link" href="tenantdash.aspx">
              <i class="ni ni-single-02 text-yellow"></i> Dashboard
            </a>
          </li>
            <li class="nav-item">
            <a class="nav-link active" href="tenantSearch.aspx">
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
        <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block">Search for a Space</a>
          
          
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
        <div class="row">
        <div class="card-header">
                <form class=" form-inline mr-3  d-md-flex ml-lg-auto col-md-12" runat="server">
          <div class="form-group mt-3 mb-0" style="background-color: white; border-radius: 10px; padding-right: 90px;">
            <div class="input-group input-group-alternative1 col-md-12">
              <div class="input-group-prepend">
                <span class="input-group-text" style="color: #DB464D; border: 0;"><i class="fas fa-search"></i></span>
              </div>
              <input id="txtCitySearch" class="form-control" placeholder="Search by City" type="text" padding-bottom="16px" runat="server"> 
                    <asp:LinkButton
                        id="btnCitySearch"
                        style="background: none; border: none; padding-top: 20px; border-left: 15px;"
                        Runat="server"
                        class="ni ni-curved-next"
                        OnClick="btnCitySearch_Click"/>
            </div>
          </div>
                    <div class="form-group mt-3 mb-0 ml-4" style="background-color: white; border-radius: 10px; padding-right: 90px;">
            <div class="input-group input-group-alternative1 col-md-12">
              <div class="input-group-prepend">
                <span class="input-group-text" style="color: #DB464D; border: 0;"><i class="fas fa-search"></i></span>
              </div>
              <input id="txtZipSearch" class="form-control" placeholder="Search by Zip Code" type="text" padding-bottom="16px" runat="server"> 
                
                <asp:LinkButton
                    id="btnZipSearch"
                    style="background: none; border: none; padding-top:20px; border-left: 15px;"
                    Runat="server" 
                    class="ni ni-curved-next"
                    OnClick="btnZipSearch_Click"/>
                    
            </div>
          </div>

            
            </div>
            </div>
      <div class="row">
        <div class="col">
          <div class="card shadow border-0">
            <div id="map-canvas" class="map-canvas" data-lat="<%:CurrentSession.Current.latSearch%>" data-lng="<%:CurrentSession.Current.longSearch%>" style="height: 600px;"></div>
          </div>
        </div>
      </div>
      <br>
    <!-- Page content -->
<%--    <div class="col-xl-8 order-xl-1">
          <div class="card bg-secondary shadow">
            <div class="card-header bg-white border-0">
              <div class="row align-items-center">
                  <div class="col-8">
                    <h3 class="mb-3">Search Results</h3>
                  </div>
                </div>
            
                  <div class="row">
            <div class="col-xl-12 col-lg-12 col-md-12">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                      <img src="img/bostonhouse.jpg" style="width: 100px; margin-top: 10px;">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">Location Name:</h5>
                      <span class="h2 font-weight-bold mb-0">Room in Downtown Area</span>
                        <h5 class="card-title text-uppercase text-muted mb-0">Price:</h5>
                        <span class="h2 font-weight-bold mb-0">&#36;420/month</span>
                        
                     
                    </div>
                    <div class="col-auto">
                    </div>
                  </div>
                    <p class="mt-3 mb-0 text-muted text-sm"></p><a href="#openModal1" class="btn btn-info" style="background-color: #DB464D; border: 0px;">See Details</a>--%>
        <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center">
           <asp:DataList ID="ListView1" runat="server" RepeatDirection="Vertical" RepeatLayout="Flow" CssClass="row">   
               <FooterTemplate>
                      <h2><asp:Label Visible='<%#bool.Parse((ListView1.Items.Count==0).ToString())%>' 
                                   runat="server" ID="lblNoRecord1" Text="* No search results were found" ForeColor="#333333" Font-Bold="True" EnableTheming="True" Font-Italic="True"></asp:Label></h2>
                    </FooterTemplate>
                 <ItemTemplate>
                     <div class="list">
                            <table>
                             <tr><td><img src='data:image/jpg;base64,<%# Convert.ToBase64String((byte[])Eval("Image1"))%>' width="390px" height="250"></td></td>
                             <tr><td><h4><span1><%#Eval("AccomName")%></span1></h4></td></td>
                             <tr><td><span1>Type: <%#Eval("RoomType")%></span1></td></td>
                             <tr><td><span1>Location: <%#Eval("CityCo") %>, <%#Eval("AccomState")%></span1></td></td>
                             <tr><td><h3><span1>$<%#Eval("Price")%>/Month</span1></h3></td></td>

                                <tr><td>
                                  <asp:LinkButton class="mt-2 mb-4 btn btn-info" runat="server" 
                                    ID="SeeDetailsBtn" 
                                    Text="See Details" 
                                    CommandName="SeeDetails" 
                                    CommandArgument='<%# Eval("AccommodationID") %>'
                                    OnCommand="SeeDetailsBtn_Command"/>

                                    <asp:LinkButton class="mt-2 mb-4 btn btn-info" runat="server" 
                                    ID="InterestBtn" 
                                    Text="Add to Favorite" 
                                    CommandName="imInterested" 
                                    CommandArgument='<%# Eval("AccommodationID") %>' 
                                    OnCommand="Interest_ServerClick"/>

                                </td></tr>
                            </table>
                         </div>
                    </ItemTemplate>
                </asp:DataList>
                </asp:Panel>    
                    <!-- Begin the Modal -->

                      <%--<div id="openModal1" class="modalDialog" runat="server">
                      <div>
                       <a href="#close" title="Close" class="closef" style="color: gainsboro;">X</a>
                       <h2>Accommodation Information</h2>
                       <div class="row" style="justify-content: center; margin-bottom: 10px;">
                           
                        <!-- Carousel -->
                           <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="padding: 20px;">
                                  <ol class="carousel-indicators">
                                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                                  </ol>
                                  <div class="carousel-inner">
                                    <div class="carousel-item active">
                                      <img class="d-block w-100" src="img/bostonhouse.jpg" alt="First slide" style="width: 60px;">
                                    </div>
                                    <div class="carousel-item">
                                      <img class="d-block w-100" src="img/bostonhouse.jpg" alt="Second slide" style= "width=60px;">
                                    </div>
                                    <div class="carousel-item">
                                      <img class="d-block w-100" src="img/bostonhouse.jpg" alt="Third slide" style="width: 60px;">
                                    </div>
                                  </div>
                                  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previouss</span>
                                  </a>
                                  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                  </a>
                                </div>
                          <!-- End Carousel -->
         
                        </div>
                        
                       <div class="row">
                          <h2>City</h2> <h2 style="margin-left: 90px;">State</h2><h2 style="margin-left: 90px;">Zip Code</h2>
                       </div>
                       <div class="row"> 
                           
                           <p style="margin-left: 10px;"><asp:Label ID="lblInfoCity" runat="server" Text="" ></asp:Label></p>
                               
                           <p style="margin-left: 65px;"></p>

                           <p style="margin-left: 85px;"><asp:Label ID="lblInfoZip" runat="server" Text=""></asp:Label></p>

                       </div>
                       
                          
                          <div class="row">
                          <h2>Price</h2> <h2 style="margin-left: 80px;">Neighborhood</h2>
                       </div>
                       <div class="row"> 
                           <p style="margin-left: 10px;"><asp:Label ID="lblInfoPrice" runat="server" Text=""></asp:Label></p>
                           <p style="margin-left: 95px;"><asp:Label ID="lblInfoNeigh" runat="server" Text=""></asp:Label></p>
                       </div>
                          
                          <div class="row">
                          <h2>Room Type</h2> <h2 style="margin-left: 30px;">Host Name</h2>
                       </div>
                       <div class="row"> 
                           <p style="margin-left: 10px;"><asp:Label ID="lblInfoRoomType" runat="server" Text=""></asp:Label></p>
                           <p style="margin-left: 100px;"><asp:Label ID="lblInfoHost" runat="server" Text=""></asp:Label></p>
                       </div>
                        <div class="row">
                          <h2>Description</h2>
                       </div>  
                         <p style="margin-left: -5px;"><asp:Label ID="lblInfoDesc" runat="server" Text=""></asp:Label></p>

                       </div>
                          
                          </div>--%>
                        <!-- End Modal content -->


                          </div>
                          
                          
                          
                      </div>
                      </div>
                    <span class="text-success mr-2"> </span>
                    <span class="text-nowrap"></span>
                 
                </div>
              </div>
            
            <%--<div class="col-xl-12 col-lg-12 col-md-12">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                      <img src="img/bostonhouse.jpg" style="width: 100px; margin-top: 10px;">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">Location Name:</h5>
                      <span class="h2 font-weight-bold mb-0">Room in Downtown Area</span>
                        <h5 class="card-title text-uppercase text-muted mb-0">Price:</h5>
                        <span class="h2 font-weight-bold mb-0">&#36;420/month</span>
                        
                     
                    </div>
                    <div class="col-auto">
                    </div>
                  </div>
                  <p class="mt-3 mb-0 text-muted text-sm">
                    <span class="text-success mr-2"> </span>
                    <span class="text-nowrap"></span>
                  </p>
                </div>
              </div>
            </div><div class="col-xl-12 col-lg-12 col-md-12">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                      <img src="img/bostonhouse.jpg" style="width: 100px; margin-top: 10px;">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">Location Name:</h5>
                      <span class="h2 font-weight-bold mb-0">Room in Downtown Area</span>
                        <h5 class="card-title text-uppercase text-muted mb-0">Price:</h5>
                        <span class="h2 font-weight-bold mb-0">&#36;420/month</span>
                        
                     
                    </div>
                    <div class="col-auto">
                    </div>
                  </div>
                  <p class="mt-3 mb-0 text-muted text-sm">
                    <span class="text-success mr-2"> </span>
                    <span class="text-nowrap"></span>
                  </p>
                </div>
              </div>
            </div><div class="col-xl-12 col-lg-12 col-md-12">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                      <img src="img/bostonhouse.jpg" style="width: 100px; margin-top: 10px;">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">Location Name:</h5>
                      <span class="h2 font-weight-bold mb-0">Room in Downtown Area</span>
                        <h5 class="card-title text-uppercase text-muted mb-0">Price:</h5>
                        <span class="h2 font-weight-bold mb-0">&#36;420/month</span>--%>
                        
                     
                    </div>
                    <div class="col-auto">
                    </div>
                  </div>
                  <p class="mt-3 mb-0 text-muted text-sm">
                    <span class="text-success mr-2"> </span>
                    <span class="text-nowrap"></span>
                  </p>
                </div>
              </div>
            </div>
          </div>
                </div> 
      </div>
        </div>  
            </form>
  <!--   Core   -->
  <script src="assets/js/plugins/jquery/dist/jquery.min.js"></script>
  <script src="assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
 
    <!--   Optional JS   -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAo5fiqNm1KtTAlIDjC9OnF7FS2s-0YlZw"></script>
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
    <script>

        function returnCity() {
                var city = "<%=CurrentSession.Current.longSearch%>";
                return city;
            }
    </script>


</body>

</html>