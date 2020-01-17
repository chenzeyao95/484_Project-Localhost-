using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for History
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

public class History
{
    private String ownerName;
    private String accomStreet;

    public History(String ownerName, String accomStreet)
    {
        this.ownerName = ownerName;
        this.accomStreet = accomStreet;
    }

    public void setName(String ownerName)
    {
        this.ownerName = ownerName;
    }

    public String getName()
    {
        return this.ownerName;
    }

    public void setStreet(String accomStreet)
    {
        this.accomStreet = accomStreet;
    }

    public String getStreet()
    {
        return this.accomStreet;
    }
}