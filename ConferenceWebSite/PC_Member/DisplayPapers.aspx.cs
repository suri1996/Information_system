using ConferenceWebsite.App_code;
using Oracle.DataAccess.Client;
using System;
using System.Data;
using System.Web.UI.WebControls;

public partial class PC_Member_DisplayPapers : System.Web.UI.Page
{
    //**********************************
    // There are 4 TODOs on this page. *
    //**********************************

    ConferenceData myConferenceData = new ConferenceData();
    DataTable dtPaperPreference;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Load_Papers()
    {
        lblResultMessage.Visible = false;
        string pcCode = txtPcCode.Text.Trim();

        //*************************************************************************
        //* TODO 1: Construct the SQL statement to check if the PC code is valid. *
        //*************************************************************************
        string sql = "select count(*) from pc_member where pc_code = '" + pcCode + "'";
        decimal count = myConferenceData.GetAggregateValue(sql);
        // If count is -1 an SQL error occurred so, exit
        if (count == -1)
        {
            lblResultMessage.Text = "*** There is an error in the SQL statement that checks if the PC code is valid.";
            lblResultMessage.Visible = true;
            return;
        }

        if (pcCode == "" || count == 0)
        {
            lblResultMessage.Text = "Please enter a valid PC code.";
            pnlPreferencesNotSpecified.Visible = false;
            pnlPreferencesSpecified.Visible = false;
            lblResultMessage.Visible = true;
            return;
        }

        //********************************************************************************************************************
        // TODO 2: Construct the SQL statement to retrieve the preference, paper_number, title, submission_type and abstract *
        //         ordered by paper number ONLY for those papers for which the PC member HAS ALREADY specified a preference. *
        //********************************************************************************************************************
        sql = "select prefers.preference, paper.paper_number, paper.title, paper.submission_type, paper.abstract from paper, prefers where prefers.pc_code = '" + pcCode + "' and prefers.paper_number = paper.paper_number order by paper.paper_number";

        dtPaperPreference = myConferenceData.GetData(sql);
        // If DataTable is null an SQL error occurred, so exit.
        if (dtPaperPreference == null)
        {
            lblResultMessage.Text = "*** There is an error in the SQL statement that retrieves papers for which the PC member HAS ALREADY specified a preference.";
            lblResultMessage.Visible = true;
            return;
        }

        gvPreferenceSpecified.DataSource = dtPaperPreference;
        gvPreferenceSpecified.DataBind();

        // Check whether to display papers for which a preference has already been specified.
        if (dtPaperPreference.Rows.Count ==0)
        {
            pnlPreferencesSpecified.Visible = false;
            lblResultMessage.Text = "You have not specified a preference for any paper.";
            lblResultMessage.Visible = true;
        }
        else
        {
            pnlPreferencesSpecified.Visible = true;
        }

        //****************************************************************************************************************
        // TODO 3: Construct the SQL statement to retrieve the paper number, title, paper type and abstract in ascending *
        //         order by paper number ONLY for those papers for which the PC member HAS NOT specified a preference.   *
        //****************************************************************************************************************
        sql = "select paper.paper_number, paper.title, paper.abstract from paper where paper.paper_number not in  (select paper_number from prefers where pc_code='" + pcCode + "') order by paper.paper_number";

        dtPaperPreference = myConferenceData.GetData(sql);
        // If DataTable is null an SQL error occurred, so exit.
        if (dtPaperPreference == null)
        {
            lblResultMessage.Text = "*** There is an error in the SQL statement that retrieves papers for which the PC member HAS NOT specified a preference.";
            lblResultMessage.Visible = true;
            return;
        }

        gvNoPreferenceSpecified.DataSource = dtPaperPreference;
        gvNoPreferenceSpecified.DataBind();

        // Check whether to display papers for which no preference has been specified.
        if (dtPaperPreference.Rows.Count==0)
        {
            pnlPreferencesNotSpecified.Visible = false;
            lblResultMessage.Text = "There are no papers for which you can specify a preference.";
            lblResultMessage.Visible = true;
        }
        else
        {
            pnlPreferencesNotSpecified.Visible = true;
        }
    }

    protected void btnGetPapers_Click(object sender, EventArgs e)
    {
        Load_Papers();
    }

    protected void btnUpdatePreferences_Click(object sender, EventArgs e)
    {
        OracleTransaction trans = myConferenceData.BeginTransaction();
        string pcCode = txtPcCode.Text.Trim();
        string paperNumber = "";
        string preference = "";
        // For each paper for which a preference has been specified, get the preference and insert it into the database.
        for (int i = 0; i < gvNoPreferenceSpecified.Rows.Count; i++)
        {
            DropDownList listPreference = ((DropDownList)gvNoPreferenceSpecified.Rows[i].FindControl("ddlPreference"));
            paperNumber = gvNoPreferenceSpecified.Rows[i].Cells[1].Text;
            if (listPreference.SelectedIndex != 0)
            {
                preference = listPreference.SelectedItem.Value;

                //***************************************************************************
                // TODO 4: Construct the SQL statement to insert the specified preferences. *
                //***************************************************************************
                string sql = "insert into prefers values ('" + pcCode + "', " + paperNumber + ", " + preference + ")";

                myConferenceData.SetData(sql, trans);
            }
        }
        myConferenceData.CommitTransaction(trans);

        // Show result message and refresh the web form.
        lblResultMessage.Text = "Your preferences have been successfully updated.";
        Load_Papers();
    }
}