using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

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

public partial class Admin_Backgrounds : System.Web.UI.Page
{
    // Establish connection to the server
    SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);


    protected void Page_Load(object sender, EventArgs e)
    {
        // if not currentsession variable then redirect to AdminSignin.aspx
        if (CurrentSession.Current.AdminUser == null)
        {
            Response.Redirect("AdminSignin.aspx");
        }
        if (!IsPostBack)
        {
            Panel1.Visible = true;
            SqlDataAdapter getTenBG = new SqlDataAdapter("SELECT TenantID, FirstName, LastName, tenImage from Tenant WHERE BackGround = 'P' ", sc);
            DataTable dt = new DataTable();
            getTenBG.Fill(dt);
            ListView1.DataSource = dt;
            ListView1.DataBind();
        }

    }

    //Use method in order to update tenant background status to success.
    protected void Update_ServerClick(object sender, CommandEventArgs e) 
    {
        sc.Open();
        SqlCommand updateTenant = new SqlCommand();
        updateTenant.Connection = sc;
        updateTenant.CommandText = "Update Tenant SET BackGround = 'Y' Where TenantID = @TenantID";
        updateTenant.Parameters.Add(new SqlParameter("@TenantID", e.CommandArgument));
        updateTenant.ExecuteNonQuery();
        Response.Redirect("Admin-Backgrounds.aspx");
        sc.Close();

    }

    //Use method in order to update tenant background status to failed.
    protected void Deny_ServerClick(object sender, CommandEventArgs e)
    {
        sc.Open();
        SqlCommand updateTenant = new SqlCommand();
        updateTenant.Connection = sc;
        updateTenant.CommandText = "Update Tenant SET BackGround = 'N' Where TenantID = @TenantID";
        updateTenant.Parameters.Add(new SqlParameter("@TenantID", e.CommandArgument));
        updateTenant.ExecuteNonQuery();
        Response.Redirect("Admin-Backgrounds.aspx");
        sc.Close();
    }

    //Use method in order to display all the current tenants.
    protected void tenBTN_Click(object sender, EventArgs e)
    {
        if (Panel2.Visible == true)
        {
            Panel2.Visible = false;
        }

        Panel1.Visible = true;
        SqlDataAdapter getTenBG = new SqlDataAdapter("SELECT TenantID, FirstName, LastName, tenImage from Tenant WHERE BackGround = 'P' ", sc);
        DataTable dt = new DataTable();
        getTenBG.Fill(dt);
        ListView1.DataSource = dt;
        ListView1.DataBind();
    }

    //Use method in order to display all the current hosts.
    protected void hostBTN_Click(object sender, EventArgs e)
    {
        if (Panel1.Visible == true)
        {
            Panel1.Visible = false;
        }

        Panel2.Visible = true;
        SqlDataAdapter getHostBG = new SqlDataAdapter("SELECT HostID, HostFirstName, HostLastName, hostImage from HOMEOWNER WHERE BackGround = 'P' ", sc);
        DataTable dt = new DataTable();
        getHostBG.Fill(dt);
        ListView2.DataSource = dt;
        ListView2.DataBind();
    }

    //Use method in order to update homeowner background status to success.
    protected void Update_ServerClick2(object sender, CommandEventArgs e)
    {
        sc.Open();
        SqlCommand updateHost = new SqlCommand();
        updateHost.Connection = sc;
        updateHost.CommandText = "Update HOMEOWNER SET BackGround = 'Y' Where HostID = @HostID";
        updateHost.Parameters.Add(new SqlParameter("@HostID", e.CommandArgument));
        updateHost.ExecuteNonQuery();
        Response.Redirect("Admin-Backgrounds.aspx");
        sc.Close();

    }

    //Use method in order to update homeowner background status to failed.
    protected void Deny_ServerClick2(object sender, CommandEventArgs e)
    {
        sc.Open();
        SqlCommand updateHost = new SqlCommand();
        updateHost.Connection = sc;
        updateHost.CommandText = "Update HOMEOWNER SET BackGround = 'N' Where HostID = @HostID";
        updateHost.Parameters.Add(new SqlParameter("@HostID", e.CommandArgument));
        updateHost.ExecuteNonQuery();
        Response.Redirect("Admin-Backgrounds.aspx");
        sc.Close();
    }
}