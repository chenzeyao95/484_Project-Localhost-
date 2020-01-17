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

public partial class SignUpTenant : System.Web.UI.Page
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
            lblTenBDNo.Text = "";
            lblTenEmailNo.Text = "";
            lblEmailFormat.Text = "";
            lblTenEmailNo.Visible = false;
            lblTenBDNo.Visible = false;
            lblEmailFormat.Visible = false;
        }
    }

    //Use method to make sure age is in acceptable range.
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

    //Use method in order to validate user entered information.
    protected void BtnTenSingUp_Click(object sender, EventArgs e)
    {
        int age = getAge(txtTenBD.Value);
        bool validate;

        //check if the tenant is already exist
        sc.Open();

        System.Data.SqlClient.SqlCommand readTenant = new System.Data.SqlClient.SqlCommand();
        readTenant.Connection = sc;

        readTenant.CommandText = "SELECT TenantEmail FROM TENANT WHERE TenantEmail = upper(@TenEmail);";
        readTenant.Parameters.Add(new SqlParameter("@TenEmail", txtTenEmail.Value));
        System.Data.SqlClient.SqlDataReader reader = readTenant.ExecuteReader();

        if (reader.HasRows)
        {
            lblTenEmailNo.ForeColor = Color.Red;
            lblTenEmailNo.Text = "*An account already exists for this email.";
            lblTenEmailNo.Visible = true;
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
                String email = HttpUtility.HtmlEncode(txtTenEmail.Value);
                String phone = HttpUtility.HtmlEncode(txtTenPhone.Value);
                String firstName = HttpUtility.HtmlEncode(txtTenFN.Value);
                String lastName = HttpUtility.HtmlEncode(txtTenLN.Value);
                DateTime dob = Convert.ToDateTime(HttpUtility.HtmlEncode(txtTenBD.Value));
                String password = HttpUtility.HtmlEncode(txtTenPass.Value);
                String tenType = dropTenType.Value;
                DateTime lastUpdated = DateTime.Today;
                Tenant newTenant = new Tenant(email, phone, firstName, lastName, dob, password, tenType, lastUpdated);
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
                    System.Data.SqlClient.SqlCommand insertTenant = new System.Data.SqlClient.SqlCommand();
                    insertTenant.Connection = sc;

                    insertTenant.CommandText = "INSERT INTO TENANT VALUES(@Email, @Phone, @First, @Last, @DOB, @Pass, @TenType, @LU, @tenImage, null, 'Y')";
                    insertTenant.Parameters.Add(new SqlParameter("@Email", newTenant.getEmail()));
                    insertTenant.Parameters.Add(new SqlParameter("@Phone", newTenant.getPhone()));
                    insertTenant.Parameters.Add(new SqlParameter("@First", newTenant.getFirstName()));
                    insertTenant.Parameters.Add(new SqlParameter("@Last", newTenant.getLastName()));
                    insertTenant.Parameters.Add(new SqlParameter("@DOB", newTenant.getBirthDate()));
                    insertTenant.Parameters.Add(new SqlParameter("@Pass", PasswordHash.HashPassword(password)));
                    insertTenant.Parameters.Add(new SqlParameter("@TenType", newTenant.getType()));
                    insertTenant.Parameters.Add(new SqlParameter("@LU", newTenant.getLastUpdated()));
                    insertTenant.Parameters.Add(new SqlParameter("@tenImage", imgByte));
                    insertTenant.ExecuteNonQuery();

                    sc.Close();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                    txtTenEmail.Value = "";
                    txtTenPass.Value = "";
                    txtTenFN.Value = "";
                    txtTenLN.Value = "";
                    txtTenPhone.Value = "";
                    txtTenBD.Value = "";
                    dropTenType.SelectedIndex = -1;
                    lblTenBDNo.Text = "";
                    lblTenEmailNo.Text = "";
                    lblEmailFormat.Text = "";
                    lblTenEmailNo.Visible = false;
                    lblTenBDNo.Visible = false;
                    lblEmailFormat.Visible = false;
                    lblUpPic.Visible = false;
                }
                else
                {
                    lblUpPic.ForeColor = Color.Red;
                    lblUpPic.Text = "*Tenant must upload a profile photo";
                    lblUpPic.Visible = true;
                    validate = false;
                }
            }
            else
            {
                lblTenBDNo.ForeColor = Color.Red;
                lblTenBDNo.Text = "*Tenant must be 18 years old or above";
                lblTenBDNo.Visible = true;
                validate = false;
            }
        }
    }

    //Use method in order to populate all text fields.
    protected void BtnTenPop_Click(object sender, EventArgs e)
    {
        txtTenEmail.Value = "JoeMuia@Gmail.com";
        // txtTenPass.Value = "123abc";
        txtTenFN.Value = "Joe";
        txtTenLN.Value = "Muia";
        txtTenPhone.Value = "540-888-8888";
        txtTenBD.Value = "06/04/1978";

    }

    //Use method in order to clear all textboxes.
    protected void BtnTenClear_Click(object sender, EventArgs e)
    {
        txtTenEmail.Value = "";
        txtTenPass.Value = "";
        txtTenFN.Value = "";
        txtTenLN.Value = "";
        txtTenPhone.Value = "";
        txtTenBD.Value = "";
        dropTenType.SelectedIndex = -1;
        lblTenBDNo.Text = "";
        lblTenEmailNo.Text = "";
        lblEmailFormat.Text = "";
        lblTenEmailNo.Visible = false;
        lblTenBDNo.Visible = false;
        lblEmailFormat.Visible = false;
        lblUpPic.Visible = false;
    }

    protected void btnGoSignin_Click(object sender, EventArgs e)
    {
        Response.Redirect("Signin.aspx");
    }



    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        
    }
}
