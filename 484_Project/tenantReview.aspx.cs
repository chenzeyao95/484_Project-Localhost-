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

public partial class tenantReview : System.Web.UI.Page
{
    SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    int AccomID;
    DateTime now = DateTime.Now;
    int hostID;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (CurrentSession.Current.userEmail == null)
        {
            Response.Redirect("Signin.aspx");
        }
        else
        {
            AccomID = Convert.ToInt32(Request.QueryString["id"]);

                 
            SqlDataAdapter one = new SqlDataAdapter("SELECT Image1, Street, CityCo, AccomState, RoomType, AccommodationID FROM ACCOMMODATION WHERE TenantID = @TenantID and AccommodationID=@AccomID", sc);
            one.SelectCommand.Parameters.Add(new SqlParameter("@TenantID", CurrentSession.Current.tenantID));
            one.SelectCommand.Parameters.Add(new SqlParameter("@AccomID", AccomID));
            DataTable dt = new DataTable();
            one.Fill(dt);
            ListView1.DataSource = dt;
            ListView1.DataBind();
        }
    }

    //Use method in order to create a Review object.
    protected void SubmitBtn_Click(object sender, EventArgs e)
    {
        sc.Open();
        System.Data.SqlClient.SqlCommand getID = new System.Data.SqlClient.SqlCommand();
        getID.Connection = sc;
        getID.CommandText = "SELECT HostID FROM ACCOMMODATION WHERE AccommodationID=@AccomID";
        getID.Parameters.Add(new SqlParameter("@AccomID", AccomID));
        SqlDataReader readID = getID.ExecuteReader();
        while (readID.Read())
        {
            hostID = readID.GetInt32(0);
        }
        readID.Close();

        System.Data.SqlClient.SqlCommand insertReview = new System.Data.SqlClient.SqlCommand();
        insertReview.Connection = sc;
        insertReview.CommandText = "INSERT INTO REVIEW VALUES(@date, @star, @text, @tenID, @hostID, @AccomID, @tenFN, @tenLN)";
        insertReview.Parameters.Add(new SqlParameter("@date", now));
        insertReview.Parameters.Add(new SqlParameter("@star", HttpUtility.HtmlEncode(dropRate.Value)));
        insertReview.Parameters.Add(new SqlParameter("@text", HttpUtility.HtmlEncode(txtComment.Value)));
        insertReview.Parameters.Add(new SqlParameter("@tenID", CurrentSession.Current.tenantID));
        insertReview.Parameters.Add(new SqlParameter("@hostID", hostID));
        insertReview.Parameters.Add(new SqlParameter("@AccomID", AccomID));
        insertReview.Parameters.Add(new SqlParameter("@tenFN", CurrentSession.Current.firstName));
        insertReview.Parameters.Add(new SqlParameter("@tenLN", CurrentSession.Current.lastName));
        insertReview.ExecuteNonQuery();

        sc.Close();

        Response.Write("<script>alert('Review submited succesfully')</script>");

    }

    protected void Rating1_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
    {
        dropRate.Value = e.Value.ToString();
    }
}