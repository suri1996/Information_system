using ConferenceWebsite.App_code;
using Oracle.DataAccess.Client;
using System;
using System.Data;

public partial class PC_Member_DisplayReview : System.Web.UI.Page
{
    //**********************************
    // There are 7 TODOs on this page. *
    //**********************************

    ConferenceData myConferenceData = new ConferenceData();
    DataTable dtPaperNumber;
    DataTable dtPaperTitle;
    DataTable dtAuthor;
    DataTable dtRefereeReport;
    DataTable dtDiscussion;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnGetReviews_Click(object sender, EventArgs e)
    {
        lblResultMessage.Visible = false;
        pnlPaperInformation.Visible = false;

        // Get the pc code.
        string pcCode = txtPcCode.Text.Trim();
        if (pcCode == "")
        {
            lblResultMessage.Text = "Please enter a PC code.";
            lblResultMessage.Visible = true;
            return;
        }

        //****************************************************************************************
        // TODO 1: Construct the SQL statement to retrieve the paper numbers in ascending order, *
        //         for which the specified PC member has already submitted a review.             *
        //****************************************************************************************
        string sql = "";

        // Retrieve the paper numbers and set the paper dropdownlist with the retrieved paper numbers.
        dtPaperNumber = myConferenceData.GetData(sql);
        // If DataTable is null an SQL error occurred, so exit.
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
            lblResultMessage.Text = "You have not submitted any reviews.";
            lblResultMessage.Visible = true;
        }
        else
        {
            pnlPaperInformation.Visible = true;
            Reset_Review_Form();
        }
    }

    protected void Get_Selected_Paper_Info(string paperNumber)
    {
        lblResultMessage.Visible = false;
        //***********************************************************************************
        // TODO 2: Construct the SQL statement to retrieve the title of the selected paper. *
        //***********************************************************************************
        string sql = "";
        dtPaperTitle = myConferenceData.GetData(sql);
        // If DataTable is null an SQL error occurred, so exit.
        if (dtPaperTitle == null)
        {
            lblResultMessage.Text = "*** There is an error in the SQL statement that retrieves the title of the selected paper.";
            lblResultMessage.Visible = true;
            return;
        }

        //*************************************************************************************
        // TODO 3: Construct the SQL statement to retrieve the authors of the selected paper. *
        //*************************************************************************************
        sql = "";
        dtAuthor = myConferenceData.GetData(sql);
        // If DataTable is null an SQL error occurred, so exit.
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

    protected void Get_Reviews(string pcCode, string paperNumber)
    {
        //*********************************************************************************************************
        // TODO 4: Construct the SQL statement to retrieve the review for the specified PC code and paper number. *
        //*********************************************************************************************************
        string sql = "";
        dtRefereeReport = myConferenceData.GetData( sql);
        // If DataTable is null an SQL error occurred, so exit.
        if (dtRefereeReport == null)
        {
            lblResultMessage.Text = "*** There is an error in the SQL statement that retrieves the review for the specified PC code and paper number.";
            lblResultMessage.Visible = true;
            return;
        }

        // Set the referee report information for display.
        lblRelevant.Text = dtRefereeReport.Rows[0]["relevant"].ToString();
        lblTechnicallyCorrect.Text = dtRefereeReport.Rows[0]["technically_correct"].ToString();
        lblLengthAndContent.Text = dtRefereeReport.Rows[0]["length_and_content"].ToString();
        lblOriginality.Text = dtRefereeReport.Rows[0]["originality"].ToString();
        lblImpact.Text = dtRefereeReport.Rows[0]["impact"].ToString();
        lblPresentation.Text = dtRefereeReport.Rows[0]["presentation"].ToString();
        lblTechnicalDepth.Text = dtRefereeReport.Rows[0]["technical_depth"].ToString();
        lblOverallRating.Text = dtRefereeReport.Rows[0]["overall_rating"].ToString();
        lblConfidence.Text = dtRefereeReport.Rows[0]["confidence"].ToString();
        lblBestPaper.Text = dtRefereeReport.Rows[0]["best_paper"].ToString();
        txtMainContributions.Text = dtRefereeReport.Rows[0]["main_contribution"].ToString();
        txtStrongPoints.Text = dtRefereeReport.Rows[0]["strong_points"].ToString();
        txtWeakPoints.Text = dtRefereeReport.Rows[0]["weak_points"].ToString();
        txtOverallSummary.Text = dtRefereeReport.Rows[0]["overall_summary"].ToString();
        txtDetailedComments.Text = dtRefereeReport.Rows[0]["detailed_comments"].ToString();
        txtConfidentialComments.Text = dtRefereeReport.Rows[0]["confidential_comments"].ToString();
        pnlRefereeReport.Visible = true;
    }

    protected void Get_Discussion()
    {
        string paperNumber = ddlPaperNumber.SelectedValue;

        //*************************************************************************************************************
        // TODO 5: Construct the SQL statement to retrieve the PC code and the discussion comments for the specifiedd *
        //         paper number. The comments should be shown in ascending order from earliest to latest.             *
        //*************************************************************************************************************
        string sql = "";

        dtDiscussion = myConferenceData.GetData(sql);
        // If DataTable is null an SQL error occurred, so exit.
        if (dtDiscussion == null)
        {
            lblResultMessage.Text = "*** There is an error in the SQL statement that retrieves the discussion for a paper.";
            lblResultMessage.Visible = true;
            return;
        }

        // Show the result of the retrieval;
        if (dtDiscussion.Rows.Count == 0)
        {
            lblResultMessage.Text = "There is no discussion for paper number " + paperNumber + ".";
            lblResultMessage.Visible = true;
            pnlViewDiscussion.Visible = false;
            // pnlDiscussion.Visible = false;
        }
        else
        {
            gvDiscussion.DataSource = dtDiscussion;
            gvDiscussion.DataBind();
            pnlViewDiscussion.Visible = true;
            pnlDiscussion.Visible = true;
        }
        pnlAddNewDiscussion.Visible = true;
    }

    protected void btnViewDiscussion_Click(object sender, EventArgs e)
    {
        Get_Discussion();
    }

    protected void btnAddToDiscussion_Click(object sender, EventArgs e)
    {
        lblResultMessage.Visible = false;
        // Collect the information needed to insert a new discussion.
        string paperNumber = ddlPaperNumber.SelectedValue;
        string pcCode = txtPcCode.Text.Trim();
        string comments = txtNewDiscussion.Text.Trim();
        if (comments == "")
        {
            lblResultMessage.Text = "The comments were empty; nothing was added to the discussion.";
            lblResultMessage.Visible = true;
            return;
        }

        //***********************************************************************
        // TODO 6: Construct the SQL statement to retrieve the current maximum  *
        //         sequence number in the discussion for this paper.            *
        //***********************************************************************
        string sql = "";

        decimal maxSequenceNumber = myConferenceData.GetAggregateValue(sql);
        // If maxSequenceNumber is -1 an SQL error occurred, so exit.
        if (maxSequenceNumber == -1)
        {
            lblResultMessage.Text = "*** There is an error in the SQL statement that retrieve the current maximum sequence number in the discussion for a paper.";
            lblResultMessage.Visible = true;
            return;
        }

        int sequenceNumber = Convert.ToInt32(maxSequenceNumber + 1);

        //*****************************************************************************************
        // TODO 7: Construct the SQL statement to insert All the attributes values of discussion. *
        //*****************************************************************************************
        sql = "";

        // Insert the paper into the database.
        OracleTransaction trans = myConferenceData.BeginTransaction();
        myConferenceData.SetData(sql, trans);
        myConferenceData.CommitTransaction(trans);

        // Refresh the discussion and reset the new discussion textbox.
        Get_Discussion();
        txtNewDiscussion.Text = "";
    }

    protected void ddlPaperNumber_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlPaperNumber.SelectedIndex != 0)
        {
            Get_Selected_Paper_Info(ddlPaperNumber.SelectedValue);
            Get_Reviews(txtPcCode.Text.Trim(), ddlPaperNumber.SelectedValue);
            pnlViewDiscussion.Visible = true;
            pnlDiscussion.Visible = false;
            pnlAddNewDiscussion.Visible = false;
        }
        else
        {
            lblResultMessage.Text = "Please select a paper.";
            lblResultMessage.Visible = true;
            return;
        }
    }

    protected void Reset_Review_Form()
    {
        pnlRefereeReport.Visible = false;
        pnlViewDiscussion.Visible = false;
        pnlDiscussion.Visible = false;
        pnlAddNewDiscussion.Visible = false;
        lblRelevant.Text = "";
        lblTechnicallyCorrect.Text = "";
        lblLengthAndContent.Text = "";
        lblOriginality.Text = "";
        lblImpact.Text = "";
        lblPresentation.Text = "";
        lblTechnicalDepth.Text = "";
        lblOverallRating.Text = "";
        lblConfidence.Text = "";
        lblBestPaper.Text = "";
        txtMainContributions.Text = "";
        txtStrongPoints.Text = "";
        txtWeakPoints.Text = "";
        txtOverallSummary.Text = "";
        txtDetailedComments.Text = "";
        txtConfidentialComments.Text = "";
    }
}