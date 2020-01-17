using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Drawing;

/*Created By:
CIS TEAM
Justin Mancini
Zeyao Chen
Colburn Cavone
Jake Brazil
Yuhao Fan
SMAD TEAM
Leah Aebly
Devin Arrington*/

public partial class Signin : System.Web.UI.Page
{
    SqlConnection sc1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    SqlConnection sc2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    
    public static SqlCommand command;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            Session.Contents.RemoveAll();
            try
            {
                // Set Server Connection String and Try Connection
                SqlConnection sc1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

                sc1.Open();
                command.Connection = sc1;
                sc1.Close();
            }

            catch (Exception)
            {
                // Return Error if Needed
                // MessageTextBox.Text = "Can not open DB connection ! ";
            }
        }
        else
        {

        }
    }

    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        bool validate = true;
        String email = HttpUtility.HtmlEncode(txtSignInEmail.Value);
        System.Data.SqlClient.SqlCommand userLoginTenant = new System.Data.SqlClient.SqlCommand();
        userLoginTenant.Connection = sc1;
        sc1.Open();
        userLoginTenant.CommandText = "SELECT * FROM TENANT WHERE TenantEmail = upper(@userEmail)";
        userLoginTenant.Parameters.Add(new SqlParameter("@userEmail", email));
        System.Data.SqlClient.SqlDataReader tenantReader = userLoginTenant.ExecuteReader();
        String userEmail;
        String firstName;
        String lastName;
        String tenantType;
        byte[] TenImage;
        byte[] HostImage;
    
        if (tenantReader.HasRows) // if the username exists, it will continue
        {
            while (tenantReader.Read()) // this will read the single record that matches the entered username
            {
                string storedHash = tenantReader["Password"].ToString(); // store the database password into this variable

                    
                userEmail = tenantReader["TenantEmail"].ToString();
                CurrentSession.Current.userEmail = userEmail;
                firstName = tenantReader["FirstName"].ToString();
                CurrentSession.Current.firstName = firstName;
                lastName = tenantReader["LastName"].ToString();
                CurrentSession.Current.lastName = lastName;
                tenantType = tenantReader["TenantType"].ToString();
                CurrentSession.Current.tenantType = tenantType;
                int tenantID = Convert.ToInt32(tenantReader["TenantID"]);
                CurrentSession.Current.tenantID = tenantID;
                TenImage = (byte[])tenantReader["tenImage"];
                String encodedBytes = Convert.ToBase64String(TenImage);
                String url = String.Concat("data:image/jpg;base64,", encodedBytes);
                CurrentSession.Current.tImage = url;
                String TActive = tenantReader["Active"].ToString();
                String lastUpdate = Convert.ToDateTime(tenantReader["LastUpdated"]).ToString("MMMM dd, yyyy");
                CurrentSession.Current.tLastUp = lastUpdate;

                if (PasswordHash.ValidatePassword(txtSignInPass.Value, storedHash)) // if the entered password matches what is stored, it will show success
                {

                    if (TActive == "Y")
                    {
                        Response.Redirect("tenantDash.aspx");
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Your account has been deactivated, you will be redirected to customer support.'); window.open('help.html');", true);
                    }
                }
                else
                {
                    validate = false;
                }

            }
        sc1.Close();                                  
        }          
        else
        {
            System.Data.SqlClient.SqlCommand userLoginHost = new System.Data.SqlClient.SqlCommand();
            userLoginHost.Connection = sc2;
            sc2.Open();
            userLoginHost.CommandText = "SELECT * FROM HOMEOWNER WHERE HostEmail = upper(@userEmail);";
            userLoginHost.Parameters.Add(new SqlParameter("@userEmail", txtSignInEmail.Value));
            System.Data.SqlClient.SqlDataReader HostReader = userLoginHost.ExecuteReader();
           

            if (HostReader.HasRows) // if the username exists, it will continue
            {
                while (HostReader.Read()) // this will read the single record that matches the entered username
                {
                    string storedHash = HostReader["Password"].ToString(); // store the database password into this variable

                    if (PasswordHash.ValidatePassword(txtSignInPass.Value, storedHash)) // if the entered password matches what is stored, it will show success
                    {
                        String hostEmail = HostReader["HostEmail"].ToString();
                        CurrentSession.Current.huserEmail = hostEmail;
                        String hostFirstName = HostReader["HostFirstName"].ToString();
                        CurrentSession.Current.hfirstName = hostFirstName;
                        String hostLastName = HostReader["HostLastName"].ToString();
                        CurrentSession.Current.hlastName = hostLastName;
                        DateTime hostDOB = Convert.ToDateTime(HostReader["DateOfBirth"]);
                        CurrentSession.Current.hbirthDate = hostDOB;
                        String address = HostReader["Street"].ToString();
                        CurrentSession.Current.haddress = address;
                        String zip = HostReader["Zip"].ToString();
                        CurrentSession.Current.hzip = zip;                 
                        String phoneNumber = HostReader["HostPhone"].ToString();
                        CurrentSession.Current.hphoneNumber = phoneNumber;
                        String state = HostReader["HostState"].ToString();
                        CurrentSession.Current.hstate = state;
                        String city = HostReader["CityCo"].ToString();
                        CurrentSession.Current.hcity = city;
                        int hostID = Convert.ToInt32(HostReader["HostID"]);
                        CurrentSession.Current.hostID = hostID;
                        HostImage = (byte[])HostReader["hostImage"];
                        String encodedBytes = Convert.ToBase64String(HostImage);
                        String url = String.Concat("data:image/jpg;base64,", encodedBytes);
                        CurrentSession.Current.hImage = url;
                        String HActive = HostReader["Active"].ToString();
                        String lastUpdate = Convert.ToDateTime(HostReader["LastUpdated"]).ToString("MMMM dd, yyyy");
                        CurrentSession.Current.hLastUp = lastUpdate;

                        if (HActive == "Y")
                        {
                            Response.Redirect("HostDash.aspx");
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('Your account has been deactivated, you will be redirected to customer support.'); window.open('help.html');", true);
                        }
                        
                    }
                    else        
                    {
                        validate = false;
                    }
                }
            }
            else
            {
                validate = false;
            }
            sc2.Close();
        }
        
        if (validate == false)
        {
           Response.Write("<script>alert('Invalid Login Credentials!')</script>"); 
        }
    }
}