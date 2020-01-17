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

public partial class tenantSurvey : System.Web.UI.Page
{
    SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    public static SqlCommand command;

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

    protected void Page_Load(object sender, EventArgs e)
    {
        if (CurrentSession.Current.userEmail == null)
        {
            Response.Redirect("Signin.aspx");
        }
        else
        {
            nameTopRight.Text = CurrentSession.Current.firstName + " " + CurrentSession.Current.lastName;
        }

        if (IsPostBack == false)
        {
            try
            {
                // Set Server Connection String and Try Connection
                SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

                sc.Open();
                command.Connection = sc;

                // MessageTextBox.Text = "Connected ! ";
                sc.Close();
            }

            catch (Exception)
            {
                // Return Error if Needed
                // MessageTextBox.Text = "Can not open DB connection ! ";
            }
        }
    }

    //Use emthod in order to insert values into Survey table.
    protected void btnComplete_Click(object sender, EventArgs e)
    {
        String surveyCity = HttpUtility.HtmlEncode(txtCity.Value);
        String surveyZip = HttpUtility.HtmlEncode(txtZip.Value);
        String maxPrice = HttpUtility.HtmlEncode(myRange.Value);
        String type = HttpUtility.HtmlEncode(dropRoomType.Value);
        //String startDate = HttpUtility.HtmlEncode(txtStartDate.Text);

        if (chkBath.Checked == true){bath = "y";} else{bath = "n";}
        if (chkLaundry.Checked == true){laundry = "y";} else{laundry = "n";}
        if (chkKitchen.Checked == true){kitchen = "y";} else{kitchen = "n";}
        if (chkLiving.Checked == true){living = "y";} else{living = "n";}
        if (chkLow.Checked == true){lowNoise = "y";} else{lowNoise = "n";}
        if (chkModerate.Checked == true){modNoise = "y";} else{modNoise = "n";}
        if (chkNoNoise.Checked == true){noNoise = "y";} else{noNoise = "n";}
        if (chkPet.Checked == true){pets = "y";} else{pets = "n";}
        if (chkWatch.Checked == true) {watch = "y";} else {watch = "n";}
        if (chkNonSmoke.Checked == true){nonSmoking = "y";} else{nonSmoking = "n";}
        if (chkSmoke.Checked == true){smokerFriendly = "y";} else{smokerFriendly = "n";}
        if (chkChores.Checked == true){chores = "y";} else{chores = "n";}

        sc.Open();

        System.Data.SqlClient.SqlCommand insertSurvey = new System.Data.SqlClient.SqlCommand();
        insertSurvey.Connection = sc;

        insertSurvey.CommandText = "INSERT INTO SURVEY VALUES(null, @tenantID, @bath, @laundry, @kitchen, @living, @lowNoise, @modNoise, @noNoise, @pets, @watch, @nonSmoke, @smokerFriendly, @chores, @type)";
        insertSurvey.Parameters.Add(new SqlParameter("@tenantID", CurrentSession.Current.tenantID));   
        insertSurvey.Parameters.Add(new SqlParameter("@type", type));
        insertSurvey.Parameters.Add(new SqlParameter("@bath", bath));
        insertSurvey.Parameters.Add(new SqlParameter("@laundry", laundry));
        insertSurvey.Parameters.Add(new SqlParameter("@kitchen", kitchen));
        insertSurvey.Parameters.Add(new SqlParameter("@living", living));
        insertSurvey.Parameters.Add(new SqlParameter("@lowNoise", lowNoise));
        insertSurvey.Parameters.Add(new SqlParameter("@modNoise", modNoise));
        insertSurvey.Parameters.Add(new SqlParameter("@noNoise", noNoise));
        insertSurvey.Parameters.Add(new SqlParameter("@pets", pets));
        insertSurvey.Parameters.Add(new SqlParameter("@watch", watch));
        insertSurvey.Parameters.Add(new SqlParameter("@nonSmoke", nonSmoking));
        insertSurvey.Parameters.Add(new SqlParameter("@smokerFriendly", smokerFriendly));
        insertSurvey.Parameters.Add(new SqlParameter("@chores", chores));
        insertSurvey.ExecuteNonQuery();

        sc.Close();
        Response.Redirect("tenantDash.aspx");

    }

}