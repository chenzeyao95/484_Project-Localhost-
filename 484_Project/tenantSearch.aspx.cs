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

public partial class tenantSearch : System.Web.UI.Page
{
    SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    public bool isPostBack;
    public static String accomCity;
    int hostID;
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

        if (isPostBack == false)
        {
            ListView1.Visible = false;
        }
    }

    //Use method in order to get longitude/latitude values from DB.
    protected void btnZipSearch_Click(object sender, EventArgs e)
    {
        String zipSearch = HttpUtility.HtmlEncode(txtZipSearch.Value);
        double latitude;
        double longitude;
        sc.Open();
        SqlCommand getZip = new SqlCommand();
        getZip.Connection = sc;
        getZip.CommandText = "SELECT Lat, Long FROM ZipCodes WHERE Zipcode=@zip";
        getZip.Parameters.Add(new SqlParameter("@zip", zipSearch));
        SqlDataReader latFromZip = getZip.ExecuteReader();
        if (latFromZip.HasRows)
        { 
            while (latFromZip.Read())
            {
                latitude = latFromZip.GetDouble(0);
                longitude = latFromZip.GetDouble(1);
                CurrentSession.Current.latSearch = latitude;
                CurrentSession.Current.longSearch = longitude;
            }
        }
        else
        {

        }
        latFromZip.Close();
        latFromZip.Dispose();
        sc.Close();

        SqlDataAdapter one = new SqlDataAdapter("SELECT Image1, RoomType, CityCo, AccomName, CONVERT(Decimal(10,2), Price) as Price, AccommodationID, AccomState FROM ACCOMMODATION WHERE Zip=@zip and upper(Active)='Y'", sc);
        one.SelectCommand.Parameters.Add(new SqlParameter("@zip", zipSearch));
        DataTable dt = new DataTable();
        one.Fill(dt);
        ListView1.DataSource = dt;
        ListView1.DataBind();
        ListView1.Visible = true;
        //Change google API values to latitude and longitude 
    }

    //Use method to check to see if listing is already in favorites.
    protected void Interest_ServerClick(object sender, CommandEventArgs e)
    {
        bool validate;

        sc.Open();
        SqlCommand findExist = new SqlCommand();
        findExist.Connection = sc;
        findExist.CommandText = "Select FavorID from FAVOR where TenantID=@TenID and AccommodationID=@AccomID;";
        findExist.Parameters.Add(new SqlParameter("@TenID", CurrentSession.Current.tenantID));
        findExist.Parameters.Add(new SqlParameter("@AccomID", e.CommandArgument));
        SqlDataReader getfind = findExist.ExecuteReader();
        if (getfind.HasRows)
        {
            validate = false;
            Response.Write("<script>alert('This space is already in your favorite.')</script>");
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
            findAccomInfo.Parameters.Add(new SqlParameter("@accomID", e.CommandArgument));
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
            insertFav.Parameters.Add(new SqlParameter("@accomID", e.CommandArgument));
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
            Response.Write("<script>alert('This space is saved in your favorite.')</script>");
        }

        sc.Close();
        
    }

    protected void SeeDetailsBtn_Command(object sender, CommandEventArgs e)
    {
        //Response.Write("<script>window.open ('tenantAccomInfo.aspx?id=" + e.CommandArgument + "','_blank');</script>");
        Response.Redirect("tenantAccomInfo.aspx?id=" + e.CommandArgument);

    }

    //Use method in order to match location based on long/lat values.
    protected void btnCitySearch_Click(object sender, EventArgs e)
    {
        String citySearch = HttpUtility.HtmlEncode(txtCitySearch.Value);
        double latitude;
        double longitude;
        sc.Open();
        SqlCommand getCity = new SqlCommand();
        getCity.Connection = sc;
        getCity.CommandText = "SELECT Lat, Long FROM ZipCodes WHERE upper(City)=upper(@city)";
        getCity.Parameters.Add(new SqlParameter("@city", citySearch));
        SqlDataReader latFromCity = getCity.ExecuteReader();

        if (latFromCity.HasRows)
        {
            while (latFromCity.Read())
            {
                //Find out way to only get first row 
                latitude = latFromCity.GetDouble(0);
                longitude = latFromCity.GetDouble(1);
                CurrentSession.Current.latSearch = latitude;
                CurrentSession.Current.longSearch = longitude;
            }
            latFromCity.Close();
            latFromCity.Dispose();
            sc.Close();
        }
        else
        {
            
        }

        sc.Close();
        int zip = getZipFromCity(citySearch);
        SqlDataAdapter one = new SqlDataAdapter("SELECT Image1, RoomType, CityCo, AccomName, CONVERT(Decimal(10,2), Price) as Price, AccommodationID, AccomState FROM ACCOMMODATION Where Zip=@zip and UPPER(Active) ='Y'", sc);
        one.SelectCommand.Parameters.Add(new SqlParameter("@zip", zip));
        DataTable dt = new DataTable();
        one.Fill(dt);
        ListView1.DataSource = dt;
        ListView1.DataBind();
        ListView1.Visible = true;
    }

    //Use method to retrieve zip code from Accommodation table.
    public int getZipFromCity(String citySearch) {
        int zip;
        try
            {
               sc.Open();

               System.Data.SqlClient.SqlCommand getZip = new System.Data.SqlClient.SqlCommand();
               getZip.Connection = sc;
               getZip.CommandText = "SELECT Zip FROM ACCOMMODATION WHERE upper(CityCo)=upper(@city)";
               getZip.Parameters.Add(new SqlParameter("@city", citySearch));
               getZip.ExecuteNonQuery();
               zip = Convert.ToInt32(getZip.ExecuteScalar());
               sc.Close();
               return zip;

            }
        catch
            {
                return 0;
            }
    }

    public string getHostNameFromDB(int hostID) {
        String returnName = "";
        String firstName = "";
        String lastName = "";

        try
        {
            sc.Open();
            System.Data.SqlClient.SqlCommand getHostName = new System.Data.SqlClient.SqlCommand();
            getHostName.Connection = sc;
            getHostName.CommandText = "SELECT HostFirstName, HostLastName FROM HOMEOWNER WHERE HostID = @hostID";
            getHostName.Parameters.Add(new SqlParameter("@hostID", hostID));
            SqlDataReader readName = getHostName.ExecuteReader();
            while (readName.Read())
            {
                firstName = readName.GetString(0);
                lastName = readName.GetString(1);
            }
            readName.Close();
            readName.Dispose();
            sc.Close();
            returnName = firstName + " " + lastName;
            return returnName;

        }
        catch (Exception e)
        {
            return e.ToString();
        }
    }

}