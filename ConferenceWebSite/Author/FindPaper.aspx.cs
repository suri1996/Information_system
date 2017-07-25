using ConferenceWebsite.App_code;
using System;
using System.Data;

public partial class Author_FindPaper : System.Web.UI.Page
{
    //**********************************
    // There are 2 TODOs on this page. *
    //**********************************

    ConferenceData myConferenceData = new ConferenceData();
    private DataTable dtPaper;
    private DataTable dtAuthor;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSearchPaper_Click(object sender, EventArgs e)
    {
        Hide_Labels();

        // Get the paper number from the search page.
        string inputNumber = txtPaperNumber.Text.Trim();

        // Check that paper number is an integer
        int paperNumber;
        bool IsInteger = int.TryParse(inputNumber, out paperNumber);
        if (!IsInteger)
        {
            lblSearchResultMessage.Text = "The paper number must be an integer.";
            lblSearchResultMessage.Visible = true;
            return;
        }
        Get_Paper(paperNumber.ToString());
    }

    protected void Get_Paper(string paperNumber)
    {
        //********************************************************************************************
        // TODO 1: Construct the SQL statement to retrieve a paper given a paper number. Display the *
        //         title, abstract, submission type and whether any of the authors is a PC member.   *
        //         DO NOT display the decision for the paper.                                        *
        //********************************************************************************************
        string sql = "";

        // Retrieve the paper information.
        dtPaper = myConferenceData.GetData(sql);
        // If DataTable is null an SQL error occurred, so exit.
        if (dtPaper == null)
        {
            lblSearchResultMessage.Text = "*** There is an error in the SQL statement that retrieves a paper.";
            lblSearchResultMessage.Visible = true;
            return;
        }

        // Set the paper information.
        if (dtPaper.Rows.Count == 0)
        {
            lblSearchResultMessage.Text = "There is no paper with this paper number.";
            lblSearchResultMessage.Visible = true;
            return;
        }
        foreach (DataRow row in dtPaper.Rows)
        {
            lblTitle.Text = row[0].ToString();
            lblAbstract.Text = row[1].ToString();
            lblSubmissionType.Text = row[2].ToString();
            lblPcPaper.Text = row[3].ToString();
        }

        Get_Paper_Authors(paperNumber);
        lblSearchResultMessage.Text = "The following paper matches your query:";
        Show_Labels();
    }

    protected void Get_Paper_Authors(string paperNumber)
    {
        //**************************************************************************************************
        // TODO 2: Construct the SQL statement to retrieve, for each author, the title, name, institution, *
        //         country, email, phone number and whether the author is the contact author of the paper. *
        //**************************************************************************************************
        string sql = "";

        // Retrieve the author information.
        dtAuthor = myConferenceData.GetData(sql);

        // If DataTable is null an SQL error occurred, so exit.
        if (dtAuthor == null)
        {
            lblSearchResultMessage.Text = "*** There is an error in the SQL statement that retrieves an author.";
            lblSearchResultMessage.Visible = true;
            return;
        }

        // Set the author information.
        gvAuthor.DataSource = dtAuthor;
        gvAuthor.DataBind();

    }

    protected void Hide_Labels()
    {
        lblSearchResultMessage.Visible = false;
        lblTitleLabel.Visible = false;
        lblTitle.Visible = false;
        lblAbstractLabel.Visible = false;
        lblAbstract.Visible = false;
        lblSubmissionTypeLabel.Visible = false;
        lblSubmissionType.Visible = false;
        lblPcPaperlabel.Visible = false;
        lblPcPaper.Visible = false;
        lblAuthorInfoLabel.Visible = false;
        gvAuthor.Visible = false;
    }

    protected void Show_Labels()
    {
        lblSearchResultMessage.Visible = true;
        lblTitleLabel.Visible = true;
        lblTitle.Visible = true;
        lblAbstractLabel.Visible = true;
        lblAbstract.Visible = true;
        lblSubmissionTypeLabel.Visible = true;
        lblSubmissionType.Visible = true;
        lblPcPaperlabel.Visible = true;
        lblPcPaper.Visible = true;
        lblAuthorInfoLabel.Visible = true;
        gvAuthor.Visible = true;
    }
}