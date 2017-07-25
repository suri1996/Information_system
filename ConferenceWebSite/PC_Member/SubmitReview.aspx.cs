using ConferenceWebsite.App_code;
using Oracle.DataAccess.Client;
using System;
using System.Data;
using System.Linq;

public partial class PC_Member_SubmitReview : System.Web.UI.Page
{
    //**********************************
    // There are 5 TODOs on this page. *
    //**********************************

    ConferenceData myConferenceData = new ConferenceData();
    DataTable dtPaperNumber;
    DataTable dtPaperTitle;
    DataTable dtAuthor;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Populate_PaperNumber_DropDownList()
    {
        lblResultMessage.Visible = false;
        lblPaperNumberLabel.Visible = false;
        ddlPaperNumber.Visible = false;
        pnlPaperInformation.Visible = false;
        pnlRefereeReport.Visible = false;

        // Get the pc code.
        string pcCode = txtPcCode.Text.Trim();

        //*************************************************************************
        //* TODO 1: Construct the SQL statement to check if the PC code is valid. *
        //*************************************************************************
        string sql = "";
        decimal count = myConferenceData.GetAggregateValue(sql);
        // If count is -1 an SQL error occurred, so exit.
        if (count == -1)
        {
            lblResultMessage.Text = "*** There is an error in the SQL statement that checks if the PC code is valid.";
            lblResultMessage.Visible = true;
            return;
        }

        if (pcCode == "" || count == 0)
        {
            lblResultMessage.Text = "Please enter a valid PC code.";
            lblResultMessage.Visible = true;
            Reset_Review_Form();
            return;
        }

        //********************************************************************************************************
        // TODO 2: Construct the SQL statement to retrieve the paper numbers, in ascending order, that have been *
        //         assigned to the specified PC member and for which the PC member HAS NOT submitted a review.   *
        //********************************************************************************************************
        sql = "";

        // Retrieve the paper information.
        dtPaperNumber = myConferenceData.GetData(sql);
        // If dtPaperNumber is null an SQL error occurred, so exit.
        if (dtPaperNumber == null)
        {
            lblResultMessage.Text = "*** There is an error in the SQL statement that retrieves the paper numbers.";
            lblResultMessage.Visible = true;
            return;
        }

        ddlPaperNumber.DataSource = dtPaperNumber;
        ddlPaperNumber.DataValueField = "paper_number";
        ddlPaperNumber.DataTextField = "paper_number";
        ddlPaperNumber.DataBind();
        ddlPaperNumber.Items.Insert(0, "--Select Paper--");

        // Show result of retrieval.
        if (dtPaperNumber.Rows.Count == 0)
        {
            lblResultMessage.Text = "There are no papers for you to review.";
            lblResultMessage.Visible = true;
        }
        else
        {
            lblPaperNumberLabel.Visible = true;
            ddlPaperNumber.Visible = true;
        }
    }

    protected void Get_Selected_Paper_Info(string paperNumber)
    {
        lblResultMessage.Visible = false;
        pnlPaperInformation.Visible = true;
        pnlRefereeReport.Visible = true;

        //***********************************************************************************
        // TODO 3: Construct the SQL statement to retrieve the title of the selected paper. *
        //***********************************************************************************
        string sql = "";
        dtPaperTitle = myConferenceData.GetData(sql);
        // If dtPaperTitle is null an SQL error occurred, so exit.
        if (dtPaperTitle == null)
        {
            lblResultMessage.Text = "*** There is an error in the SQL statement that retrieves the title of the selected paper.";
            lblResultMessage.Visible = true;
            return;
        }

        //*************************************************************************************
        // TODO 4: Construct the SQL statement to retrieve the authors of the selected paper. *
        //*************************************************************************************
        sql = "";
        dtAuthor = myConferenceData.GetData(sql);
        // If dtAuthor is null an SQL error occurred, so exit.
        if (dtAuthor == null)
        {
            lblResultMessage.Text = "*** There is an error in the SQL statement that retrieves the authors of the selected paper.";
            lblResultMessage.Visible = true;
            return;
        }

        // Set the paper title and authors for display.
        lblAuthor.Text = "";
        lblTitle.Text = dtPaperTitle.Rows[0]["Title"].ToString();
        for (int i = 0; i < dtAuthor.Rows.Count; i++)
        {
            lblAuthor.Text = lblAuthor.Text + dtAuthor.Rows[i]["Name"].ToString();
            if (i < dtAuthor.Rows.Count - 1)
            {
                lblAuthor.Text = lblAuthor.Text + ", ";
            }
        }
    }

