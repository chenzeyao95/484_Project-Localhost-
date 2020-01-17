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

public partial class tenantDialog : System.Web.UI.Page
{
    SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    int hostID;
    String hostName;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (CurrentSession.Current.userEmail == null)
        {
            Response.Redirect("Signin.aspx");
        }
        else
        {
            hostID = Convert.ToInt32(Request.QueryString["id"]);

            sc.Open();
            System.Data.SqlClient.SqlCommand gethName = new System.Data.SqlClient.SqlCommand();
            gethName.Connection = sc;
            gethName.CommandText = "SELECT HostFirstName, HostLastName FROM HOMEOWNER WHERE HostID=@hostID";
            gethName.Parameters.Add(new SqlParameter("@hostID", hostID));
            SqlDataReader readN = gethName.ExecuteReader();
            while (readN.Read())
            {
                hostName = readN.GetString(0) + " " + readN.GetString(1);
            }
            readN.Close();
            sc.Close();

            lblHostName.Text = hostName + " (Host)";

            SqlDataAdapter one = new SqlDataAdapter("SELECT SenderName, Text, SendDate, Ind FROM MESSAGE WHERE TenantID = @TenantID and HostID = @hostID order by SendDate ASC", sc);
            one.SelectCommand.Parameters.Add(new SqlParameter("@TenantID", CurrentSession.Current.tenantID));
            one.SelectCommand.Parameters.Add(new SqlParameter("@HostID", hostID));
            DataTable dt = new DataTable();
            one.Fill(dt);
            ListView1.DataSource = dt;
            ListView1.DataBind();
        }
    }

    //Use method in order to create a message object.
    protected void SendBtn_Click(object sender, EventArgs e)
    {
        String SenderName = CurrentSession.Current.firstName +" "+ CurrentSession.Current.lastName +" (Tenant)";
        String TName = CurrentSession.Current.firstName + " " + CurrentSession.Current.lastName;

        sc.Open();

        System.Data.SqlClient.SqlCommand insertMessage = new System.Data.SqlClient.SqlCommand();
        insertMessage.Connection = sc;
        insertMessage.CommandText = "INSERT INTO MESSAGE VALUES(@HID, @HN, @TID, @TN, @SN, @T, @SD, 'T')";
        insertMessage.Parameters.Add(new SqlParameter("@HID", hostID));
        insertMessage.Parameters.Add(new SqlParameter("@HN", hostName));
        insertMessage.Parameters.Add(new SqlParameter("@TID", CurrentSession.Current.tenantID));
        insertMessage.Parameters.Add(new SqlParameter("@TN", TName));
        insertMessage.Parameters.Add(new SqlParameter("@SN", SenderName));
        insertMessage.Parameters.Add(new SqlParameter("@T", HttpUtility.HtmlEncode(txtMessage.Value)));
        insertMessage.Parameters.Add(new SqlParameter("@SD", DateTime.Now));
        insertMessage.ExecuteNonQuery();

        sc.Close();

        Response.Redirect("tenantDialog.aspx?id="+hostID);
    }

    protected void ListView1_DataBound(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            string temp1 = Convert.ToString(DataBinder.Eval(e.Item.DataItem, "Ind"));
            Panel IPanel = (Panel)e.Item.FindControl("Panel4");
            if (temp1 == "T")
            {               
                IPanel.BackColor = Color.MistyRose;
            }
            else
            {
                IPanel.BackColor = Color.LightBlue;
            }
        }
    }

    protected void videoChat_Click(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterStartupScript(this.GetType(), "OpenWindow", "window.open('https://www.skype.com');", true);
    }
}