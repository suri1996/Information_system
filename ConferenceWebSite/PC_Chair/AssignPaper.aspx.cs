using ConferenceWebsite.App_code;
using Oracle.DataAccess.Client;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PC_Chair_AssignPaper : System.Web.UI.Page
{
    //**********************************
    // There are 6 TODOs on this page. *
    //**********************************

    ConferenceData myConferenceData = new ConferenceData();
    private DataTable dtPaperNumber;
    private DataTable dtPaperTitle;
    private DataTable dtCurrentlyAssigned;
    private DataTable dtAvailableForAssignment;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Populate_PaperNumber_DropDownList();
        }
    }

    protected void Populate_PaperNumber_DropDownList()
    {
        lblTitle.Visible = false;
        //****************************************************************
        // TODO 1: Construct the SQL statement to retrieve all the paper *
        //         numbers to populate the paper number dropdown list.   *
        //****************************************************************
        string sql = "";

        // Retrieve the paper information.
        dtPaperNumber = myConferenceData.GetData(sql);
        // If DataTable is null an SQL error occurred, so exit.
        if (dtPaperNumber == null)
        {
            lblResultMessage.Text = "*** There is an error in the SQL statement that retrieves all the paper numbers.";
            lblResultMessage.Visible = true;
            return;
        }

        ddlPaperNumber.DataSource = dtPaperNumber;
        ddlPaperNumber.DataValueField = "paper_number";
        ddlPaperNumber.DataTextField = "paper_number";
        ddlPaperNumber.DataBind();
        ddlPaperNumber.Items.Insert(0, "--Select Paper--");
    }

    protected void Populate_Currently_Assigned(string paperNumber)
    {
        //***********************************************************************************
        // TODO 2: Construct the SQL statement to retrieve the title of the selected paper. *
        //***********************************************************************************
        string sql = "";

        // Retrieve the paper information; exit if an SQL error occurred.
        dtPaperTitle = myConferenceData.GetData(sql);
        // If DataTable is null an SQL error occurred, so exit.
        if (dtPaperTitle == null)
        {
            lblResultMessage.Text = "*** There is an error in the SQL statement that retrieves the title of the selected paper.";
            lblResultMessage.Visible = true;
            return;
        }

        lblTitle.Text = dtPaperTitle.Rows[0]["Title"].ToString();
        lblTitle.Visible = true;

        //*****************************************************************************************
        // TODO 3: Construct the SQL statement to retrieve the PC members already assigned to the *
        //         selected paper. For each PC member, display the PC code and PC member name.    *
        //*****************************************************************************************
        sql = "";

        dtCurrentlyAssigned = myConferenceData.GetData(sql);
        // If DataTable is null, an SQL error occurred, so exit.
        if (dtCurrentlyAssigned == null)
            {
                lblResultMessage.Text = "*** There is an error in the SQL statement that retrieves the PC members already assigned to the selected paper.";
                lblResultMessage.Visible = true;
                return;
            }
        gvCurrentlyAssigned.DataSource = dtCurrentlyAssigned;
        gvCurrentlyAssigned.DataBind();

        // Show result message.
        if (dtCurrentlyAssigned.Rows.Count == 0)
        {
            lblResultMessage.Text = "There are no PC members assigned to this paper.";
            lblResultMessage.Visible = true;
        }
        else
        {
            for (int i = 0; i < gvCurrentlyAssigned.Rows.Count; i++)
            {
                gvCurrentlyAssigned.Rows[i].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
            lblResultMessage.Visible = false;
        }
        Show_Currently_Assigned();
        Hide_Available_For_Assignment();
    }

    protected void Populate_Available_For_Assignment(string paperNumber, string preference)
    {
        // *** DO NOT CHANGE THIS SQL VALUE!!!! Leave it empty. ***
        string sql = "";
        if (preference != "None")
        {
            //*******************************************************************************************
            // TODO 4: Construct the SQL statement to retrieve the PC members available for assignment  *
            //         to the selected paper WHO HAVE specified a preference for the paper greater than *
            //         or equal to the selected preference. For each PC member, display the PC code,    *
            //         preference for the selected paper and the number of the papers already assigned. *
            //*******************************************************************************************
            sql = "";
        }
        else
        {
            //*************************************************************************************************
            // TODO 5: Construct the SQL statement to retrieve the PC members available for assignment to the *
            //         selected paper WHO HAVE NOT specified a preference for the paper. For each PC member   *
            //         display the PC code, preference set as null and number of papers already assigned.     *
            //*************************************************************************************************
            sql = "";
        }
        dtAvailableForAssignment = myConferenceData.GetData(sql);
        // If DataTable is null an SQL error occurred, so exit.
        if (dtAvailableForAssignment == null)
        {
            lblResultMessage.Text = "*** There is an error in the SQL statement that retrieves the PC members available for assignment to the selected paper.";
            lblResultMessage.Visible = true;
            return;
        }

        gvAvailableForAssignment.DataSource = dtAvailableForAssignment;
        gvAvailableForAssignment.DataBind();

        // Show result message.
        if (dtAvailableForAssignment.Rows.Count == 0)
        {
            if (ddlMinimumPreference.SelectedValue == "None")
            {
                lblResultMessage.Text = "All PC members have specified a preference for this paper.";
            }
            else
            {
                lblResultMessage.Text = "There are currently no PC members that have specified a preference >= "
                    + ddlMinimumPreference.SelectedValue + " for this paper.";
            }
            lblResultMessage.Visible = true;
            Hide_Available_For_Assignment();
        }
        else
        {
            lblResultMessage.Visible = false;
            for (int i = 0; i < gvAvailableForAssignment.Rows.Count; i++)
            {
                for (int j = 0; j < gvAvailableForAssignment.Rows[i].Cells.Count; j++)
                {
                    gvAvailableForAssignment.Rows[i].Cells[j].HorizontalAlign = HorizontalAlign.Center;
                }
            }
            Show_Available_For_Assignment();
        }
    }

    protected void btnAssignPcMember_Click(object sender, EventArgs e)
    {
        OracleTransaction trans = myConferenceData.BeginTransaction();
        string paperNumber = ddlPaperNumber.SelectedValue;
        string pcCode = "";

        // Determine if any pc member was selected for this paper.
        foreach (GridViewRow row in gvAvailableForAssignment.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                CheckBox chkRow = (row.Cells[0].FindControl("chkSelected") as CheckBox);
                if (chkRow != null && chkRow.Checked)
                {
                    // Get the pc code.
                    pcCode = row.Cells[1].Text;
                    //****************************************************************************************
                    // TODO 6: Construct the SQL statement to insert a reviewing assignment for a PC member. *
                    //****************************************************************************************
                    string sql = "";

                    myConferenceData.SetData(sql, trans);

                }
            }
        }
        myConferenceData.CommitTransaction(trans);

        // Show result message and refresh the web form.
        if (pcCode != "")
        {
            lblResultMessage.Text = "The selected PC members have been successfully assigned to paper number " + paperNumber + ".";
            Populate_Currently_Assigned(paperNumber);
            Show_Currently_Assigned();
            Hide_Available_For_Assignment();
        }
        else
        {
            lblResultMessage.Text = "No PC member was selected for assignment.";
        }
        lblResultMessage.Visible = true;
    }

    protected void ddlPaperNumber_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlPaperNumber.SelectedValue != "")
        {
            Populate_Currently_Assigned(ddlPaperNumber.SelectedValue);
        }
        else
        {
            return;
        }
    }

    protected void ddlMinimumPreference_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlMinimumPreference.SelectedIndex != 0)
        {
            Populate_Available_For_Assignment(ddlPaperNumber.SelectedValue, ddlMinimumPreference.SelectedValue);
        }
        else
        {
            Hide_Available_For_Assignment();
            lblResultMessage.Visible = false;
        }
    }

    protected void Show_Currently_Assigned()
    {
        lblPcMembersCurrentlyAssigned.Visible = true;
        gvCurrentlyAssigned.Visible = true;
        lblMinimumPreference.Visible = true;
        ddlMinimumPreference.Visible = true;
        ddlMinimumPreference.SelectedIndex = 0;
    }

    protected void Hide_Currently_Assigned()
    {
        lblPcMembersCurrentlyAssigned.Visible = false;
        gvCurrentlyAssigned.Visible = false;
    }

    protected void Show_Available_For_Assignment()
    {
        lblAvailableForAssignment.Visible = true;
        gvAvailableForAssignment.Visible = true;
        btnAssignPcMember.Visible = true;
    }

    protected void Hide_Available_For_Assignment()
    {
        lblAvailableForAssignment.Visible = false;
        gvAvailableForAssignment.Visible = false;
        btnAssignPcMember.Visible = false;
    }
}