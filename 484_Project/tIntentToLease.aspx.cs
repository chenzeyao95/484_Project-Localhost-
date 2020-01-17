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

public partial class tIntentToLease : System.Web.UI.Page
{
    int PreConID;
    int AccomID;
    SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    String strCity = "";
    String strType = "";
    int hostID;
    String hostName;
    String street;
    String city;
    String state;
    double price;

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
            SqlCommand getPreConInfo = new SqlCommand();
            getPreConInfo.Connection = sc;
            getPreConInfo.CommandText = "Select HostID, HostName, AccommodationID FROM PRECONFIRMATION WHERE PreConID=@PreConID and TenantID=@TenID";
            getPreConInfo.Parameters.Add(new SqlParameter("@PreConID", PreConID));
            getPreConInfo.Parameters.Add(new SqlParameter("@TenID", CurrentSession.Current.tenantID));
            SqlDataReader readAccomID = getPreConInfo.ExecuteReader();
            while (readAccomID.Read())
            {
                hostID = readAccomID.GetInt32(0);
                hostName = readAccomID.GetString(1);
                AccomID = readAccomID.GetInt32(2);
            }
            readAccomID.Close();

            txtTenantName.Text = CurrentSession.Current.firstName + " " + CurrentSession.Current.lastName;
            txtHostName.Text = hostName;
            txtLandlord.Text = hostName;

            SqlCommand getAccommodationInfo = new SqlCommand();
            getAccommodationInfo.Connection = sc;
            getAccommodationInfo.CommandText = "Select Price, Street, CityCo, AccomState from ACCOMMODATION WHERE HostID=@HostID and AccommodationID=@AccomID";
            getAccommodationInfo.Parameters.Add(new SqlParameter("@HostID", hostID));
            getAccommodationInfo.Parameters.Add(new SqlParameter("@AccomID", AccomID));
            SqlDataReader getNameReader = getAccommodationInfo.ExecuteReader();
            while (getNameReader.Read())
            {
                price = getNameReader.GetSqlMoney(0).ToDouble();
                street = getNameReader.GetString(1);
                city = getNameReader.GetString(2);
                state = getNameReader.GetString(3);
                txtStreet.Text = street;
                txtcity.Text = city;
                txtState.Text = state;
                lblDate.Text = DateTime.Today.ToString();
                lblPrice.Text = price.ToString();
            }
            getNameReader.Close();
            sc.Close();
        }
    }

    protected void ConfirmLease_Click(object sender, EventArgs e)
    {
        
        if (!HttpUtility.HtmlEncode(txtSignature.Text).Equals(CurrentSession.Current.firstName + ' ' + CurrentSession.Current.lastName))
        {
            Response.Write("<script>alert('You must type your full name, spelled correctly!')</script>");
        }

        else
        {
            sc.Open();
            SqlCommand InsertConfirm = new SqlCommand();
            InsertConfirm.Connection = sc;
            InsertConfirm.CommandText = "Insert into CONFIRMATION values(@TenID, @TenName, @HostID, @HostName, @AccomID, @city, @accomState, @street, @price, @ConDate);";
            InsertConfirm.Parameters.Add(new SqlParameter("@TenID", CurrentSession.Current.tenantID));
            InsertConfirm.Parameters.Add(new SqlParameter("@TenName", CurrentSession.Current.firstName + CurrentSession.Current.lastName));
            InsertConfirm.Parameters.Add(new SqlParameter("@HostID", hostID));
            InsertConfirm.Parameters.Add(new SqlParameter("@HostName", hostName));
            InsertConfirm.Parameters.Add(new SqlParameter("@AccomID", AccomID));
            InsertConfirm.Parameters.Add(new SqlParameter("@city", city));
            InsertConfirm.Parameters.Add(new SqlParameter("@accomState", state));
            InsertConfirm.Parameters.Add(new SqlParameter("@street", street));
            InsertConfirm.Parameters.Add(new SqlParameter("@price", price));
            InsertConfirm.Parameters.Add(new SqlParameter("@ConDate", DateTime.Now));
            InsertConfirm.ExecuteNonQuery();

            SqlCommand updateAccom = new SqlCommand();
            updateAccom.Connection = sc;
            updateAccom.CommandText = "UPDATE ACCOMMODATION SET TenantID=@TenID WHERE AccommodationID=@AccomID AND HostID=@HostID;";
            updateAccom.Parameters.Add(new SqlParameter("@TenID", CurrentSession.Current.tenantID));
            updateAccom.Parameters.Add(new SqlParameter("@HostID", hostID));
            updateAccom.Parameters.Add(new SqlParameter("@AccomID", AccomID));
            updateAccom.ExecuteNonQuery();

            SqlCommand deletePreCon = new SqlCommand();
            deletePreCon.Connection = sc;
            deletePreCon.CommandText = "DELETE FROM PRECONFIRMATION WHERE PreConID=@PreConID";
            deletePreCon.Parameters.Add(new SqlParameter("@PreConID", PreConID));
            deletePreCon.ExecuteNonQuery();
            sc.Close();
            
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", " alert('You have successfully submitted your lease.'); window.open('https://dashboard.stripe.com/login');", true);
        }
    }
}