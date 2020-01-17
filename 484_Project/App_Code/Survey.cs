using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Survey
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

public class Survey
{
    private String bath;
    private String laundry;
    private String kitchen;
    private String living;
    private String lowNoise;
    private String modNoise;
    private String noNoise;
    private String pets;
    private String watch;
    private String nonSmoking;
    private String smokerFriendly;
    private String chores;
    private int accomID;

    public Survey(String bath, String laundry, String kitchen, String living, String lowNoise, String modNoise, String noNoise, String pets, String watch, String nonSmoking, String smokerFriendly, String chores, int accomID)
    {
        this.bath = bath;
        this.laundry = laundry;
        this.kitchen = kitchen;
        this.living = living;
        this.lowNoise = lowNoise;
        this.modNoise = modNoise;
        this.noNoise = noNoise;
        this.pets = pets;
        this.watch = watch;
        this.nonSmoking = nonSmoking;
        this.smokerFriendly = smokerFriendly;
        this.chores = chores;
        this.accomID = accomID;
    }

    public void setBath(String bath){
        this.bath = bath;
    }

    public String getBath(){
        return this.bath;
    }

    public void setLaundry(String laundry){
        this.laundry = laundry;
    }

    public String getLaundry(){
        return this.laundry;
    }

    public void setKitchen(String kitchen){
        this.kitchen = kitchen;
    }

    public String getKitchen(){
        return this.kitchen;
    }

    public void setLiving(String living){
        this.living = living;
    }

    public String getLiving(){
        return this.laundry;
    }

    public void setLowNoise(String lowNoise){
        this.lowNoise = lowNoise;
    }

    public String getLowNoise(){
        return this.lowNoise;
    }

    public void setModNoise(String modNoise){
        this.modNoise = modNoise;
    }

    public String getModNoise(){
        return this.modNoise;
    }

    public void setNoNoise(String noNoise){
        this.noNoise = noNoise;
    }

    public String getNoNoise(){
        return this.noNoise;
    }

    public void setPets(String pets){
        this.pets = pets;
    }

    public String getPets(){
        return this.pets;
    }

    public void setWatch(String watch){
        this.watch = watch;
    }

    public String getWatch(){
        return this.watch;
    }

    public void setNonSmoking(String nonSmoking){
        this.nonSmoking = nonSmoking;
    }
    public String getNonSmoking()
    {
        return this.nonSmoking;
    }

    public void setSmokerFriendly(String smokerFriendly){
        this.smokerFriendly = smokerFriendly;
    }
    public String getSmokerFriendly()
    {
        return this.smokerFriendly;
    }
    public void setChores(String chores){
        this.chores = chores;
    }

    public String getChores()
    {
        return this.chores;
    }

    public void setAccomID(int accomID){
        this.accomID = accomID;
    }

    public int getAccomID(){
        return this.accomID;
    }
}