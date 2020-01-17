<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HostCreateList.aspx.cs" Inherits="HostCreateList" %>

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
        <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block">Create New Listing</a>
        
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
    <div class="container-fluid mt--7">
    <!-- Page content -->
    <div class="col-xl-12 order-xl-1">
          <div class="card bg-secondary shadow">
            <div class="card-header bg-white border-0">
              <div class="row align-items-center">
                  <div class="card-body">
                      <a href="HostListing.aspx"><button class="btn" style="margin-bottom: 20px; border-color: #DB464D; background-color: white;">Return to Listings</button></a>
              <form runat="server">
               
                <div class="pl-lg-4">
                    
                  <div class="row">
                      <div>
                          <div class="alert alert-danger" role="alert">
                            <strong>Note:</strong>
                             At the end of this form, you will take another homeowner survey for this property. 
                             No additional background check is required.
                        </div>
                       </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <h4>Listing Information&#58;</h4>
                          <label>Accommodation Name:</label>
                          <asp:TextBox
                              id="txtAccomName"
                              class="form-control form-control-alternative"
                              TextMode="SingleLine"
                              Runat="server" MaxLength="50" />
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAccomName" Display="Dynamic" Text="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
                       <label>Street Address:</label>
                          <asp:TextBox
                              id="txtAddress"
                              class="form-control form-control-alternative"
                              TextMode="SingleLine"
                              Runat="server" MaxLength="50" />
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAddress" Display="Dynamic" Text="*Required" ForeColor="Red"></asp:RequiredFieldValidator>

                          <label style="margin-top: 15px;">City:</label>
                              <asp:TextBox
                              id="txtCity"
                              class="form-control form-control-alternative"
                              TextMode="SingleLine"
                              Runat="server" MaxLength="50" />
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCity" Display="Dynamic" Text="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
                          <label style="margin-top: 15px;">State: </label>
                           <select id="inputState" class="form-control form-control-lg" runat ="server">
                            <option selected></option>
                            <option value="AK">Alaska</option>
                            <option value="AL">Alabama</option>
                            <option value="AR">Arkansas</option>
                            <option value="AZ">Arizona</option>
                            <option value="CA">California</option>
                            <option value="CO">Colorado</option>
                            <option value="CT">Connecticut</option>
                            <option value="DC">District of Columbia</option>
                            <option value="DE">Delaware</option>
                            <option value="FL">Florida</option>
                            <option value="GA">Georgia</option>
                            <option value="HI">Hawaii</option>
                            <option value="IA">Iowa</option>
                            <option value="ID">Idaho</option>
                            <option value="IL">Illinois</option>
                            <option value="IN">Indiana</option>
                            <option value="KS">Kansas</option>
                            <option value="KY">Kentucky</option>
                            <option value="LA">Louisiana</option>
                            <option value="MA">Massachusetts</option>
                            <option value="MD">Maryland</option>
                            <option value="ME">Maine</option>
                            <option value="MI">Michigan</option>
                            <option value="MN">Minnesota</option>
                            <option value="MO">Missouri</option>
                            <option value="MS">Mississippi</option>
                            <option value="MT">Montana</option>
                            <option value="NC">North Carolina</option>
                            <option value="ND">North Dakota</option>
                            <option value="NE">Nebraska</option>
                            <option value="NH">New Hampshire</option>
                            <option value="NJ">New Jersey</option>
                            <option value="NM">New Mexico</option>
                            <option value="NV">Nevada</option>
                            <option value="NY">New York</option>
                            <option value="OH">Ohio</option>
                            <option value="OK">Oklahoma</option>
                            <option value="OR">Oregon</option>
                            <option value="PA">Pennsylvania</option>
                            <option value="PR">Puerto Rico</option>
                            <option value="RI">Rhode Island</option>
                            <option value="SC">South Carolina</option>
                            <option value="SD">South Dakota</option>
                            <option value="TN">Tennessee</option>
                            <option value="TX">Texas</option>
                            <option value="UT">Utah</option>
                            <option value="VA">Virginia</option>
                            <option value="VT">Vermont</option>
                            <option value="WA">Washington</option>
                            <option value="WI">Wisconsin</option>
                            <option value="WV">West Virginia</option>
                            <option value="WY">Wyoming</option>
                          </select>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="inputState" Display="Dynamic" Text="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
                          <label style="margin-top: 15px;">Zip Code:</label>
                              <asp:TextBox
                              id="txtZip"
                              class="form-control form-control-alternative"
                              TextMode="Number"
                              Runat="server" MaxLength="9" />
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtZip" Display="Dynamic" Text="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
                          <label style="margin-top: 15px;">Neighborhood (if applicable):</label>
                          <asp:TextBox
                              id="txtNeighborhood"
                              class="form-control form-control-alternative"
                              TextMode="SingleLine"
                              Runat="server" MaxLength="50" />
                          <label style="margin-top: 15px;">Enter a brief description:</label>
                          <asp:TextBox
                              id="txtDesc"
                              class="form-control form-control-alternative"
                              TextMode="SingleLine"
                              Runat="server" MaxLength="250" />
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtDesc" Display="Dynamic" Text="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
                          <label style="margin-top: 15px;">Enter your desired monthly rent:</label>
                            <asp:TextBox
                                id="txtPrice"
                                TextMode="Number"
                                class="form-control form-control-alternative"
                                Runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtPrice" Display="Dynamic" Text="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
                      </div>
                       
                    </div>
                    <div class="col-lg-12">
                      
                  </div>
                  </div>
                  </div>
                    <div class="pl-lg-4">
                        <div class="row">
<%--                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" style="margin-top: 15px;">How many rooms do you have available?</label>
                          <select id="roomCountDropDown" runat="server">
                          <option value="1">1</option>
                          <option value="2">2</option>
                          <option value="3">3</option>
                          <option value="4">4</option>
                        </select>  
                      </div>
                    </div>--%>
                    <div class="col-lg-8">
                        <label class="form-control-label" style="margin-top: 15px;">What type of accommodation are you offering&#63;</label>
                          <select id="roomTypeDrop" runat="server">
                          <option value="Private">Private</option>
                          <option value="Shared">Shared</option>
                          <option value="Apartment">Apartment</option>
                          <option value="Loft">Loft</option>
                        </select>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="roomTypeDrop" Display="Dynamic" Text="*Required"></asp:RequiredFieldValidator>
                        </div>
                      </div>                 
                  </div>
                  <br>
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
                          <br>

                          
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
                                <br>
                        </div>
                        
                       
                        <div>
                          <p>
                          <label class="form-control-label">Accommodation Images Upload</label>
                          <asp:FileUpload ID="imgUpload1" runat="server" />
                          <asp:FileUpload ID="imgUpload2" runat="server" />
                          <asp:FileUpload ID="imgUpload3" runat="server" />                              
                          <br><asp:Label ID="lblAccomPic" runat="server" Visible="False"></asp:Label>                          
                          </p>
                                <a href="HostListing.aspx"><asp:Button
                                id="btnCompleteListing"
                                class="mt-2 mb-4 btn btn-info"
                                text="Save Listing"
                                Runat="server" OnClick="btnCompleteListing_Click" /> </a>
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
