using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Tenant
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

public class Tenant
{

    private String email;
    private String phoneNum;
    private String firstName;
    private String lastName;
    private DateTime birthDate;
    private String password;
    private String type;
    private DateTime lastUpdated = DateTime.Now;

    public Tenant(String email, String phoneNum, String firstName, String lastName, DateTime birthDate,
        String password, String type, DateTime lastUpdated)
    {
        this.email = email;
        this.phoneNum = phoneNum;
        this.firstName = firstName;
        this.lastName = lastName;
        this.birthDate = birthDate;
        this.password = password;
        this.type = type;
        this.lastUpdated = lastUpdated;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public String getEmail()
    {
        return this.email;
    }

    public void setPhone(String phoneNum)
    {
        this.phoneNum = phoneNum;
    }

    public String getPhone()
    {
        return this.phoneNum;
    }

    public void setFirstName(String firstName)
    {
        this.firstName = firstName;
    }

    public String getFirstName()
    {
        return this.firstName;
    }

    public void setLastName(String lastName)
    {
        this.lastName = lastName;
    }

    public String getLastName()
    {
        return this.lastName;
    }

    public void setBirthDate(DateTime birthDate)
    {
        this.birthDate = birthDate;
    }

    public DateTime getBirthDate()
    {
        return this.birthDate;
    }

    // Password getters/setters

    public void setType(String type)
    {
        this.type = type;
    }

    public String getType()
    {
        return this.type;
    }

    public void setLastUpdated(DateTime lastUpdated) {
        this.lastUpdated = lastUpdated;
    }

    public DateTime getLastUpdated() {
        return this.lastUpdated;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return this.password;
    }
}