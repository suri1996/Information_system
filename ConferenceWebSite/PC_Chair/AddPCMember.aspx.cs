using ConferenceWebsite.App_code;
using Oracle.DataAccess.Client;
using System;

public partial class PC_Chair_AddPCMember : System.Web.UI.Page
{
    //**********************************
    // There are 3 TODOs on this page. *
    //**********************************

    ConferenceData myConferenceData = new ConferenceData();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        lblSubmitResultMessage.Visible = false;

        // Set the information to insert a new PC member.
        string pcCode = txtPcCode.Text.Trim();
        string personTitle = ddlTitle.SelectedValue;
        string personName = txtName.Text.Trim();
        string personInstitution = txtInstitution.Text.Trim();
        string personCountry = txtCountry.Text.Trim();
        string personEmail = txtEmail.Text.Trim();
        string personPhoneNumber = txtPhoneNumber.Text.Trim();

        // Check for missing input.
        if (pcCode == "" | personName == "" | personInstitution == "" | personCountry == "" | personEmail == "" | personPhoneNumber == "")
        {
            lblSubmitResultMessage.Text = "Please enter all PC member information.";
            lblSubmitResultMessage.Visible = true;
            return;
        }

        // Get the next person id.
        int personId = myConferenceData.GetNextPersonId();
        if (personId == -1) { return; }

        //**********************************************************************
        // TODO 1: Construct the SQL statement to check for duplicate PC code. *
        //**********************************************************************
        string sql = "";

        decimal count = myConferenceData.GetAggregateValue(sql);
        // If count is -1 an SQL error occurred so, exit
        if (count == -1)
        {
            lblSubmitResultMessage.Text = "*** There is an error in the SQL statement that checks for duplicate PC code.";
            lblSubmitResultMessage.Visible = true;
            return;
        }

        if (count != 0)
        {
            lblSubmitResultMessage.Text = "Duplicate PC code. Please enter another PC code.";
            lblSubmitResultMessage.Visible = true;
            return;
        }

        OracleTransaction trans = myConferenceData.BeginTransaction();

        //************************************************************************************
        // TODO 2: Construct the SQL statement to insert ALL the attribute values of person. *
        //************************************************************************************
        sql = "";

        myConferenceData.SetData(sql, trans);

        //****************************************************************************************
        // TODO 3: Construct the SQL statement to insert ALL the attributes values of pc_member. *
        //****************************************************************************************
        sql = "";

        myConferenceData.SetData(sql, trans);
        myConferenceData.CommitTransaction(trans);

        // Indicate successful insertion of a PC member.
        lblSubmitResultMessage.Visible = true;
        lblSubmitResultMessage.Text = "The PC member with PC code " + pcCode + " has been successfully added.";

        // Reset the input form.
        txtPcCode.Text = "";
        txtName.Text = "";
        ddlTitle.SelectedIndex = 0;
        txtInstitution.Text = "";
        txtCountry.Text = "";
        txtEmail.Text = "";
        txtPhoneNumber.Text = "";
    }
}