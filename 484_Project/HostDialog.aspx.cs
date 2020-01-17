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

public partial class HostDialog : System.Web.UI.Page
{
    SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    int TenantID;
    String TenantName;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (CurrentSession.Current.huserEmail == null)
        {
            Response.Redirect("Signin.aspx");
        }
        else
        {
            TenantID = Convert.ToInt32(Request.QueryString["id"]);

            sc.Open();
            System.Data.SqlClient.SqlCommand getTName = new System.Data.SqlClient.SqlCommand();
            getTName.Connection = sc;
            getTName.CommandText = "SELECT FirstName, LastName FROM TENANT WHERE TenantID=@TenID";
            getTName.Parameters.Add(new SqlParameter("@TenID", TenantID));
            SqlDataReader readN = getTName.ExecuteReader();
            while (readN.Read())
            {
                TenantName = readN.GetString(0) + " " + readN.GetString(1);
            }
            readN.Close();
            sc.Close();

            lblHostName.Text = TenantName + " (Tenant)";
            //Retrieves all past messages between the two users and displays it on the page.

            SqlDataAdapter one = new SqlDataAdapter("SELECT SenderName, Text, SendDate, Ind FROM MESSAGE WHERE TenantID = @TenantID and HostID = @hostID order by SendDate ASC", sc);
            one.SelectCommand.Parameters.Add(new SqlParameter("@TenantID", TenantID));
            one.SelectCommand.Parameters.Add(new SqlParameter("@HostID", CurrentSession.Current.hostID));
            DataTable dt = new DataTable();
            one.Fill(dt);
            ListView1.DataSource = dt;
            ListView1.DataBind();
        }
    }

    //Use method in order to insert values into Message table in DB.
    protected void SendBtn_Click(object sender, EventArgs e)
    {
        String SenderName = CurrentSession.Current.hfirstName + " " + CurrentSession.Current.hlastName + " (Host)";
        String HName = CurrentSession.Current.hfirstName + " " + CurrentSession.Current.hlastName;

        sc.Open();

        System.Data.SqlClient.SqlCommand insertMessage = new System.Data.SqlClient.SqlCommand();
        insertMessage.Connection = sc;
        //Populates current message into the database and stores its date and time.
        insertMessage.CommandText = "INSERT INTO MESSAGE VALUES(@HID, @HN, @TID, @TN, @SN, @T, @SD, 'H')";
        insertMessage.Parameters.Add(new SqlParameter("@HID", CurrentSession.Current.hostID));
        insertMessage.Parameters.Add(new SqlParameter("@HN", HName));
        insertMessage.Parameters.Add(new SqlParameter("@TID", TenantID));
        insertMessage.Parameters.Add(new SqlParameter("@TN", TenantName));
        insertMessage.Parameters.Add(new SqlParameter("@SN", SenderName));
        insertMessage.Parameters.Add(new SqlParameter("@T", HttpUtility.HtmlEncode(txtMessage.Value)));
        insertMessage.Parameters.Add(new SqlParameter("@SD", DateTime.Now));
        insertMessage.ExecuteNonQuery();

        sc.Close();

        Response.Redirect("HostDialog.aspx?id=" + TenantID);
    }

    
    protected void ListView1_DataBound(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            string temp1 = Convert.ToString(DataBinder.Eval(e.Item.DataItem, "Ind"));
            Panel IPanel = (Panel)e.Item.FindControl("Panel4");
            if (temp1 == "H")
            {
                IPanel.BackColor = Color.LightBlue;
            }
            else
            {
                IPanel.BackColor = Color.MistyRose;
            }
        }
    }

    protected void SendLeaseBtn_Click(object sender, EventArgs e)
    {
        Response.Write("<script>window.open ('HostRequestForm.aspx?id=" + TenantID + "','_blank');</script>");
    }

    protected void videoChat_Click(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterStartupScript(this.GetType(), "OpenWindow", "window.open('https://www.skype.com');", true);
    }
}