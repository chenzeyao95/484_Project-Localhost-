<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HostListing.aspx.cs" Inherits="HostListing" %>

<!DOCTYPE html>


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
            
    <script type="text/javascript">
    function redir(id) {
        
    }
    </script>
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
        <img src="img/logotransparent.png" class="navbar-brand-img" alt="room magnet logo">
      </a>
      <!-- User -->
      <ul class="nav align-items-center d-md-none">
        
        <li class="nav-item dropdown">
          <a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <div class="media align-items-center">
              <span class="avatar avatar-sm rounded-circle">
                <img alt="avatar image" src="<%:CurrentSession.Current.hImage%>">
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
        <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block">Listings</a>
        
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
            <p class="text-white mt-0 mb-5">Your listings appear here. They are being actively displayed in tenant searches.</p>
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
                  <h3 class="mb-0">Listings</h3>
                </div>
              </div>
            </div>
            <div class="card-body">
              <div class="container">
                  <h6 class="heading-small text-muted mb-4">Manage Listings, or add a new listing</h6><a href="HostCreateList.aspx"><button class="mt-2 mb-4 btn btn-info">Start a new listing</button></a>
               <form id="form1" runat="server">
                   <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Justify">
                  <asp:DataList ID="ListView1" runat="server" RepeatDirection="Vertical" RepeatLayout="Flow" CssClass="row">                  
                 <ItemTemplate>
                     <div class="list">
                         <table>
                             <tr><td><img src='data:image/jpg;base64,<%# Convert.ToBase64String((byte[])Eval("Image1")) %>' width="350px" height="230"></td></td>
                             <tr><td><h4><span2><%#Eval("Street") %></span2></h4></td></tr>
                             <tr><td><span2>Type: <%#Eval("RoomType") %></span2></td></tr>
                             <tr><td><h4><span2>$<%#Eval("Price") %> /Month</span2></h4></td></tr>
                                <tr><td>
                                  <asp:LinkButton class="mt-2 mb-4 btn btn-info" runat="server" 
                                    ID="SelectAccomBtn" 
                                    Text="See Details" 
                                    CommandName="SeeDetail" 
                                    CommandArgument='<%# Eval("AccommodationID") %>' 
                                    OnCommand="DetailBtn_Command"/>

                                   <%-- <asp:LinkButton class="mt-2 mb-4 btn btn-info" runat="server" 
                                    ID="DeleteAccomBtn" 
                                    Text="Delete" 
                                    CommandName="DeleteListing" 
                                    CommandArgument='<%# Eval("AccommodationID") %>' 
                                    OnCommand="DeleteAccomBtn_Command"
                                    OnClientClick="return confirm('Are you sure you want to delete this listing?')" />--%>
                                </td></tr>
                             </table>
                         </div>
                    </ItemTemplate>
                </asp:DataList>
                       </asp:Panel>
    </form>
<%--    <div class="row">
        
        <div class="list-area col-md-12">
         
        <div class="col-md-8">
            <div class="media">
              <div class="media-left">
               
                  <img class="media-object" src="img/singlehome64.jpg" alt="boston house">
                
              </div>
              <div class="media-body">
                <h4 class="media-heading" style="width: inherit">Location Name: Fairfax Room</h4>
                <p>One room available for rent in Fairfax. Features private bathroom.</p> <br>
                  <button id="myBtn" class="mt-3 btn btn-info">Listing Details</button>

                <!-- The Modal -->
                <div id="myModal" class="modal">

                  <!-- Modal content -->
                  <div class="modal-content">
                    <span class="close">&times;</span>
                    <h2>Listing Details</h2><button class="btn btn-info">Edit Listing</button>
                      <span><label>Listing Name:</label>
                          <input type="text" class="form-control form-control-alternative" placeholder="Listing name" value="Fairfax Room">
                          <label class="form-control-label">Amenities </label>
                        <p>check all that apply:</p>
                      
                    
               
                      <div style="float: left; width: 60%;">
                          <input type="checkbox" name="vehicle" value="Bike" checked> Private Bathroom<br>
                          <input type="checkbox" name="vehicle" value="Car"> Private Laundry<br>
                          <input type="checkbox" name="vehicle" value="Car" > Kitchenette<br>
                          <input type="checkbox" name="vehicle" value="Car" > Private living room<br>    
                        </div>
                            <br><br><br><br><br><label class="form-control-label">Neighborhood Preferences</label>
                        <p>check all that apply:</p>
                      <div style="float: left; width: 50%;">
                          <input type="checkbox" name="lownoise" value="Low Noise"> Low Noise<br>
                          <input type="checkbox" name="moderatenoise" value="Moderate Noise"> Moderate Noise<br>
                          <input type="checkbox" name="noisepref" value="No Noise Preference"> No noise preference<br>
                          <input type="checkbox" name="pet" value="Pet-Friendly" > Pet Friendly<br>
                        </div>
                            <div style="float: left; width: 50%;">
                          <input type="checkbox" name="watch" value="Neighborhood Watch"> Neighborhood Watch<br>
                          <input type="checkbox" name="nonsmoke" value="Non-smoking"> Non-smoking<br>
                          <input type="checkbox" name="smoke" value="Smoker-friendly"> Smoker-friendly<br>
                          <input type="checkbox" name="chores" value="Chores"> Household Chores<br>
                        </div>
                     
                      </span>
                      <label class="form-control-label pt-2">Description</label>
                    <textarea rows="4" class="form-control form-control-alternative" placeholder="A few words about your stay ...">One room available for rent in Fairfax. Features private bathroom.</textarea>
                      <button class="mt-3 btn btn-info">Delete Listing</button>
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
