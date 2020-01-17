<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tenantReview.aspx.cs" Inherits="tenantReview" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

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
     .ratingStar  
        {  
            font-size: 0pt;  
            width: 13px;  
            height: 12px;            
            cursor: pointer;  
            display: block;  
            background-repeat: no-repeat;  
        }  
        .filledStar  
        {  
            background-image: url(imgStar/ratingStarFilled.png);  
        }  
        .emptyStar  
        {  
            background-image: url(imgStar/ratingStarEmpty.png);  
        }  
        .savedStar  
        {  
            background-image: url(imgStar/ratingStarSaved.png);  
        }  
        .auto-style1 {  
            height: 50px;  
        }  
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
        <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block">Accommodation Review</a>
          
          
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
                  <h3 class="mb-0"><asp:Label ID="lblDetail" runat="server" Text="Review this space"></asp:Label></h3>
                </div>
                <div class="col-4 text-right">
                  <a href='javascript:history.go(-1)' class="btn btn-sm btn-primary">Go Back</a>
                </div>
              </div>
            </div>
            <div class="card-body">
              <form runat="server">
                <div class="pl-lg-4">
                   
                  <!--comment area-->
            <asp:Panel ID="Panel3" runat="server" HorizontalAlign="left">
                <asp:DataList ID="ListView1" runat="server" RepeatDirection="Vertical" RepeatLayout="Flow" CssClass="list">  
                  
                 <ItemTemplate>
                     <div class="list">
                         <div class="list" style="width: 50%;">
                             <tr><td><img src='data:image/jpg;base64,<%# Convert.ToBase64String((byte[])Eval("Image1")) %>' width="330px" height="200px"></td></tr>
                                </div>
                             <div class="list" style="width: 50%;">
                             <tr><td><h3><span2><%#Eval("Street") %></span2></h3></td></tr>
                             <tr><td><p><span2>Type: <%#Eval("RoomType") %></span2></p></td></tr>
                             <tr><td><span2>Location: <%#Eval("CityCo") %>, <%#Eval("AccomState")%></span2></td></tr>
                             </div>
                         </div>
                    </ItemTemplate>
                </asp:DataList>
                        
                    </asp:Panel>
                    <hr class="my-4" />
                    
                    <a><strong>Rate this Space: </strong></a>
                    <select name="rating" runat="server" id="dropRate">
                              <option value="1">1</option>
                              <option value="2">2</option>
                              <option value="3">3</option>
                              <option value="4">4</option>
                              <option value="5">5</option>
                            </select>
                    <a>out of 5</a>
                    <br><br>
                    <a><strong>Comment</strong></a>
                    <textarea rows="4" id="txtComment" runat="server" class="form-control form-control-alternative" placeholder="A few words about the property ..." maxlength="250"></textarea>
                    <hr class="my-4" />
                    <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Right">
                    <asp:Button ID="SubmitBtn" runat="server" Text="Submit" class="mt-2 mb-4 btn btn-info" OnClick="SubmitBtn_Click"/>
                    </asp:Panel>
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