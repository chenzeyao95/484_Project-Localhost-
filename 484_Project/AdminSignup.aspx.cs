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

public partial class AdminSignup : System.Web.UI.Page
{
    SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    public static SqlCommand command;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //Use method to create and validate Admin account.
    protected void BtnSignUp_Click(object sender, EventArgs e)
    {
        bool validate;
        //check if the Admin is already existing
        sc.Open();

        System.Data.SqlClient.SqlCommand readAdmin = new System.Data.SqlClient.SqlCommand();
        readAdmin.Connection = sc;

        readAdmin.CommandText = "SELECT AdminID FROM ADMINACC WHERE AdminID = @ID;";
        readAdmin.Parameters.Add(new SqlParameter("@ID", txtAdminID.Value));

        System.Data.SqlClient.SqlDataReader reader = readAdmin.ExecuteReader();

        if (reader.HasRows)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", " alert('This admin ID is already exist.');", true);
            validate = false;
        }
        else
        {
            validate = true;
        }
        sc.Close();

        if (validate == true)
        {
            //check if the UserName is already existing
            sc.Open();

            System.Data.SqlClient.SqlCommand readAdminN = new System.Data.SqlClient.SqlCommand();
            readAdminN.Connection = sc;

            readAdminN.CommandText = "SELECT AdminID FROM ADMINACC WHERE upper(Username) = upper(@N);";
            readAdminN.Parameters.Add(new SqlParameter("@N", txtAdminUser.Value));

            System.Data.SqlClient.SqlDataReader reader2 = readAdminN.ExecuteReader();

            if (reader2.HasRows)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", " alert('This Username is already existed.');", true);
                validate = false;
            }
            else
            {
                validate = true;
            }
            sc.Close();
        }

        if (validate == true)
        {
            sc.Open();
            int ID = Int32.Parse(HttpUtility.HtmlEncode(txtAdminID.Value));
            String FN = HttpUtility.HtmlEncode(txtFN.Value);
            String LN = HttpUtility.HtmlEncode(txtLN.Value);
            String user = HttpUtility.HtmlEncode(txtAdminUser.Value);
            String pass = HttpUtility.HtmlEncode(txtAdminPass.Value);

            AdminAcc newAdmin = new AdminAcc(ID, FN, LN, user, pass);

            System.Data.SqlClient.SqlCommand insertAdmin = new System.Data.SqlClient.SqlCommand();
            insertAdmin.Connection = sc;

            insertAdmin.CommandText = "INSERT INTO ADMINACC VALUES(@ID, @First, @Last, @user, @Pass)";
            insertAdmin.Parameters.Add(new SqlParameter("@ID", newAdmin.getAdminID()));
            insertAdmin.Parameters.Add(new SqlParameter("@First", newAdmin.getAdminFirst()));
            insertAdmin.Parameters.Add(new SqlParameter("@Last", newAdmin.getAdminLast()));
            insertAdmin.Parameters.Add(new SqlParameter("@user", newAdmin.getAdminUser()));
            insertAdmin.Parameters.Add(new SqlParameter("@Pass", PasswordHash.HashPassword(pass)));
            insertAdmin.ExecuteNonQuery();
            sc.Close();

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", " alert('Successfully Signed Up!');", true);
        }

    }
}