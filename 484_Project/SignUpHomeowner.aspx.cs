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

public partial class SignUpHomeowner : System.Web.UI.Page
{
    SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    public static SqlCommand command;

    protected void Page_Load(object sender, EventArgs e)
    {
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
        else
        {
            lblHomeBDNo.Text = "";
            lblHomeBDNo.Visible = true;
            lblHomeEmailFormat.Text = "";
            lblHomeEmailFormat.Visible = true;
            lblHomeEmailNo.Text = "";
            lblHomeEmailNo.Visible = true;
        }
    }

    //Use method to validate the age and make sure it is in acceptable range.
    public static int getAge(String inputDate)
    {
        int age;
        int month = int.Parse(inputDate.Substring(5, 2));
        int day = int.Parse(inputDate.Substring(8, 2));
        int year = int.Parse(inputDate.Substring(0, 4));
        DateTime now = DateTime.Now;
        int nowDay = int.Parse(now.ToString("dd"));
        int nowMonth = int.Parse(now.ToString("MM"));
        int nowYear = int.Parse(now.ToString("yyyy"));
        age = nowYear - year;
        if (nowMonth < month)
        {
            age -= 1;
        }
        else if (nowMonth == month && nowDay < day)
        {
            age -= 1;
        }
        if (nowMonth == month && nowDay == day)
        {
            return age;
        }
        return age;
    }

    //Use method in order to clear all textboxes.
    protected void BtnHomeOwnerClear_Click(object sender, EventArgs e)
    {
        txtEmail.Value = "";
        txtPassword.Value = "";
        txtFName.Value = "";
        txtLName.Value = "";
        inputAddress.Value = "";
        inputCity.Value = "";
        txtZip.Value = "";
        txtHomePhone.Value = "";
        birthDate.Value = "";
        inputState.SelectedIndex = -1;
        lblHomeBDNo.Text = "";
        lblHomeEmailFormat.Text = "";
        lblHomeEmailNo.Text = "";
        lblHomeBDNo.Visible = false;
        lblHomeEmailFormat.Visible = false;
        lblHomeEmailNo.Visible = false;
        lblUpPic.Visible = false;
    }

    //Use method in order to populate homeowner information.
    protected void BtnHomeOwnerPop_Click(object sender, EventArgs e)
    {
        inputAddress.Value = "123 Main St.";
        txtFName.Value = "Ron";
        txtLName.Value = "Swanson";
        txtPassword.Value = "123abc";
        txtEmail.Value = "Ron478@aol.com";
        txtHomePhone.Value = "5406673100";
        inputCity.Value = "Sterling";
        inputState.Value = "VA";
        txtZip.Value = "22030";
        birthDate.Value = "04/05/1962";
    }        

