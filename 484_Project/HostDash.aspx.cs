using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Diagnostics;
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

public partial class HostDash : System.Web.UI.Page
{
    SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (CurrentSession.Current.huserEmail == null)
        {
            Response.Redirect("Signin.aspx");
        }
        else
        {
            String BGStatus;
            if (!IsPostBack)
            {
                //Fills user information from session variables.
                userName.Text = CurrentSession.Current.hfirstName + " " + CurrentSession.Current.hlastName;
                HelloName.Text = "Hello, " + CurrentSession.Current.hfirstName;
                nameTopRight.Text = CurrentSession.Current.hfirstName + " " + CurrentSession.Current.hlastName;
                hostLocation.Text = CurrentSession.Current.hcity + ", " + CurrentSession.Current.hstate;

                inputAddress.Text = CurrentSession.Current.haddress;
                inputCity.Text = CurrentSession.Current.hcity;
                inputState.Text = CurrentSession.Current.hstate;
                inputZip.Text = CurrentSession.Current.hzip;
                inputPhone.Text = CurrentSession.Current.hphoneNumber;
            }

            //Get listing number and review number
            sc.Open();
            System.Data.SqlClient.SqlCommand getlistno = new System.Data.SqlClient.SqlCommand();
            getlistno.Connection = sc;
            getlistno.CommandText = "SELECT Count(AccommodationID) FROM ACCOMMODATION WHERE HostID=@HostID;";
            getlistno.Parameters.Add(new SqlParameter("@HostID", CurrentSession.Current.hostID));
            System.Data.SqlClient.SqlDataReader listnoReader = getlistno.ExecuteReader();
            while (listnoReader.Read())
            {
                CurrentSession.Current.hListNo = listnoReader.GetInt32(0);
            }
            listnoReader.Close();

            System.Data.SqlClient.SqlCommand getrevno = new System.Data.SqlClient.SqlCommand();
            getrevno.Connection = sc;
            getrevno.CommandText = "SELECT Count(ReviewID) FROM REVIEW WHERE HostID=@HostID;";
            getrevno.Parameters.Add(new SqlParameter("@HostID", CurrentSession.Current.hostID));
            System.Data.SqlClient.SqlDataReader revnoReader = getrevno.ExecuteReader();
            while (revnoReader.Read())
            {
                CurrentSession.Current.hReviewNo = revnoReader.GetInt32(0);
            }
            revnoReader.Close();

            SqlCommand getBG = new SqlCommand();
            getBG.Connection = sc;
            //Checks to see the status of the current user's background check and formats it on the webpage.
            getBG.CommandText = "Select Upper(BackGround) FROM HOMEOWNER WHERE HostID=@HostID";
            getBG.Parameters.Add(new SqlParameter("@HostID", CurrentSession.Current.hostID));
            String bgCheck = getBG.ExecuteScalar().ToString();

            if (bgCheck == "Y")
            {
                BGStatus = "Background Check Approved";
                backgroundlbl.Text = BGStatus;
                backgroundlbl.ForeColor = Color.Green;
            }
            else if (bgCheck == "N")
            {
                BGStatus = "Background Check Denied";
                backgroundlbl.Text = BGStatus;
                backgroundlbl.ForeColor = Color.Red;

            }
            else if (bgCheck == "P")
            {
                BGStatus = "Background Check Pending...";
                backgroundlbl.Text = BGStatus;
            }
            else
            {
                BGStatus = "You haven't completed background check";
                backgroundlbl.Text = BGStatus;
                backgroundlbl.ForeColor = Color.Goldenrod;
                BGCheckBtn.Visible = true;
            }

            sc.Close();

            SqlDataAdapter two = new SqlDataAdapter("SELECT DISTINCT TenantID, TenantName FROM MESSAGE WHERE HostID=@HostID", sc);
            two.SelectCommand.Parameters.Add(new SqlParameter("@HostID", CurrentSession.Current.hostID));
            DataTable dt2 = new DataTable();
            two.Fill(dt2);
            ListView2.DataSource = dt2;
            ListView2.DataBind();
        }
    }

    //Use method in order to uopdate homeowner information.
    protected void saveInfoBtn_Click(object sender, EventArgs e)
    {
        String hid = Convert.ToString(CurrentSession.Current.hostID);
        String phone = HttpUtility.HtmlEncode(inputPhone.Text);
        String street = HttpUtility.HtmlEncode(inputAddress.Text);
        String city = HttpUtility.HtmlEncode(inputCity.Text);
        String state = HttpUtility.HtmlEncode(inputState.Text);
        String zip = HttpUtility.HtmlEncode(inputZip.Text);

        CurrentSession.Current.haddress = inputAddress.Text;
        CurrentSession.Current.hcity = inputCity.Text;
        CurrentSession.Current.hstate = inputState.Text;
        CurrentSession.Current.hzip = inputZip.Text;
        CurrentSession.Current.hphoneNumber = inputPhone.Text;

        sc.Open();

        System.Data.SqlClient.SqlCommand hostInsert = new System.Data.SqlClient.SqlCommand();
        hostInsert.Connection = sc;

        //Allows host to update profile information.
        hostInsert.CommandText = "UPDATE HOMEOWNER SET STREET=@street, CityCo=@city, HostState=@state, Zip=@zip, HostPhone=@phone WHERE HostID = @id";
        hostInsert.Parameters.Add(new SqlParameter("@phone", phone));
        hostInsert.Parameters.Add(new SqlParameter("@street", street));
        hostInsert.Parameters.Add(new SqlParameter("@city", city));
        hostInsert.Parameters.Add(new SqlParameter("@state", state));
        hostInsert.Parameters.Add(new SqlParameter("@zip", zip));
        hostInsert.Parameters.Add(new SqlParameter("@id", hid));
        hostInsert.ExecuteNonQuery();

        sc.Close();
    }

    public void Contact_serverClick(Object sender, CommandEventArgs e)
    {
        Response.Redirect("HostDialog.aspx?id=" + e.CommandArgument);
    }

    //Use method in order to set homeowner background status to pending.
    protected void BGCheckBtn_Click(object sender, EventArgs e)
    {
        Response.Write("<script>window.open ('https://www.intellicorp.net/marketing/Packages/Tenant','_blank');</script>");

        sc.Open();
        SqlCommand updateBGHost = new SqlCommand();
        updateBGHost.Connection = sc;
        updateBGHost.CommandText = "Update HOMEOWNER SET BackGround = 'P' Where HostID = @HostID";
        updateBGHost.Parameters.Add(new SqlParameter("@HostID", CurrentSession.Current.hostID));
        updateBGHost.ExecuteNonQuery();
        sc.Close();
    }

    protected void BtnUpPass_Click(object sender, EventArgs e)
    {
        String password = HttpUtility.HtmlEncode(txtNewPass.Text);
        string storedHash="";

        System.Data.SqlClient.SqlCommand userLoginTenant = new System.Data.SqlClient.SqlCommand();
        userLoginTenant.Connection = sc;
        sc.Open();
        userLoginTenant.CommandText = "SELECT * FROM HOMEOWNER WHERE upper(HostEmail) = upper(@userEmail)";
        userLoginTenant.Parameters.Add(new SqlParameter("@userEmail", CurrentSession.Current.huserEmail));
        System.Data.SqlClient.SqlDataReader tenantReader = userLoginTenant.ExecuteReader();

        while (tenantReader.Read()) // this will read the single record that matches the entered username
        {
            storedHash = tenantReader["Password"].ToString(); // store the database password into this variable              
        }
        tenantReader.Close();
        sc.Close();

        if (PasswordHash.ValidatePassword(txtOldPass.Text, storedHash)) // if the entered password matches what is stored, it will show success
        {
            sc.Open();
            System.Data.SqlClient.SqlCommand UpdatePass = new System.Data.SqlClient.SqlCommand();
            UpdatePass.Connection = sc;
            UpdatePass.CommandText = "UPDATE HOMEOWNER SET Password=@Pass WHERE upper(HostEmail) = upper(@userEmail)";
            UpdatePass.Parameters.Add(new SqlParameter("@Pass", PasswordHash.HashPassword(password))); // Password hash
            UpdatePass.Parameters.Add(new SqlParameter("@userEmail", CurrentSession.Current.huserEmail));
            UpdatePass.ExecuteNonQuery();
            sc.Close();

            Response.Write("<script>alert('Password updates successfully.')</script>");
            lblPassNo.Visible = false;
            txtNewPass.Text = "";
            txtOldPass.Text = "";
        }
        else
        {
            lblPassNo.Text = "Invalid Old Password";
            lblPassNo.Visible = true;
        }
    }
}