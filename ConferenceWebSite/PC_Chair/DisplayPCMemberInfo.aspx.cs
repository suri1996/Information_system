using ConferenceWebsite.App_code;
using System;
using System.Data;

public partial class PC_Chair_DisplayPCMemberInfo : System.Web.UI.Page
{
    //********************************
    // There is 1 TODO on this page. *
    //********************************

    ConferenceData myConferenceData = new ConferenceData();
    private DataTable dtPCMember;

    protected void Page_Load(object sender, EventArgs e)
    {
        lblResultMessage.Visible = false;
        //**********************************************************************
        // TODO 1: Construct the SQL statement to retrieve ALL the information *
        //         for a PC member sorted in ascending order by PC code.       *
        //**********************************************************************
        string sql = "";

        // Retrieve the PC member information.
        dtPCMember = myConferenceData.GetData(sql);
        // If DataTable is null an SQL error occurred, so exit.
        if (dtPCMember == null)
        {
            lblResultMessage.Text = "*** There is an error in the SQL statement that retrieves the PC member information.";
            lblResultMessage.Visible = true;
            return;
        }

        // Set the PC Member information.
        gvPCMember.DataSource = dtPCMember;
        gvPCMember.DataBind();
    }
}