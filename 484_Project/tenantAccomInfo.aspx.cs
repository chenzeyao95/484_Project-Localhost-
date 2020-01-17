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

public partial class TenantAccomInfo : System.Web.UI.Page
{
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
            AccomID = Convert.ToInt32(Request.QueryString["id"]);

            sc.Open();
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

            SqlDataAdapter getReview = new SqlDataAdapter("SELECT TenFName, TenLName, ReviewDate, ReviewStars, ReviewText FROM REVIEW WHERE AccommodationID=@AccomID", sc);
            getReview.SelectCommand.Parameters.Add(new SqlParameter("@AccomID", AccomID));
            DataTable dt = new DataTable();
            getReview.Fill(dt);
            ListView1.DataSource = dt;
            ListView1.DataBind();
        }
    }
    public string getAccomImg1{ get { return accomImg1; } }
    public string getAccomImg2{ get { return accomImg2; } }
    public string getAccomImg3{ get { return accomImg3; } }

    protected void ContactBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("tenantDialog.aspx?id=" + hostID);
    }

    //Use method in order to add listing to favorites tab.
    protected void AddToFavorBtn_Click(object sender, EventArgs e)
    {
        bool validate;

        sc.Open();
        SqlCommand findExist = new SqlCommand();
        findExist.Connection = sc;
        findExist.CommandText = "Select FavorID from FAVOR where TenantID=@TenID and AccommodationID=@AccomID;";
        findExist.Parameters.Add(new SqlParameter("@TenID", CurrentSession.Current.tenantID));
        findExist.Parameters.Add(new SqlParameter("@AccomID", AccomID));
        SqlDataReader getfind = findExist.ExecuteReader();
        if (getfind.HasRows)
        {
            validate = false;
            Response.Write("<script>alert('This accommodation is already in your favorite.')</script>");
        }
        else
        {
            validate = true;
        }
        getfind.Close();

        if (validate == true)
        {
            SqlCommand findAccomInfo = new SqlCommand();
            findAccomInfo.Connection = sc;
            findAccomInfo.CommandText = "Select HostID, Street, Zip, CityCo, AccomState, Price, RoomType, Image1 from Accommodation where AccommodationID = @accomID";
            findAccomInfo.Parameters.Add(new SqlParameter("@accomID", AccomID));
            SqlDataReader getAccomReader = findAccomInfo.ExecuteReader();
            while (getAccomReader.Read())
            {
                hostID = getAccomReader.GetInt32(0);
                street = getAccomReader.GetString(1);
                zip = getAccomReader.GetString(2);
                city = getAccomReader.GetString(3);
                state = getAccomReader.GetString(4);
                price = Convert.ToDouble(getAccomReader["Price"]);
                type = getAccomReader.GetString(6);
                image1 = (byte[])getAccomReader["Image1"];

            }
            getAccomReader.Close();
            getAccomReader.Dispose();

            SqlCommand getTenPic = new SqlCommand();
            getTenPic.Connection = sc;
            getTenPic.CommandText = "Select tenImage from Tenant where TenantID=@TenID";
            getTenPic.Parameters.Add(new SqlParameter("@TenID", CurrentSession.Current.tenantID));
            SqlDataReader getPicReader = getTenPic.ExecuteReader();
            while (getPicReader.Read())
            {
                tImage = ((byte[])getPicReader["tenImage"]);
            }
            getPicReader.Close();
            getPicReader.Dispose();

            SqlCommand insertFav = new SqlCommand();
            insertFav.Connection = sc;
            insertFav.CommandText = "INSERT INTO FAVOR VALUES(@tenantID,@tenantFN,@tenantLN,@tenantType,@tenImage,@accomID,@hostID,@street,@city,@state,@zip,@price,@roomType,@accomImage)";
            insertFav.Parameters.Add(new SqlParameter("@tenantID", CurrentSession.Current.tenantID));
            insertFav.Parameters.Add(new SqlParameter("@tenantFN", CurrentSession.Current.firstName));
            insertFav.Parameters.Add(new SqlParameter("@tenantLN", CurrentSession.Current.lastName));
            insertFav.Parameters.Add(new SqlParameter("@tenantType", CurrentSession.Current.tenantType));
            insertFav.Parameters.Add(new SqlParameter("@tenImage", tImage));
            insertFav.Parameters.Add(new SqlParameter("@accomID", AccomID));
            insertFav.Parameters.Add(new SqlParameter("@hostID", hostID));
            insertFav.Parameters.Add(new SqlParameter("@street", street));
            insertFav.Parameters.Add(new SqlParameter("@city", city));
            insertFav.Parameters.Add(new SqlParameter("@state", state));
            insertFav.Parameters.Add(new SqlParameter("@zip", zip));
            insertFav.Parameters.Add(new SqlParameter("@price", price));
            insertFav.Parameters.Add(new SqlParameter("@roomType", type));
            insertFav.Parameters.Add(new SqlParameter("@accomImage", image1));
            insertFav.ExecuteNonQuery();

            sc.Close();

            Response.Redirect("tenantSpace.aspx");
        }

        sc.Close();
    }
}