    //Use method in order to validate user information.
    protected void btnSignUpHomeOwner_Click(object sender, EventArgs e)
    {
        int age = getAge(birthDate.Value);
        bool validate;

        //check if the Host is already existing
        sc.Open();

        System.Data.SqlClient.SqlCommand readHost = new System.Data.SqlClient.SqlCommand();
        readHost.Connection = sc;

        readHost.CommandText = "SELECT HostEmail FROM Homeowner WHERE HostEmail = upper(@HostEmail);";
        readHost.Parameters.Add(new SqlParameter("@HostEmail", txtEmail.Value));

        System.Data.SqlClient.SqlDataReader reader = readHost.ExecuteReader();

        if (reader.HasRows)
        {
            lblHomeEmailNo.ForeColor = Color.Red;
            lblHomeEmailNo.Text = "*A Host account already exists for this email.";
            lblHomeEmailNo.Visible = true;
            validate = false;
        }
        else
        {
            validate = true;
        }
        sc.Close();

        //---------------------------
        if (validate == true)
        {
            //cheak if tenant age greater than 18
            if (age >= 18)
            {
                validate = true;

                sc.Open();
                String email = HttpUtility.HtmlEncode(txtEmail.Value);
                String phone = HttpUtility.HtmlEncode(txtHomePhone.Value);
                String firstName = HttpUtility.HtmlEncode(txtFName.Value);
                String lastName = HttpUtility.HtmlEncode(txtLName.Value);
                DateTime dob = Convert.ToDateTime(HttpUtility.HtmlEncode(birthDate.Value));
                String password = HttpUtility.HtmlEncode(txtPassword.Value);
                DateTime lastUpdated = DateTime.Today;
                String zip = HttpUtility.HtmlEncode(txtZip.Value);
                String state = inputState.Value;
                String address = HttpUtility.HtmlEncode(inputAddress.Value);
                String cityCo = HttpUtility.HtmlEncode(inputCity.Value);

                Homeowner newHomeowner = new Homeowner(firstName, lastName, email, phone, address, cityCo, state, password, dob, zip, lastUpdated);
                FileUpload img = (FileUpload)imgUpload;
                Byte[] imgByte = null;
                if (img.HasFile && img.PostedFile != null)
                {
                    //To create a PostedFile
                    HttpPostedFile File = imgUpload.PostedFile;
                    //Create byte Array with file len
                    imgByte = new Byte[File.ContentLength];
                    //force the control to load data in array
                    File.InputStream.Read(imgByte, 0, File.ContentLength);


                    // Create new Insert Command
                    System.Data.SqlClient.SqlCommand insertHomeOwner = new System.Data.SqlClient.SqlCommand();
                    insertHomeOwner.Connection = sc;

                    insertHomeOwner.CommandText = "INSERT INTO HOMEOWNER VALUES(@First, @Last, @Email, @Phone, @Pass, @Street, @CityCo,@State, @Zip, @Dob, @LU, @hImage, null, 'Y')";
                    insertHomeOwner.Parameters.Add(new SqlParameter("@First", newHomeowner.getHostFirstName()));
                    insertHomeOwner.Parameters.Add(new SqlParameter("@Last", newHomeowner.getHostLastName()));
                    insertHomeOwner.Parameters.Add(new SqlParameter("@Email", newHomeowner.getHostEmail()));
                    insertHomeOwner.Parameters.Add(new SqlParameter("@Phone", newHomeowner.getHostphoneNum()));
                    insertHomeOwner.Parameters.Add(new SqlParameter("@Pass", PasswordHash.HashPassword(password))); // Password hash
                    insertHomeOwner.Parameters.Add(new SqlParameter("@Street", newHomeowner.getAddress()));
                    insertHomeOwner.Parameters.Add(new SqlParameter("@CityCo", newHomeowner.getHostcityCo()));
                    insertHomeOwner.Parameters.Add(new SqlParameter("@State", newHomeowner.getHoststate()));
                    insertHomeOwner.Parameters.Add(new SqlParameter("@Zip", newHomeowner.getZip()));
                    insertHomeOwner.Parameters.Add(new SqlParameter("@Dob", newHomeowner.getHomeDOB()));
                    insertHomeOwner.Parameters.Add(new SqlParameter("@LU", lastUpdated));
                    insertHomeOwner.Parameters.Add(new SqlParameter("@hImage", imgByte));
                    insertHomeOwner.ExecuteNonQuery();

                    sc.Close();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                    txtEmail.Value = "";
                    txtPassword.Value = "";
                    txtFName.Value = "";
                    txtLName.Value = "";
                    inputAddress.Value = "";
                    inputCity.Value = "";
                    txtZip.Value = "";
                    txtHomePhone.Value = "";
                    birthDate.Value = "";
                    inputState.SelectedIndex = -1;
                    lblHomeBDNo.Text = "";
                    lblHomeEmailFormat.Text = "";
                    lblHomeEmailNo.Text = "";
                    lblHomeBDNo.Visible = false;
                    lblHomeEmailFormat.Visible = false;
                    lblHomeEmailNo.Visible = false;
                    lblUpPic.Visible = false;
                }
                else
                {
                    lblUpPic.ForeColor = Color.Red;
                    lblUpPic.Text = "*Homeowner must upload a profile photo";
                    lblUpPic.Visible = true;
                    validate = false;
                }
            }
            else
            {
                lblHomeBDNo.ForeColor = Color.Red;
                lblHomeBDNo.Text = "*Homeowner must be 18 years old or above";
                lblHomeBDNo.Visible = true;
                validate = false;
            }
        }            
    }

    protected void btnGoSignin_Click(object sender, EventArgs e)
    {
        Response.Redirect("Signin.aspx");
    }

}