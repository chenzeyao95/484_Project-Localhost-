using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Homeowner
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


public class Homeowner
{
    private String firstName;
    private String lastName;
    private String email;
    private String phoneNum;
    private String address;
    private String cityCo;
    private String state;
    private String zip;
    private String password;
    private DateTime dateOfBirth;
    private DateTime lastUpdated = DateTime.Now;


    public Homeowner(String firstName, String lastName, String email, String phoneNum, String address,
        String cityCo, string state, String password, DateTime DOB, String zip, DateTime lu)
    {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phoneNum = phoneNum;
        this.address = address;
        this.cityCo = cityCo;
        this.state = state;
        this.zip = zip;
        this.dateOfBirth = DOB;
        this.password = password;
        this.lastUpdated = lu;
    }

    public void setHostFirstName(String firstName)
    {
        this.firstName = firstName;
    }

    public String getHostFirstName()
    {
        return this.firstName;
    }

    public void setHostLastName(String lastName)
    {
        this.lastName = lastName;
    }

    public String getHostLastName()
    {
        return this.lastName;
    }

    public void setHostEmail(String email)
    {
        this.email = email;
    }

    public String getHostEmail()
    {
        return this.email;
    }

    public void setHostphoneNum(String phoneNum)
    {
        this.phoneNum = phoneNum;
    }
    public string getHostphoneNum()
    {
        return this.phoneNum;
    }

    public void setAddress(String add)
    {
        this.address = add;
    }

    public String getAddress()
    {
        return this.address;
    }

    public void setHostcityCo(String cityCo)
    {
        this.cityCo = cityCo;
    }

    public String getHostcityCo()
    {
        return this.cityCo;
    }

    public void setHoststate(String state)
    {
        this.state = state;
    }

    public String getHoststate()
    {
        return this.state;
    }

    public void setZip(String zip)
    {
        this.zip = zip;
    }

    public String getZip()
    {
        return this.zip;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public String getPassword()
    {
        return this.password;
    }

    public DateTime getHomeDOB()
    {
        return this.dateOfBirth;
    }

    public void setHomeDOB(DateTime DOB)
    {
        this.dateOfBirth = DOB;
    }
}
    


