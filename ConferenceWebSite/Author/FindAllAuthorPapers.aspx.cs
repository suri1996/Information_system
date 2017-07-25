using ConferenceWebsite.App_code;
using System;
using System.Data;

public partial class Author_FindAllAuthorPapers : System.Web.UI.Page
{
    //********************************
    // There is 1 TODO on this page. *
    //********************************

    ConferenceData myConferenceData = new ConferenceData();
    private DataTable dtPaper;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSearchPaper_Click(object sender, EventArgs e)
    {
        lblSearchResultMessage.Visible = false;
        lblPaperInfoLabel.Visible = false;
        gvPaper.Visible = false; ;

        // Get the email from the search page.
        string email = txtEmail.Text.Trim();

        // Check for missing input
        if (email == "")
        {
            lblSearchResultMessage.Text = "Please input an email address.";
            lblSearchResultMessage.Visible = true;
            return;
        }

        //**************************************************************************************************
        // TODO 1: Construct the SQL statement to retrieve all the submitted papers by an author given the *
        //         author's email address. Display the paper_number, title, abstract and submission type.  *
        //**************************************************************************************************
        string sql = "";

        // Retrieve the paper information; exit if an SQL error occurred.
        dtPaper = myConferenceData.GetData(sql);
        // If DataTable is null an SQL error occurred, so exit.
        if (dtPaper == null)
        {
            lblSearchResultMessage.Text = "*** There is an error in the SQL statement that retrieves all the submitted papers by an author.";
            lblSearchResultMessage.Visible = true;
            return;
        }

        // Check if any papers.
        if (dtPaper.Rows.Count == 0)
        {
            lblSearchResultMessage.Text = "You have not submitted any papers.";
            lblSearchResultMessage.Visible = true;
        }
        else
        {
            // Display the papers.
            gvPaper.DataSource = dtPaper;
            gvPaper.DataBind();
            lblSearchResultMessage.Text = "You have submitted the following papers:";
            lblSearchResultMessage.Visible = true;
            lblPaperInfoLabel.Visible = true;
            gvPaper.Visible = true;
        }
    }
}