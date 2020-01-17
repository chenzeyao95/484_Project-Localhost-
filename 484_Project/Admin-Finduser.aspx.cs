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

public partial class Admin_Finduser : System.Web.UI.Page
{
    SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (CurrentSession.Current.AdminUser == null)
        {
            Response.Redirect("AdminSignin.aspx");
        }

        SqlDataAdapter one = new SqlDataAdapter("SELECT TenantID, FirstName, LastName, TenantType, tenImage FROM TENANT where upper(Active) = 'Y'", sc);
        DataTable dt = new DataTable();
        one.Fill(dt);
        ListView1.DataSource = dt;
        ListView1.DataBind();
    }

    protected void DeleteUserBtn_Command(object sender, CommandEventArgs e)
    {
        sc.Open();

        SqlCommand DeleteUser = new SqlCommand();
        DeleteUser.Connection = sc;
        DeleteUser.CommandText = "Update Tenant set Active = 'N' where TenantID=@TenID; ";
        DeleteUser.Parameters.Add(new SqlParameter("@TenID", e.CommandArgument));
        DeleteUser.ExecuteNonQuery();

        sc.Close();
        Response.Redirect("Admin-Finduser.aspx");
    }

}