using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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

public class AdminAcc
{
    private int AdminID;
    private String firstName;
    private String lastName;
    private String username;
    private String password;

    public AdminAcc(int AdminID, String firstname, String lastname, String username, String password)
    {
        this.AdminID = AdminID;
        this.firstName = firstname;
        this.lastName = lastname;
        this.username = username;
        this.password = password;
    }
   

    public int getAdminID()
    {
        return this.AdminID;
    }
    public String getAdminFirst()
    {
        return this.firstName;
    }

    public String getAdminLast()
    {
        return this.lastName;
    }

    public String getAdminUser()
    {
        return this.username;
    }

    public String getAdminPass()
    {
        return this.password;
    }

    public void setAdminFirst(String firstname)
    {
        this.firstName = firstname;
    }

    public void setAdminLast(String lastname)
    {
        this.lastName = lastname;
    }

    public void setAdminUser(String username)
    {
        this.username = username;
    }

    public void setAdminPass(String password)
    {
        this.password = password;
    }

    public void setAdminID(int i)
    {
        this.AdminID = i;
    }

    public void setAdminID(String i)
    {
        this.firstName = i;
    }
}