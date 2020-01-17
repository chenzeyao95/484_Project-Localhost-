<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tenantSpace.aspx.cs" Inherits="tenantSpace" %>

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
    <form runat="server">
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
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="tenantDash.aspx">
              <i class="ni ni-single-02 text-yellow"></i> Dashboard
            </a>
          </li>
            <li class="nav-item">
            <a class="nav-link" href="tenantSearch.aspx">
              <i class="ni fas fa-search"></i> Search
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="tenantSpace.aspx">
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
        <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block">My Favorites</a>

        <!-- User -->
        <ul class="navbar-nav align-items-center d-none d-md-flex">
          <li class="nav-item dropdown">
            <a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <div class="media align-items-center">
                <span class="avatar avatar-sm rounded-circle">
                  <img alt="User profile image" src="<%=CurrentSession.Current.tImage %>">
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
            <p class="text-white mt-0 mb-5">These are the potential living spaces available to you based on the locations you have saved.</p><br>
            <p class="text-white mt-0 mb-3">Need to change your survey responses?</p>
            <a href="tenantSurvey.aspx" class="btn btn-info" style="background-color: #DB464D; border: 0px;">Take a new tenant survey</a>
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
                    <img src="<%=CurrentSession.Current.tImage %>" class="rounded-circle">
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
                     <!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
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
                </div>
                
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-8 order-xl-1">
          <div class="card bg-secondary shadow">
            <div class="card-header bg-white border-0">
              <div class="row align-items-center">
                <div class="col-8">
                  <h3 class="mb-0">Saved Spaces</h3>
                </div>
              </div>
            </div>
            <div class="card-body">
              <div class="container">

               <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Justify">
                  <asp:DataList ID="ListView1" runat="server" RepeatDirection="Vertical" RepeatLayout="Flow" CssClass="row">
                  <FooterTemplate>
                      <asp:Label Visible='<%#bool.Parse((ListView1.Items.Count==0).ToString())%>' 
                                   runat="server" ID="lblNoRecord1" Text="You don't have saved spaces."></asp:Label>
                      <asp:LinkButton ID="noRecordBtn" runat="server" 
                          Visible='<%#bool.Parse((ListView1.Items.Count==0).ToString())%>'
                          OnCommand="noRecordBtn_Command"
                          class="btn btn-sm btn-primary">Search Now</asp:LinkButton>

                    </FooterTemplate>
                 <ItemTemplate>
                     <div class="list">
                         <table>
                             <tr><td><img src='data:image/jpg;base64,<%# Convert.ToBase64String((byte[])Eval("AccomImage")) %>' width="350px" height="230"></td></td>
                             <tr><td><h4><span2><%#Eval("Street") %></span2></h4></td></tr>
                             <tr><td><span2>Type: <%#Eval("RoomType") %></span2></td></tr>
                             <tr><td><h4><span2>$<%#Eval("Price") %> /Month</span2></h4></td></tr>
                                <tr><td>
                                  <asp:LinkButton class="mt-2 mb-4 btn btn-info" runat="server" 
                                    ID="SelectAccomBtn" 
                                    Text="Details" 
                                    CommandName="SeeDetail" 
                                    CommandArgument='<%# Eval("AccommodationID") %>'
                                    OnCommand="SeeDetailsBtn_Command" />

                                    <asp:LinkButton class="mt-2 mb-4 btn btn-info" runat="server" 
                                    ID="ReachHostBtn" 
                                    Text="Contact Host" 
                                    CommandName="ReachHost" 
                                    CommandArgument='<%# Eval("HostID") %>' 
                                    OnCommand="ContactBtn_Command"/>

                                    <asp:LinkButton class="mt-2 mb-4 btn btn-info" runat="server" 
                                    ID="DeleteAccomBtn" 
                                    Text="Delete" 
                                    CommandName="DeleteListing" 
                                    CommandArgument='<%# Eval("AccommodationID") %>' 
                                    OnCommand="DeleteAccomBtn_Command"/>
                                </td></tr>
                             </table>
                         </div>
                    </ItemTemplate>
                </asp:DataList>
             </asp:Panel>
    
    <%--<div class="row">
        
        <div class="list-area col-md-12">
         
        <div class="col-md-8">
            <div class="media">
              <div class="media-left">
               
                  <img class="media-object" src="img/singlehome64.jpg" alt="boston house">
                
              </div>
              <div class="media-body">
                <h4 class="media-heading" style="width: inherit">Location Name: Cozy in Boston</h4>
                  <h4 class="media-heading">Owner: Bob Barker</h4>
                <p>Located just five minutes away from Boston Medical Center, we are a perfect location for med school students.</p> <br>
                  <button id="myBtn" class="mt-3 btn btn-info">See More</button>

                <!-- The Modal -->
                <div id="myModal" class="modal">

                  <!-- Modal content -->
                  <div class="modal-content">
                    <span class="close">&times;</span>
                    <h2>Amenities</h2>
                      <ul>
                        <li>Private Bathroom</li>
                          <li>Private Bathroom</li> 
                      
                      </ul>
                       <h2>Neighborhood/House Policies</h2>
                        <ul>
                          <li>Pet-friendly</li>
                          <li>Household Chores</li>
                          </ul>
                  </div>

                </div>
              </div>
                
            </div>
            
            </div>
     
        </div>
        
    </div>
   
        <div class="row">
             <div class="list-area col-md-12">
        <div class="col-md-8">
            <div class="media">
              <div class="media-left">
                <a href="#">
                  <img class="media-object" src="img/bostonhouse64.jpg" alt="home image">
                </a>
              </div>
            
              <div class="media-body">
                <h4 class="media-heading">Location Name: Downtown Boston Room</h4>
                  <h4 class="media-heading">Owner: Ron Swanson</h4>
                <p>I have one room available for a graduate student or young professional. Includes private bathroom.</p> <br>
                  <button id="myBtn2" class="mt-3 btn btn-info">See More</button>

                <!-- The Modal -->
                <div id="myModal2" class="modal">

                  <!-- Modal content -->
                  <div class="modal-content">
                    <span class="close2">&times;</span>
                    <h2>Amenities</h2>
                      <ul>
                        <li>Private Bedroom</li>
                        <li>Private Bathroom</li> 
                      
                      </ul>
                       <h2>Neighborhood/House Policies</h2>
                        <ul>
                          <li>Pet-friendly</li>
                          <li>Household Chores</li>
                          </ul>
                  </div>
              </div>
            </div>
        </div>
        </div>
        </div>
        </div>--%>
            </div>
          </div>
        </div>
      </div>
        </div>
    
    </div>
  </div>
<!-- modal -->  
<script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>
      <!-- modal 2 -->  
<script>
// Get the modal
var modal = document.getElementById("myModal2");

// Get the button that opens the modal
var btn = document.getElementById("myBtn2");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close2")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>
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
