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


public partial class AdminSignin : System.Web.UI.Page
{
    SqlConnection sc1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    public static SqlCommand command;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            Session.Contents.RemoveAll();
            try
            {
                // Set Server Connection String and Try Connection
                SqlConnection sc1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

                sc1.Open();
                command.Connection = sc1;

                // MessageTextBox.Text = "Connected ! ";

                sc1.Close();
            }

            catch (Exception)
            {
                // Return Error if Needed
                // MessageTextBox.Text = "Can not open DB connection ! ";
            }
        }
        else
        {

        }
    }


    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        bool validate = true;
        String adminUser = HttpUtility.HtmlEncode(txtAdminUser.Value);
        String adminPass = HttpUtility.HtmlEncode(txtAdminPass.Value);
        System.Data.SqlClient.SqlCommand adminLogin = new System.Data.SqlClient.SqlCommand();
        adminLogin.Connection = sc1;
        sc1.Open();
        adminLogin.CommandText = "SELECT * FROM ADMINACC WHERE Username = upper(@AdminUser)";
        adminLogin.Parameters.Add(new SqlParameter("@AdminUser", adminUser));
        System.Data.SqlClient.SqlDataReader adminReader = adminLogin.ExecuteReader();

        if (adminReader.HasRows) // if the username exists, it will continue
        {
            while (adminReader.Read()) // this will read the single record that matches the entered username
            {

                String firstname = adminReader["firstname"].ToString();
                CurrentSession.Current.userEmail = adminUser;
                String adminPasstxt = adminReader["password"].ToString();

                if (PasswordHash.ValidatePassword(txtAdminPass.Value, adminPasstxt)) // if the entered password matches what is stored, it will show success
                {
                    CurrentSession.Current.AdminUser = adminUser;

                    Response.Write("<script>alert('Success!')</script>");

                    Response.Redirect("admin.aspx");
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", " alert('Sign in failed! Wrong password.');", true);
                    validate = false;

                }

            }
            sc1.Close();
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", " alert('Admin user doesn't exist.');", true);
        }

    }
}