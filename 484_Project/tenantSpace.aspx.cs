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

public partial class tenantSpace : System.Web.UI.Page
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
            userName.Text = CurrentSession.Current.firstName + " " + CurrentSession.Current.lastName;
            helloName.Text = "Hello, " + CurrentSession.Current.firstName;
            nameTopRight.Text = CurrentSession.Current.firstName + " " + CurrentSession.Current.lastName;
            dashboardType.Text = CurrentSession.Current.tenantType;

            SqlDataAdapter one = new SqlDataAdapter("SELECT AccomImage, Street, RoomType, CONVERT(Decimal(10,2), Price) as Price, AccommodationID, HostID FROM FAVOR WHERE TenantID = @TenantID", sc);
            one.SelectCommand.Parameters.Add(new SqlParameter("@TenantID", CurrentSession.Current.tenantID));
            DataTable dt = new DataTable();
            one.Fill(dt);
            ListView1.DataSource = dt;
            ListView1.DataBind();
        }
    }

    //Use method in order to delete an accommodation from favorite table.
    public void DeleteAccomBtn_Command(Object sender, CommandEventArgs e)
    {
        sc.Open();
        SqlCommand DeleteAccom = new SqlCommand();
        DeleteAccom.Connection = sc;
        DeleteAccom.CommandText = "Delete from FAVOR where AccommodationID=@AccomID and TenantID=@TenID;";
        DeleteAccom.Parameters.Add(new SqlParameter("@AccomID", e.CommandArgument));
        DeleteAccom.Parameters.Add(new SqlParameter("@TenID", CurrentSession.Current.tenantID));
        DeleteAccom.ExecuteNonQuery();
        sc.Close();
        Response.Redirect("tenantSpace.aspx");
    }

    public void SeeDetailsBtn_Command(Object sender, CommandEventArgs e)
    {
        Response.Redirect("tenantAccomInfo.aspx?id=" + e.CommandArgument);
    }

    public void noRecordBtn_Command(Object sender, CommandEventArgs e)
    {
        Response.Redirect("tenantSearch.aspx");
    }

    public void ContactBtn_Command(Object sender, CommandEventArgs e)
    {
        Response.Redirect("tenantDialog.aspx?id=" + e.CommandArgument);
    }
}