using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
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

public partial class HostCreateList : System.Web.UI.Page
{
    SqlConnection sc1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    SqlConnection sc2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        //Redirects to login page if current user isn't logged in.
        if (CurrentSession.Current.huserEmail == null)
        {
            Response.Redirect("Signin.aspx");
        }
        else
        {
            nameTopRight.Text = CurrentSession.Current.hfirstName + " " + CurrentSession.Current.hlastName;
        }

    }

    //Use method in order to create a listing.
    protected void btnCompleteListing_Click(object sender, EventArgs e)
    {
        

        if (txtAddress.Text == "" || txtCity.Text == "" || txtZip.Text == "" || txtDesc.Text == "" || txtPrice.Text == ""){
            //Add error Label to enter required fields
        }
        else {
            DateTime lastUpdated = DateTime.Today;
            String bath;
            String laundry;
            String kitchen;
            String living;
            String lowNoise;
            String modNoise;
            String noNoise;
            String pets;
            String watch;
            String nonSmoking;
            String smokerFriendly;
            String chores;
            String address = HttpUtility.HtmlEncode(txtAddress.Text);
            String city = HttpUtility.HtmlEncode(txtCity.Text);
            String state = inputState.Value;
            String zip = HttpUtility.HtmlEncode(txtZip.Text);
            String neighborhood;
            FileUpload img1 = (FileUpload)imgUpload1;
            FileUpload img2 = (FileUpload)imgUpload2;
            FileUpload img3 = (FileUpload)imgUpload3;
            Byte[] imgByte1 = null;
            Byte[] imgByte2 = null;
            Byte[] imgByte3 = null;
            if (txtNeighborhood.Text == "")
            {
                neighborhood = "NULL";
            }
            else
            {
                neighborhood = HttpUtility.HtmlEncode(txtNeighborhood.Text);
            }        
            String description = HttpUtility.HtmlEncode(txtDesc.Text);
            String AccomName = HttpUtility.HtmlEncode(txtAccomName.Text);
            decimal price = decimal.Parse(HttpUtility.HtmlEncode(txtPrice.Text));
            String roomType = HttpUtility.HtmlEncode(roomTypeDrop.Value);
            if (chkBath.Checked == true) { bath = "y"; } else { bath = "n"; }
            if (chkLaundry.Checked == true) { laundry = "y"; } else { laundry = "n"; }
            if (chkKitchen.Checked == true) { kitchen = "y"; } else { kitchen = "n"; }
            if (chkLiving.Checked == true) { living = "y"; } else { living = "n"; }
            if (chkLow.Checked == true) { lowNoise = "y"; } else { lowNoise = "n"; }
            if (chkModerate.Checked == true) { modNoise = "y"; } else { modNoise = "n"; }
            if (chkNoNoise.Checked == true) { noNoise = "y"; } else { noNoise = "n"; }
            if (chkPet.Checked == true) { pets = "y"; } else { pets = "n"; }
            if (chkWatch.Checked == true) { watch = "y"; } else { watch = "n"; }
            if (chkNonSmoke.Checked == true) { nonSmoking = "y"; } else { nonSmoking = "n"; }
            if (chkSmoke.Checked == true) { smokerFriendly = "y"; } else { smokerFriendly = "n"; }
            if (chkChores.Checked == true) { chores = "y"; } else { chores = "n"; }
            sc1.Open();
            int hostID = CurrentSession.Current.hostID;
            Accommodation newAccom = new Accommodation(address, city, state, zip, price, roomType, neighborhood, description, hostID, AccomName);

            if (img1.HasFile && img1.PostedFile != null && img2.HasFile && img2.PostedFile != null && img3.HasFile && img3.PostedFile != null)
            {
                //To create a PostedFile
                HttpPostedFile File1 = imgUpload1.PostedFile;
                //Create byte Array with file len
                imgByte1 = new Byte[File1.ContentLength];
                //force the control to load data in array
                File1.InputStream.Read(imgByte1, 0, File1.ContentLength);

                //To create a PostedFile
                HttpPostedFile File2 = imgUpload2.PostedFile;
                //Create byte Array with file len
                imgByte2 = new Byte[File2.ContentLength];
                //force the control to load data in array
                File2.InputStream.Read(imgByte2, 0, File2.ContentLength);

                //To create a PostedFile
                HttpPostedFile File3 = imgUpload3.PostedFile;
                //Create byte Array with file len
                imgByte3 = new Byte[File3.ContentLength];
                //force the control to load data in array
                File3.InputStream.Read(imgByte3, 0, File3.ContentLength);


                //Insert accommodation
                System.Data.SqlClient.SqlCommand insertAccom = new System.Data.SqlClient.SqlCommand();
                insertAccom.Connection = sc1;
                insertAccom.CommandText = "INSERT INTO ACCOMMODATION VALUES(@hostID, @address, @city, @state, @zip, @price, @roomType, @neighborhood, @description, NULL, @img1, @img2, @img3, @AccomName, 'y', @lastUp)";
                insertAccom.Parameters.Add(new SqlParameter("@address", newAccom.getAddress()));
                insertAccom.Parameters.Add(new SqlParameter("@city", newAccom.getAccomCity()));
                insertAccom.Parameters.Add(new SqlParameter("@state", newAccom.getAccomState()));
                insertAccom.Parameters.Add(new SqlParameter("@zip", newAccom.getAccomZip()));
                insertAccom.Parameters.Add(new SqlParameter("@price", newAccom.getAccomPrice()));
                insertAccom.Parameters.Add(new SqlParameter("@roomType", newAccom.getAccomRoomType()));
                insertAccom.Parameters.Add(new SqlParameter("@neighborhood", newAccom.getAccomNeighborhood()));
                insertAccom.Parameters.Add(new SqlParameter("@description", newAccom.getAccomDescription()));
                insertAccom.Parameters.Add(new SqlParameter("@hostID", newAccom.getAccomHostID()));
                insertAccom.Parameters.Add(new SqlParameter("@img1", imgByte1));
                insertAccom.Parameters.Add(new SqlParameter("@img2", imgByte2));
                insertAccom.Parameters.Add(new SqlParameter("@img3", imgByte3));
                insertAccom.Parameters.Add(new SqlParameter("@AccomName", newAccom.getAccomName()));
                insertAccom.Parameters.Add(new SqlParameter("@lastUp", lastUpdated));
                insertAccom.ExecuteNonQuery();
                sc1.Close();
                //Get accommodationID
                int accomID = returnAccomIDFromDB(newAccom);
                //Insert survey
                Survey newSurvey = new Survey(bath, laundry, kitchen, living, lowNoise, modNoise, noNoise, pets, watch, nonSmoking, smokerFriendly, chores, accomID);
                sc2.Open();
                SqlCommand insertSurvey = new SqlCommand();
                insertSurvey.Connection = sc2;
                insertSurvey.CommandText = "INSERT INTO SURVEY VALUES(@accomID, NULL, @bath, @laundry, @kitchen, @living, @lowNoise, @modNoise, @noNoise, @pets, @watch, @nonSmoking, @smokerFriendly, @chores, @roomType)";
                insertSurvey.Parameters.Add(new SqlParameter("@accomID", newSurvey.getAccomID()));
                insertSurvey.Parameters.Add(new SqlParameter("@roomType", newAccom.getAccomRoomType()));
                insertSurvey.Parameters.Add(new SqlParameter("@bath", newSurvey.getBath()));
                insertSurvey.Parameters.Add(new SqlParameter("@laundry", newSurvey.getLaundry()));
                insertSurvey.Parameters.Add(new SqlParameter("@kitchen", newSurvey.getKitchen()));
                insertSurvey.Parameters.Add(new SqlParameter("@living", newSurvey.getLiving()));
                insertSurvey.Parameters.Add(new SqlParameter("@lowNoise", newSurvey.getLowNoise()));
                insertSurvey.Parameters.Add(new SqlParameter("@modNoise", newSurvey.getModNoise()));
                insertSurvey.Parameters.Add(new SqlParameter("@noNoise", newSurvey.getNoNoise()));
                insertSurvey.Parameters.Add(new SqlParameter("@pets", newSurvey.getPets()));
                insertSurvey.Parameters.Add(new SqlParameter("@watch", newSurvey.getWatch()));
                insertSurvey.Parameters.Add(new SqlParameter("@nonSmoking", newSurvey.getNonSmoking()));
                insertSurvey.Parameters.Add(new SqlParameter("@smokerFriendly", newSurvey.getSmokerFriendly()));
                insertSurvey.Parameters.Add(new SqlParameter("@chores", newSurvey.getChores()));
                insertSurvey.ExecuteNonQuery();
                sc2.Close();

                Response.Redirect("HostListing.aspx");
            }
            else
            {
                lblAccomPic.ForeColor = Color.Red;
                lblAccomPic.Text = "*Please upload three images";
                lblAccomPic.Visible = true;
            }

        }

    }


    //Use method in order to select the accommodationID from the Accommodation table.
    public int returnAccomIDFromDB(Accommodation newAccom){
        int accomID;
        try
        {
            sc1.Open();

            System.Data.SqlClient.SqlCommand getAccomID = new System.Data.SqlClient.SqlCommand();
            getAccomID.Connection = sc1;
            getAccomID.CommandText = "SELECT AccommodationID FROM ACCOMMODATION WHERE HostID=@hostID AND Street=@address AND CityCo=@city AND AccomState=@state AND Zip=@zip AND Price=@price AND RoomType=@roomType AND Neighborhood=@neighborhood AND Description=@description";
            getAccomID.Parameters.Add(new SqlParameter("@address", newAccom.getAddress()));
            getAccomID.Parameters.Add(new SqlParameter("@city", newAccom.getAccomCity()));
            getAccomID.Parameters.Add(new SqlParameter("@state", newAccom.getAccomState()));
            getAccomID.Parameters.Add(new SqlParameter("@zip", newAccom.getAccomZip()));
            getAccomID.Parameters.Add(new SqlParameter("@price", newAccom.getAccomPrice()));
            getAccomID.Parameters.Add(new SqlParameter("@roomType", newAccom.getAccomRoomType()));
            getAccomID.Parameters.Add(new SqlParameter("@neighborhood", newAccom.getAccomNeighborhood()));
            getAccomID.Parameters.Add(new SqlParameter("@description", newAccom.getAccomDescription()));
            getAccomID.Parameters.Add(new SqlParameter("@hostID", newAccom.getAccomHostID()));
            getAccomID.ExecuteNonQuery();
            accomID = Convert.ToInt32(getAccomID.ExecuteScalar());
            sc1.Close();
            return accomID;

        }
        catch
        {
            return 0;
        }

    }

}