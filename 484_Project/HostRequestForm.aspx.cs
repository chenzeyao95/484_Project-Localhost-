using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Diagnostics;
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

public partial class HostRequestForm : System.Web.UI.Page
{
    Byte[] accomImg1;
    String AccomName;
    SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    SqlConnection sc1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    int TenantID;
    bool validate;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (CurrentSession.Current.huserEmail == null)
        {
            Response.Redirect("Signin.aspx");
        }
        else
        {
            TenantID = Convert.ToInt32(Request.QueryString["id"]);

            SqlDataAdapter one = new SqlDataAdapter("SELECT FirstName, LastName, TenantType FROM TENANT WHERE TenantID = @TenID", sc);
            one.SelectCommand.Parameters.Add(new SqlParameter("@TenID", TenantID));
            DataTable dt = new DataTable();
            one.Fill(dt);
            DataList1.DataSource = dt;
            DataList1.DataBind();

            SqlDataAdapter two = new SqlDataAdapter("SELECT AccommodationID, Street, AccomName, Image1 FROM ACCOMMODATION WHERE HostID=@HostID", sc);
            two.SelectCommand.Parameters.Add(new SqlParameter("@HostID", CurrentSession.Current.hostID));
            DataTable dt2 = new DataTable();
            two.Fill(dt2);
            ListView1.DataSource = dt2;
            ListView1.DataBind();
        }
    }

    //Use method in order to send lease to tenant.
    public void SendLeaseBtn_Command(Object sender, CommandEventArgs e)
    {
        
        String HostBG;
        sc1.Open();
        SqlCommand FindBGStatus = new SqlCommand();
        FindBGStatus.Connection = sc1;
        FindBGStatus.CommandText = "SELECT Background FROM HOMEOWNER WHERE HostID=@HostID;";
        FindBGStatus.Parameters.Add(new SqlParameter("@HostID", CurrentSession.Current.hostID));
        HostBG = FindBGStatus.ExecuteScalar().ToString();
        sc1.Close();

        if (HostBG == "Y")
        {
            //paramertrized query
            sc1.Open();
            SqlCommand getStatus = new SqlCommand();
            getStatus.Connection = sc1;
            getStatus.CommandText = "Select PreConID FROM PRECONFIRMATION WHERE HostID=@HostID and TenantID=@TenID and AccommodationID=@AccomID";
            getStatus.Parameters.Add(new SqlParameter("@HostID", CurrentSession.Current.hostID));
            getStatus.Parameters.Add(new SqlParameter("@AccomID", e.CommandArgument));
            getStatus.Parameters.Add(new SqlParameter("@TenID", TenantID));
            SqlDataReader readStatus = getStatus.ExecuteReader();
            if (readStatus.HasRows)
            {
                validate = false;
            }
            else
            {
                validate = true;
            }
            readStatus.Close();

            if (validate == true)
            {
                //paramertrized query
                SqlCommand getBG = new SqlCommand();
                getBG.Connection = sc1;
                getBG.CommandText = "Select AccomName, Image1 FROM Accommodation WHERE HostID=@HostID and AccommodationID=@AccomID";
                getBG.Parameters.Add(new SqlParameter("@HostID", CurrentSession.Current.hostID));
                getBG.Parameters.Add(new SqlParameter("@AccomID", e.CommandArgument));
                SqlDataReader readAccom = getBG.ExecuteReader();
                while (readAccom.Read())
                {
                    AccomName = readAccom.GetString(0);
                    accomImg1 = (Byte[])readAccom["Image1"];
                }
                readAccom.Close();
                //paramertrized query
                SqlCommand CreatePreCon = new SqlCommand();
                CreatePreCon.Connection = sc1;
                CreatePreCon.CommandText = "Insert into PRECONFIRMATION values(@TenantID, @HostID, @HName, @AccomID, @AccomName, @image, @Date);";
                CreatePreCon.Parameters.Add(new SqlParameter("@TenantID", TenantID));
                CreatePreCon.Parameters.Add(new SqlParameter("@HostID", CurrentSession.Current.hostID));
                CreatePreCon.Parameters.Add(new SqlParameter("@AccomID", e.CommandArgument));
                CreatePreCon.Parameters.Add(new SqlParameter("@Date", DateTime.Now));
                CreatePreCon.Parameters.Add(new SqlParameter("@HName", CurrentSession.Current.hfirstName + ' ' + CurrentSession.Current.hlastName));
                CreatePreCon.Parameters.Add(new SqlParameter("@AccomName", AccomName));
                CreatePreCon.Parameters.Add(new SqlParameter("@image", accomImg1));
                CreatePreCon.ExecuteNonQuery();
                sc1.Close();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", " alert('Intent to lease successfully sent.');", true);

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", " alert('You have already sent an agreement to this tenant for this listing.');", true);

                sc1.Close();
            }
        }

        else
        {
            Response.Write("<script>alert('Your Background Screening is Incomplete!')</script>");
        }
    }

    
}