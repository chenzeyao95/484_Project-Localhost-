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

public partial class HostListing : System.Web.UI.Page
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
            HelloName.Text = "Hello, " + CurrentSession.Current.hfirstName;
            userName.Text = CurrentSession.Current.hfirstName + " " + CurrentSession.Current.hlastName;
            hostLocation.Text = CurrentSession.Current.hcity + ", " + CurrentSession.Current.hstate;
            nameTopRight.Text = CurrentSession.Current.hfirstName + " " + CurrentSession.Current.hlastName;

            SqlDataAdapter one = new SqlDataAdapter("SELECT Image1, Street, RoomType, CONVERT(Decimal(10,2), Price) as Price, AccommodationID FROM ACCOMMODATION WHERE HostID = @HostID", sc);
            one.SelectCommand.Parameters.Add(new SqlParameter("@HostID", CurrentSession.Current.hostID));
            DataTable dt = new DataTable();
            one.Fill(dt);
            ListView1.DataSource = dt;
            ListView1.DataBind();

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

            sc.Close();
        }
        
    }



    public void DetailBtn_Command(Object sender, CommandEventArgs e)
    {
        Response.Redirect("HostAccomInfo.aspx?id=" + e.CommandArgument);
    }

}