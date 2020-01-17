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
using System.Net;

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

public partial class HostAccomInfo : System.Web.UI.Page
{
    int AccomID;
    SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    String accomImg1;
    String accomImg2;
    String accomImg3;
    int hostID;
    String neigb;
    String view;



    protected void Page_Load(object sender, EventArgs e)
    {
        //Redirect to login page if current user isn't signed in.
        if (CurrentSession.Current.huserEmail == null)
        {
            Response.Redirect("Signin.aspx");
        }
        else
        {
            AccomID = Convert.ToInt32(Request.QueryString["id"]);

            sc.Open();
            SqlCommand getAccom = new SqlCommand();
            getAccom.Connection = sc;
            //Pull accommodation info from the database.
            getAccom.CommandText = "SELECT AccomName, CityCo, AccomState, Zip, CONVERT(Decimal(10,2), Price) as Price, RoomType, Neighborhood, Description, Image1, Image2, Image3, HostID, lower(Active) FROM ACCOMMODATION WHERE AccommodationID=@AccomID;";
            getAccom.Parameters.Add(new SqlParameter("@AccomID", AccomID));
            SqlDataReader AccomReader = getAccom.ExecuteReader();
            while (AccomReader.Read())
            {
                lblDetail.Text = AccomReader.GetString(0);
                lblcity.Text = AccomReader.GetString(1);
                lblState.Text = AccomReader.GetString(2);
                lblZip.Text = AccomReader.GetString(3);
                //Format text for price.
                lblPrice.Text = "$" + AccomReader.GetDecimal(4) + " /Month";
                lblRoomType.Text = AccomReader.GetString(5);
                neigb = AccomReader.GetString(6);
                if (neigb == "NULL") { lblNeigb.Text = "(No Record)"; } else { lblNeigb.Text = neigb; }
                txtDes.Value = AccomReader.GetString(7);
                accomImg1 = String.Concat("data:image/jpg;base64,", Convert.ToBase64String((byte[])AccomReader["Image1"]));
                accomImg2 = String.Concat("data:image/jpg;base64,", Convert.ToBase64String((byte[])AccomReader["Image2"]));
                accomImg3 = String.Concat("data:image/jpg;base64,", Convert.ToBase64String((byte[])AccomReader["Image3"]));
                hostID = AccomReader.GetInt32(11);
                view = AccomReader.GetString(12);
                
            }
            AccomReader.Close();

            if (!IsPostBack)
            {
                if (view == "y") { dropStatus.SelectedIndex = 0; } else { dropStatus.SelectedIndex = 1; };
            }

            SqlCommand getHostName = new SqlCommand();
            getHostName.Connection = sc;
            getHostName.CommandText = "Select HostFirstName, HostLastName from HOMEOWNER where HostID = @HostID;";
            getHostName.Parameters.Add(new SqlParameter("@HostID", hostID));
            SqlDataReader getNameReader = getHostName.ExecuteReader();
            while (getNameReader.Read())
            {
                lblHostName.Text = getNameReader.GetString(0) + " " + getNameReader.GetString(1);
            }
            getNameReader.Close();

            SqlCommand getSurvey = new SqlCommand();
            getSurvey.Connection = sc;
            getSurvey.CommandText = "SELECT PrivateBath, PrivateLaundry, Kitchen, PrivateLiving, LowNoise, " +
                "ModerateNoise, NoNoise, PetsAllowed, Watch, NonSmoking, SmokerFriendly, Chores FROM SURVEY WHERE AccommodationID=@AccomID;";
            getSurvey.Parameters.Add(new SqlParameter("@AccomID", AccomID));
            SqlDataReader getSurReader = getSurvey.ExecuteReader();
            //Fills out ammenity details from database.
            while (getSurReader.Read())
            {
                if (getSurReader.GetString(0) == "y") { chkBath.Checked = true; }
                if (getSurReader.GetString(1) == "y") { chkLaundry.Checked = true; }
                if (getSurReader.GetString(2) == "y") { chkKitchen.Checked = true; }
                if (getSurReader.GetString(3) == "y") { chkLiving.Checked = true; }
                if (getSurReader.GetString(4) == "y") { chkLow.Checked = true; }
                if (getSurReader.GetString(5) == "y") { chkModerate.Checked = true; }
                if (getSurReader.GetString(6) == "y") { chkNoNoise.Checked = true; }
                if (getSurReader.GetString(7) == "y") { chkPet.Checked = true; }
                if (getSurReader.GetString(8) == "y") { chkWatch.Checked = true; }
                if (getSurReader.GetString(9) == "y") { chkNonSmoke.Checked = true; }
                if (getSurReader.GetString(10) == "y") { chkSmoke.Checked = true; }
                if (getSurReader.GetString(11) == "y") { chkChores.Checked = true; }
            }
            sc.Close();

            SqlDataAdapter getReview = new SqlDataAdapter("SELECT TenFName, TenLName, ReviewDate, ReviewStars, ReviewText FROM REVIEW WHERE AccommodationID=@AccomID", sc);
            getReview.SelectCommand.Parameters.Add(new SqlParameter("@AccomID", AccomID));
            DataTable dt = new DataTable();
            getReview.Fill(dt);
            ListView1.DataSource = dt;
            ListView1.DataBind();
            
        }
    }
    public string getAccomImg1 { get { return accomImg1; } }
    public string getAccomImg2 { get { return accomImg2; } }
    public string getAccomImg3 { get { return accomImg3; } }

    //Use method in order to update accommodation status.
    protected void btnComplete_Click(object sender, EventArgs e)
    {
        sc.Open();
        SqlCommand UpdateStatus = new SqlCommand();
        UpdateStatus.Connection = sc; 
        UpdateStatus.CommandText = "UPDATE ACCOMMODATION SET Active = @ActiveS WHERE ACCOMMODATIONID = @ACID";
        UpdateStatus.Parameters.Add(new SqlParameter("@ACID", AccomID));
        UpdateStatus.Parameters.Add(new SqlParameter("@ActiveS", dropStatus.SelectedValue));
        UpdateStatus.ExecuteNonQuery();
        sc.Close();
        Response.Write("<script>alert('Update successfully completed!')</script>");
    }
}