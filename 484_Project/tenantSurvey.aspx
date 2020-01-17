<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tenantSurvey.aspx.cs" Inherits="tenantSurvey" %>

<!DOCTYPE html>
<script runat="server">

</script>

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
      <a class="navbar-brand pt-0" href="tenantDash.aspx">
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
        <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block">Matchmaking Survey</a>
       
        <!-- User -->
        <ul class="navbar-nav align-items-center d-none d-md-flex">
          <li class="nav-item dropdown">
            <a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <div class="media align-items-center">
                <span class="avatar avatar-sm rounded-circle">
                  <img alt="Image placeholder" src="<%=CurrentSession.Current.tImage %>">
                </span>
                <div class="media-body ml-2 d-none d-lg-block">
                  <span class="mb-0 text-sm  font-weight-bold">
                          <asp:Label
                          id="nameTopRight"
                          Text=" "
                          Runat="server" />
                  </span>
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
    <div class="container-fluid mt--7">
    <!-- Page content -->
    <div class="col-xl-12 order-xl-1">
          <div class="card bg-secondary shadow">
            <div class="card-header bg-white border-0">
              <div class="row align-items-center">
                  <div class="col-8">
                    <h3 class="mb-0">Tenant Survey</h3>
                  </div>
                  <div class="card-body">
               <a href="tenantDash.aspx"><button class="btn" style="margin-bottom: 20px; border-color: #DB464D; background-color: white;">Return to Dashboard</button></a>       
              <form runat="server">
                
                <div class="pl-lg-4">
                    
                  <div class="list">
                      <div>
                          <div class="alert alert-danger" role="alert">
                            <strong>Note:</strong>  For your protection, we require background checks from both tenants and homeowners before matching takes place. You will recieve an email link after completion of the survey. Thank You!
                        </div>
                       </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <h4>Tell us what you&#39;re looking for&#58;</h4>
                        <label>City:</label>
                          <input type="text" class="form-control form-control-alternative" placeholder="City" value=" " runat="server" id="txtCity">
                          <label style="margin-top: 15px;">Zip Code:</label>
                          <input type="text" class="form-control form-control-alternative" placeholder="Zip Code" value=" " runat="server" id="txtZip">
                          <label style="margin-top: 15px;">Enter Maximum Monthly Rent Allowed</label>
                          <input type="number" class="form-control form-control-alternative" id="myRange" runat="server">
                            <div>
                            <label style="margin-top: 15px;">What type of accommodation do you prefer?</label>
                              <select name="accommodation type" runat="server" id="dropRoomType">
                              <option value="Private">Private</option>
                              <option value="Shared">Shared</option>
                              <option value="Apartment">Apartment</option>
                              <option value="Loft">Loft</option>
                            </select>
                            </div>
                      </div>                                            
                    </div>
                    
                  </div>
                  </div>

                    <%--<div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" style="margin-top: 15px;">How many rooms are you looking to rent?</label>
                          <select name="number of rooms" id="dropNumOfRooms" runat="server">
                          <option value="1">1</option>
                          <option value="2">2</option>
                          <option value="3">3</option>
                          <option value="4">4</option>
                        </select>  
                      </div>
                    </div>--%>
                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            

                        
                        </div>
                      </div>                 
                         

                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-lg-6">       
                        <label class="form-control-label">Amenities &#40Less amenities selected may &#61; more matches&#41;</label>
                        <p>check all that apply:</p>
                      
                    
               
                      <div style="float: left; width: 50%;">
                          <input type="checkbox" id="chkBath" name="Private Bathroom" value="Private Bathroom" runat="server"> Private Bathroom<br>
                          <input type="checkbox" id="chkLaundry" name="Private Laundry" value="Private Laundry" runat="server"> Private Laundry<br>
                          <input type="checkbox" id="chkKitchen" name="Kitchenette" value="Kitchenette" runat="server" > Kitchenette<br>
                          <input type="checkbox" id="chkLiving" name="Private living room" value="Private living room" runat="server"> Private living room<br>    
                        </div>
                        </div>
                        <div class="col-lg-6">
                            <label class="form-control-label">Neighborhood Preferences &#40Less preferences selected may &#61; more matches&#41;</label>
                        <p>check all that apply:</p>
                      <div style="float: left; width: 50%;">
                          <input type="checkbox" id="chkLow" name="lownoise" value="Low Noise" runat="server"> Low Noise<br>
                          <input type="checkbox" id="chkModerate" name="moderatenoise" value="Moderate Noise" runat="server" > Moderate Noise<br>
                          <input type="checkbox" id="chkNoNoise" name="noisepref" value="No Noise Preference" runat="server" > No noise preference<br>
                          <input type="checkbox" id="chkPet" name="pet" value="Pet-Friendly" runat="server" > Pet Friendly<br>
                        </div>
                            <div style="float: left; width: 50%;">
                          <input type="checkbox" id="chkWatch" name="watch" value="Neighborhood Watch" runat="server" > Neighborhood Watch<br>
                          <input type="checkbox" id="chkNonSmoke" name="nonsmoke" value="Non-smoking" runat="server" > Non-smoking<br>
                          <input type="checkbox" id="chkSmoke" name="smoke" value="Smoker-friendly" runat="server" > Smoker-friendly<br>
                          <input type="checkbox" id="chkChores" name="chores" value="Chores" runat="server" > Household Chores<br>
                        </div>
                     </div><asp:Button
                        id="btnComplete"
                        class="mt-2 mb-4 btn btn-info"
                        Text="Submit survey and return to dashboard"
                        runat="server" 
                        OnClick="btnComplete_Click" />
                     </div> 
                    </div>
                   </form>  
                  </div>
                  
                </div>

            </div> 
        </div>  
    </div>        
    </div>
  </div>
    
  <!-- Slider -->
   <script>
var slider = document.getElementById("myRange");
var output = document.getElementById("demo");
output.innerHTML = slider.value;

slider.oninput = function() {
  output.innerHTML = this.value;
}
</script> 
    
    
  <!--   Core   -->
  <script src="assets/js/plugins/jquery/dist/jquery.min.js"></script>
  <script src="assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
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
