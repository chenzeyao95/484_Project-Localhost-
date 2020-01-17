using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CurrentSession
/// </summary>

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

public class CurrentSession
{

    // Do two different constructors: one for tenant, one for host. Or maybe not

    // Tenant constructor
    public CurrentSession()
    {
       
        String email = " ";
        String phoneNum = " ";
        String firstName = " ";
        String lastName = " ";
        DateTime birthDate = DateTime.Today;
        String tenantType = " ";
        String address = " ";
        String city = " ";
        String state = " ";
        String zip = " ";
        String phoneNumber = " ";
        int hostID;
        int tenantID;
        String hemail = " ";
        String hphoneNum = " ";
        String hfirstName = " ";
        String hlastName = " ";
        DateTime hbirthDate = DateTime.Today;
        String hostType = " ";
        String haddress = " ";
        String hcity = " ";
        String hstate = " ";
        String hzip = " ";
        String hphoneNumber = " ";
        String tImage;
        String hImage;
        double latSearch;
        double longSearch;
        String searchZip;
        String AdminUser;

     }

    public static CurrentSession Current
    {
        get
        {
            CurrentSession session =
              (CurrentSession)HttpContext.Current.Session["__CurrentSession__"];
            if (session == null)
            {
                session = new CurrentSession();
                HttpContext.Current.Session["__CurrentSession__"] = session;
            }
            return session;
        }
    }

    public string userEmail { get; set; }
    public string phoneNum { get; set; }
    public string firstName { get; set; }
    public string lastName { get; set; }
    public DateTime birthDate { get; set; }
    public string address { get; set; }
    public string city { get; set; }
    public string tenantType { get; set; }
    public string state { get; set; }
    public string phoneNumber { get; set; }
    public string zip { get; set; }
    public int hostID { get; set; }
    public int tenantID { get; set; }
    public string huserEmail { get; set; }
    public string hphoneNum { get; set; }
    public string hfirstName { get; set; }
    public string hlastName { get; set; }
    public DateTime hbirthDate { get; set; }
    public string haddress { get; set; }
    public string hcity { get; set; }
    public string hostType { get; set; }
    public string hstate { get; set; }
    public string hphoneNumber { get; set; }
    public string hzip { get; set; }   
    public String tImage { get; set; }
    public String hImage { get; set; }
    public double latSearch { get; set; }
    public double longSearch { get; set; }
    public String searchZip { get; set; }
    public String hLastUp { get; set; }
    public int hListNo { get; set; }
    public int hReviewNo { get; set; }
    public String tLastUp { get; set; }
    public String AdminUser { get; set; }
}