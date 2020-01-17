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

public class Accommodation
{
    private String address;
    private String city;
    private String country;
    private String state;
    private String zip;
    private decimal price;
    private int numOfRooms;
    private String roomType;
    private String neighborhood;
    private String description;
    private int hostID;
    private String AccomName;

    public Accommodation(String address, String city, String state, String zip, decimal price, String roomType, String neighborhood, String description, int hostID, String AccomName)
    {
        this.address = address;
        this.city = city;
        this.state = state;
        this.zip = zip;
        this.price = price;
        this.roomType = roomType;
        this.neighborhood = neighborhood;
        this.description = description;
        this.hostID = hostID;
        this.AccomName = AccomName;
    }

    public void setAddress(String address)
    {
        this.address = address;
    }

    public String getAddress()
    {
        return this.address;
    }

    public void setAccomCity(String city)
    {
        this.city = city;
    }

    public String getAccomCity()
    {
        return this.city;
    }

    public void setAccomState(String state)
    {
        this.state = state;
    }

    public String getAccomState()
    {
        return this.state;
    }

    public void setAccomZip(String zip)
    {
        this.zip = zip;
    }
    public String getAccomZip()
    {
        return this.zip;
    }

    public void setAccomPrice(decimal price)
    {
        this.price = price;
    }
    public decimal getAccomPrice()
    {
        return this.price;
    }

    public void setAccomNumOfRooms(int numOfRooms)
    {
        this.numOfRooms = numOfRooms;
    }
    public int getAccomNumOfRooms()
    {
        return this.numOfRooms;
    }


    public void setAccomRoomType(String roomType)
    {
        this.roomType = roomType;
    }
    public String getAccomRoomType()
    {
        return this.roomType;
    }

    public void setAccomNeighborhood(String neighborhood)
    {
        this.neighborhood = neighborhood;
    }
    public String getAccomNeighborhood()
    {
        return this.neighborhood;
    }

    public void setAccomDescription(String description)
    {
        this.description = description;
    }

    public String getAccomDescription()
    {
        return this.description;
    }

    public void setAccomHostID(int hostID)
    {
        this.hostID = hostID;
    }

    public int getAccomHostID()
    {
        return this.hostID;
    }

    public void setAccomName(String i)
    {
        this.AccomName = i;
    }

    public String getAccomName()
    {
        return this.AccomName;
    }
}