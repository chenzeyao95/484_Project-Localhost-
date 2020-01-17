using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
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

public partial class tenantDash : System.Web.UI.Page
{
    SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (CurrentSession.Current.userEmail == null)
        {
            Response.Redirect("Signin.aspx");
        }
        else
        {
            String BGStatus;
            userName.Text = CurrentSession.Current.firstName + " " + CurrentSession.Current.lastName;
            helloName.Text = "Hello, " + CurrentSession.Current.firstName;
            nameTopRight.Text = CurrentSession.Current.firstName + " " + CurrentSession.Current.lastName;
            dashboardType.Text = CurrentSession.Current.tenantType;

            sc.Open();
            SqlCommand getBG = new SqlCommand();
            getBG.Connection = sc;
            getBG.CommandText = "Select Upper(BackGround) FROM TENANT WHERE TenantID=@TenID";
            getBG.Parameters.Add(new SqlParameter("@TenID", CurrentSession.Current.tenantID));
            String bgCheck = getBG.ExecuteScalar().ToString();

            if (bgCheck=="Y") 
            {
                BGStatus = "Background Check Approved";
                backgroundlbl.Text = BGStatus;
                backgroundlbl.ForeColor = Color.Green;
            }
            else if (bgCheck=="N")
            {
                BGStatus = "Background Check Denied";
                backgroundlbl.Text = BGStatus;
                backgroundlbl.ForeColor = Color.Red;

            }
            else if(bgCheck=="P")
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

            SqlDataAdapter one = new SqlDataAdapter("SELECT Image1, Street, RoomType, AccommodationID FROM ACCOMMODATION WHERE TenantID = @TenantID", sc);
            one.SelectCommand.Parameters.Add(new SqlParameter("@TenantID", CurrentSession.Current.tenantID));
            DataTable dt = new DataTable();
            one.Fill(dt);
            ListView1.DataSource = dt;
            ListView1.DataBind();

            SqlDataAdapter two = new SqlDataAdapter("SELECT DISTINCT HostID, HostName FROM MESSAGE WHERE TenantID=@TenID", sc);
            two.SelectCommand.Parameters.Add(new SqlParameter("@TenID", CurrentSession.Current.tenantID));
            DataTable dt2 = new DataTable();
            two.Fill(dt2);
            ListView2.DataSource = dt2;
            ListView2.DataBind();

            SqlDataAdapter three = new SqlDataAdapter("SELECT PreConID, HostName, AccomName, PreConDate, AccommodationID, Image1 FROM PRECONFIRMATION WHERE TenantID=@TenID", sc);
            three.SelectCommand.Parameters.Add(new SqlParameter("@TenID", CurrentSession.Current.tenantID));
            DataTable dt3 = new DataTable();
            three.Fill(dt3);
            DataList1.DataSource = dt3;
            DataList1.DataBind();
        }
    }

    public void SeeDetailsBtn_Command(Object sender, CommandEventArgs e)
    {
        Response.Redirect("tenantAccomInfo.aspx?id=" + e.CommandArgument);
    }

    public void ConfirmLeaseBtn_Command(Object sender, CommandEventArgs e)
    {
        Response.Redirect("tenantConfirm.aspx?id=" + e.CommandArgument);
    }

    public void noRecordBtn_Command(Object sender, CommandEventArgs e)
    {
        Response.Redirect("tenantSearch.aspx");
    }

    public void WriteReviewBtn_Command(Object sender, CommandEventArgs e)
    {
        Response.Redirect("tenantReview.aspx?id=" + e.CommandArgument);
    }

    public void Contact_serverClick(Object sender, CommandEventArgs e)
    {
        Response.Redirect("tenantDialog.aspx?id=" + e.CommandArgument);
    }

    //Use method to check background check information.
    protected void BGCheckBtn_Click(object sender, EventArgs e)
    {

        Response.Write("<script>window.open ('https://www.intellicorp.net/marketing/Packages/Tenant','_blank');</script>");

        sc.Open();
        SqlCommand updateBGTenant = new SqlCommand();
        updateBGTenant.Connection = sc;
        updateBGTenant.CommandText = "Update Tenant SET BackGround = 'P' Where TenantID = @TenantID";
        updateBGTenant.Parameters.Add(new SqlParameter("@TenantID", CurrentSession.Current.tenantID));
        updateBGTenant.ExecuteNonQuery();
        sc.Close();
    }

    protected void BtnUpPass_Click(object sender, EventArgs e)
    {
        String password = HttpUtility.HtmlEncode(txtNewPass.Text);
        string storedHash = "";

        System.Data.SqlClient.SqlCommand userLoginTenant = new System.Data.SqlClient.SqlCommand();
        userLoginTenant.Connection = sc;
        sc.Open();
        userLoginTenant.CommandText = "SELECT * FROM TENANT WHERE upper(TenantEmail) = upper(@userEmail)";
        userLoginTenant.Parameters.Add(new SqlParameter("@userEmail", CurrentSession.Current.userEmail));
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
            UpdatePass.CommandText = "UPDATE TENANT SET Password=@Pass WHERE upper(TenantEmail) = upper(@userEmail)";
            UpdatePass.Parameters.Add(new SqlParameter("@Pass", PasswordHash.HashPassword(password))); // Password hash
            UpdatePass.Parameters.Add(new SqlParameter("@userEmail", CurrentSession.Current.userEmail));
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