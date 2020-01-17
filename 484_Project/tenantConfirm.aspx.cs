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

public partial class tenantConfirm : System.Web.UI.Page
{
    int PreConID;
    int AccomID;
    SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    String accomImg1;
    String accomImg2;
    String accomImg3;
    String strCity = "";
    String strType = "";
    int hostID;
    String neigb;
    String accomName;
    String street;
    String city;
    String state;
    String zip;
    double price;
    String type;
    Byte[] tImage;
    Byte[] image1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (CurrentSession.Current.userEmail == null)
        {
            Response.Redirect("Signin.aspx");
        }
        else
        {
            PreConID = Convert.ToInt32(Request.QueryString["id"]);

            sc.Open();
            SqlCommand getAccomID = new SqlCommand();
            getAccomID.Connection = sc;
            getAccomID.CommandText = "Select HostID, AccommodationID FROM PRECONFIRMATION WHERE PreConID=@PreConID and TenantID=@TenID";
            getAccomID.Parameters.Add(new SqlParameter("@PreConID", PreConID));
            getAccomID.Parameters.Add(new SqlParameter("@TenID", CurrentSession.Current.tenantID));
            SqlDataReader readAccomID = getAccomID.ExecuteReader();
            while (readAccomID.Read())
            {
               hostID = readAccomID.GetInt32(0);
               AccomID = readAccomID.GetInt32(1);
            }
            readAccomID.Close();


            SqlCommand getAccom = new SqlCommand();
            getAccom.Connection = sc;
            getAccom.CommandText = "SELECT Street, CityCo, AccomState, Zip, CONVERT(Decimal(10,2), Price) as Price, RoomType, Neighborhood, Description, Image1, Image2, Image3, HostID, AccomName FROM ACCOMMODATION WHERE AccommodationID=@AccomID;";
            getAccom.Parameters.Add(new SqlParameter("@AccomID", AccomID));
            SqlDataReader AccomReader = getAccom.ExecuteReader();
            while (AccomReader.Read())
            {
                strCity += AccomReader.GetString(1);
                lblcity.Text = strCity;
                lblState.Text = AccomReader.GetString(2);
                lblZip.Text = AccomReader.GetString(3);
                lblPrice.Text = "$" + AccomReader.GetDecimal(4) + " /Month";
                strType += AccomReader.GetString(5);
                lblRoomType.Text = strType;
                neigb = AccomReader.GetString(6);
                if (neigb == "NULL") { lblNeigb.Text = "(N/A)"; } else { lblNeigb.Text = neigb; }
                txtDes.Value = AccomReader.GetString(7);
                accomImg1 = String.Concat("data:image/jpg;base64,", Convert.ToBase64String((byte[])AccomReader["Image1"]));
                accomImg2 = String.Concat("data:image/jpg;base64,", Convert.ToBase64String((byte[])AccomReader["Image2"]));
                accomImg3 = String.Concat("data:image/jpg;base64,", Convert.ToBase64String((byte[])AccomReader["Image3"]));
                hostID = AccomReader.GetInt32(11);
                lblDetail.Text = AccomReader.GetString(12);

            }
            AccomReader.Close();

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
            getSurReader.Close();


            sc.Close();
        }
    }

    public string getAccomImg1 { get { return accomImg1; } }
    public string getAccomImg2 { get { return accomImg2; } }
    public string getAccomImg3 { get { return accomImg3; } }

    protected void ContactBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("tenantDialog.aspx?id=" + hostID);
    }

    //Use method in order to make sure both tenant/homeowner background checks are complete.
    protected void AcceptLeaseBtn_Click(object sender, EventArgs e)
    {
        sc.Open();
        SqlCommand getBG = new SqlCommand();
        getBG.Connection = sc;
        getBG.CommandText = "Select Upper(BackGround) FROM TENANT WHERE TenantID=@TenID";
        getBG.Parameters.Add(new SqlParameter("@TenID", CurrentSession.Current.tenantID));
        String bgCheck = getBG.ExecuteScalar().ToString();

        if (bgCheck == "Y")
        {
            Response.Redirect("tIntentToLease.aspx?id=" + PreConID);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('You have not yet cleared a background screening. You cannot confirm a lease agreement until approved.'); window.open('tenantDash.aspx');", true);
        }
        
    }

    
}