    protected void btnGetPaper_Click(object sender, EventArgs e)
    {
        Populate_PaperNumber_DropDownList();
    }

    protected void ddlPaperNumber_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlPaperNumber.SelectedIndex != 0)
        {
            Get_Selected_Paper_Info(ddlPaperNumber.SelectedValue);
        }
        else
        {
            lblResultMessage.Text = "Please select a paper.";
            lblResultMessage.Visible = true;
            return;
        }
    }

    protected void btnSubmitReview_Click(object sender, EventArgs e)
    {
        // Collect the information required to add a review.
        string pcCode = txtPcCode.Text.Trim();
        string paperNumber = ddlPaperNumber.SelectedValue;
        string relevant = ddlPaperRelevant.SelectedValue;
        string technicallyCorrect = ddlTechnicallyCorrect.SelectedValue;
        string lengthAndContent = ddlLengthAndContent.SelectedValue;
        string originality = ddlOriginality.SelectedValue;
        string impact = ddlImpact.SelectedValue;
        string presentation = ddlPresentation.SelectedValue;
        string technicalDepth = ddlTechnicalDepth.SelectedValue;
        string overallRating = ddlOverallRating.SelectedValue;
        string confidence = ddlConfidence.SelectedValue;
        string bestPaper = ddlBestPaper.SelectedValue;
        string mainContributions = txtMainContributions.Text.Trim();
        string strongPoints = txtStrongPoints.Text.Trim();
        string weakPoints = txtWeakPoints.Text.Trim();
        string overallSummary = txtOverallSummary.Text.Trim();
        string detailedComments = txtDetailedComments.Text.Trim();
        string confidentialComments = txtConfidentialComments.Text.Trim();

        // Check for missing information.
        if (mainContributions == "" | strongPoints == "" | weakPoints == "" | overallSummary == "")
        {
            lblResultMessage.Text = "Your review is missing some required information.";
            lblResultMessage.Visible = true;
            return;
        }

        //*********************************************************************
        //TODO 5: Construct the SQL statement to insert a review for a paper. *
        //*********************************************************************
        string sql = "";

        // Insert the review into the database.
        OracleTransaction trans = myConferenceData.BeginTransaction();
        myConferenceData.SetData(sql, trans);
        myConferenceData.CommitTransaction(trans);

        // Show result of insert.
        lblResultMessage.Text = "Your review for paper number " + paperNumber + " has been successfully submitted.";
        lblResultMessage.Visible = true;

        Reset_Review_Form();
    }
    protected void Reset_Review_Form()
    {
        pnlPaperInformation.Visible = false;
        pnlRefereeReport.Visible = false;
        lblPaperNumberLabel.Visible = false;
        ddlPaperNumber.Visible = false;
        ddlPaperRelevant.SelectedIndex = 0;
        ddlTechnicallyCorrect.SelectedIndex = 0;
        ddlLengthAndContent.SelectedIndex = 0;
        ddlOriginality.SelectedIndex = 0;
        ddlImpact.SelectedIndex = 0;
        ddlPresentation.SelectedIndex = 0;
        ddlTechnicalDepth.SelectedIndex = 0;
        ddlOverallRating.SelectedIndex = 0;
        ddlConfidence.SelectedIndex = 0;
        ddlBestPaper.SelectedIndex = 0;
        txtMainContributions.Text = "";
        txtStrongPoints.Text = "";
        txtWeakPoints.Text = "";
        txtOverallSummary.Text = "";
        txtDetailedComments.Text = "";
        txtConfidentialComments.Text = "";
    }
}