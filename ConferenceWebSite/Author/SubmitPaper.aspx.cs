using ConferenceWebsite.App_code;
using Oracle.DataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Author_SubmitPaper : System.Web.UI.Page
{
    //**********************************
    // There are 4 TODOs on this page. 
    //**********************************

    ConferenceData myConferenceData = new ConferenceData();
    private DataTable dtAuthors;

    protected void Page_Load(object sender, EventArgs e)
    {
        // Create a DataTable to store author information collected from the interface.
        if (!Page.IsPostBack)
        {
            dtAuthors = new DataTable();
            dtAuthors.Columns.Add("Title");
            dtAuthors.Columns.Add("Name");
            dtAuthors.Columns.Add("Institution");
            dtAuthors.Columns.Add("Country");
            dtAuthors.Columns.Add("Email");
            dtAuthors.Columns.Add("Phone Number");
            dtAuthors.Columns.Add("Contact Author");
        }
        else
        {
            dtAuthors = (DataTable)ViewState["AuthorDataTable"];
        }
        // The author DataTable is stored in ViewState.
        ViewState["AuthorDataTable"] = dtAuthors;
    }

    protected void btnAddAuthor_Click(object sender, EventArgs e)
    {
        lblSubmitResultMessage.Visible = false;
        if (txtAuthorName.Text.Trim() == "" | txtInstitution.Text.Trim() == "" | txtEmail.Text.Trim() == "" | txtPhoneNumber.Text.Trim() == "")
        {
            lblSubmitResultMessage.Text = "Please enter all author information.";
            lblSubmitResultMessage.Visible = true;
        }
        else
        {
            btnSubmitPaper.Visible = true;
            lblPaperAuthors.Visible = true;
            // Add the author information to the list of authors.
            DataRow dr = dtAuthors.NewRow();
            dr["Title"] = ddlTitle.SelectedItem.Value;
            dr["Name"] = txtAuthorName.Text;
            dr["Institution"] = txtInstitution.Text;
            dr["Country"] = txtCountry.Text;
            dr["Email"] = txtEmail.Text;
            dr["Phone Number"] = txtPhoneNumber.Text;
            dr["Contact Author"] = ddlContactAuthor.SelectedItem.Value;
            dtAuthors.Rows.Add(dr);
            gvAuthors.DataSource = dtAuthors;
            gvAuthors.DataBind();

            // Reset the author input form.
            ddlTitle.SelectedIndex = 0;
            txtAuthorName.Text = "";
            txtInstitution.Text = "";
            txtCountry.Text = "";
            txtEmail.Text = "";
            txtPhoneNumber.Text = "";
            ddlContactAuthor.SelectedIndex = 0;
        }
    }

    protected void btnSubmitPaper_Click(object sender, EventArgs e)
    {
        // Check for no paper input.
        if (txtTitle.Text.Trim() == "" | txtAbstract.Text.Trim() == "")
        {
            lblSubmitResultMessage.Text = "Please enter all paper information";
            lblSubmitResultMessage.Visible = true;
            return;
        }
        else
        {
            btnSubmitPaper.Visible = true;
        }

        // Initialize the input form.
        lblSubmitResultMessage.Visible = false;
        gvAuthors.Visible = true;

        //************************************************************************************
        // TODO 1: Construct the SQL statement to retrieve the current maximum paper number. *
        //************************************************************************************
        string sql = "";

        decimal maxPaperNumber = myConferenceData.GetAggregateValue(sql);
        // If maxPaperNumber is -1 an SQL error occurred, so exit.
        if (maxPaperNumber == -1)
        {
            lblSubmitResultMessage.Text = "*** There is an error in the SQL statement that retrieves the maximum paper number.";
            lblSubmitResultMessage.Visible = true;
            return;
        }

        // Set the paper information for insertion from the web form controls.
        int paperNumber = Convert.ToInt32(maxPaperNumber + 1);
        string paperTitle = txtTitle.Text.Trim();
        string paperAbstract = txtAbstract.Text.Trim();
        string submissionType = ddlSubmissionType.SelectedValue;
        string pcPaper = ddlPCPaper.SelectedValue;

        //*********************************************************************************************
        // TODO 2: Construct the SQL statement to insert ALL the attribute values of the paper table. *
        //*********************************************************************************************
        sql = "";

        // Insert the paper into the database.
        OracleTransaction trans = myConferenceData.BeginTransaction();
        myConferenceData.SetData(sql, trans);

        // Set the person and author information for insertion from the web form controls.
        foreach (DataRow row in dtAuthors.Rows)
        {
            string authorTitle = row["Title"].ToString();
            string authorName = row["Name"].ToString();
            string authorInstitution = row["Institution"].ToString();
            string authorCountry = row["Country"].ToString(); ;
            string authorEmail = row["Email"].ToString();
            string authorPhoneNumber = row["Phone Number"].ToString();
            string authorContact = row["Contact Author"].ToString();

            // Get the next person id.
            int personId = myConferenceData.GetNextPersonId();
            if (personId == -1) { return; }

            //***********************************************************************************************
            // TODO 3 : Construct the SQL statement to insert ALL the attribute values of the person table. *
            //***********************************************************************************************
            sql = "";

            myConferenceData.SetData(sql, trans);

            //***********************************************************************************************
            // TODO 4 : Construct the SQL statement to insert ALL the attribute values of the author table. *
            //***********************************************************************************************
            sql = "";

            myConferenceData.SetData(sql, trans);
        }
        myConferenceData.CommitTransaction(trans);

        // Indicate successful submission of a paper.
        lblSubmitResultMessage.Visible = true;
        lblSubmitResultMessage.Text = "Your paper '" + paperTitle + "' with paper number " + paperNumber + " has been successfully submitted.";

        // Reset the paper input form.
        txtTitle.Text = "";
        txtAbstract.Text = "";
        ddlSubmissionType.SelectedIndex = 0;
        ddlPCPaper.SelectedIndex = 0;
        gvAuthors.Visible = false;
        btnSubmitPaper.Visible = false;
    }
}