<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="SubmitReview.aspx.cs" Inherits="PC_Member_SubmitReview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div>
        <style type="text/css">
            .style1 {
                width: 800px;
            }

            .style3 {
                font-family: "Segoe UI";
                font-size: large;
                color: #800000;
                font-weight: bold;
                text-decoration: underline;
            }

            .style4 {
                width: 91px;
                text-align: right;
            }

            .style5 {
                font-family: "Segoe UI";
            }

            .style10 {
                width: 748px;
            }

            .style13 {
                text-align: center;
                width: 128px;
            }

            .style14 {
                text-align: center;
                width: 128px;
                height: 21px;
            }

            .style15 {
                width: 100%;
            }

            .style17 {
                width: 699px;
            }

            .style18 {
                width: 138px;
            }
            .auto-style4 {
                width: 115px;
                text-align: right;
            }
            .auto-style6 {
                width: 400px;
                text-align: right;
            }
            .auto-style7 {
                line-height: 150%;
                text-align: left;
            }
            .auto-style8 {
                line-height: 150%;
                text-align: right;
            }
        </style>

        <p class="style3">
            Submit A Review
        </p>
        <p class="style5">
            <strong>Enter Your PC Code:&nbsp;</strong>
            <asp:TextBox ID="txtPcCode" runat="server" MaxLength="4" Width="39px"></asp:TextBox>
            &nbsp;<asp:Button ID="btnGetPaper" runat="server" OnClick="btnGetPaper_Click"
                Text="Get My Papers for Review" />
        </p>
        <p class="style5">
            <asp:Label ID="lblResultMessage" runat="server" Font-Bold="True"
                ForeColor="Blue" Visible="False"></asp:Label>
        </p>
        <table class="style1">
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="lblPaperNumberLabel" runat="server" Font-Bold="True"
                        Text="Paper number: " Visible="False"></asp:Label>&nbsp;
                </td>
                <td class="style17">
                    <asp:DropDownList ID="ddlPaperNumber" runat="server" AutoPostBack="True"
                        OnSelectedIndexChanged="ddlPaperNumber_SelectedIndexChanged" Visible="False">
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <asp:Panel ID="pnlPaperInformation" runat="server" Visible="False">
            <table class="style1">
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="lblTitleLabel" runat="server" Font-Bold="True" Text="Title:  "></asp:Label>&nbsp;
                    </td>
                    <td class="style17">
                        <asp:Label ID="lblTitle" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="lblAuthorLabel" runat="server" Font-Bold="True"
                            Text="Author(s): "></asp:Label>&nbsp;
                    </td>
                    <td class="style17">
                        <asp:Label ID="lblAuthor" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <br />
        <asp:Panel ID="pnlRefereeReport" runat="server" Visible="False">
            <strong>Use (Y)es or(N)o and if absolutely necessary (M)aybe to answer the 
        following (you must explain (N)o and (M)aybe answers in the comments section).</strong><br />
            <br />
            <strong>The paper is relevant to the conference:&nbsp;</strong>
            <asp:DropDownList ID="ddlPaperRelevant" runat="server">
                <asp:ListItem Value="Y">Yes</asp:ListItem>
                <asp:ListItem Value="N">No</asp:ListItem>
                <asp:ListItem Value="M">Maybe</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp; <strong>The paper is technically correct:&nbsp;</strong>
            <asp:DropDownList ID="ddlTechnicallyCorrect" runat="server">
                <asp:ListItem Value="Y">Yes</asp:ListItem>
                <asp:ListItem Value="N">No</asp:ListItem>
                <asp:ListItem Value="M">Maybe</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <strong>The length and content of the paper are comparable to the expected final version:&nbsp;</strong>
            <asp:DropDownList ID="ddlLengthAndContent" runat="server">
                <asp:ListItem Value="Y">Yes</asp:ListItem>
                <asp:ListItem Value="N">No</asp:ListItem>
                <asp:ListItem Value="M">Maybe</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <strong>For the following categories, please assign integer scores from 1 to 8.</strong><br />
            <table class="style10">
                <tr>
                    <td class="style14">
                        <strong>Originality</strong></td>
                    <td class="style14">
                        <strong>Impact</strong></td>
                    <td class="style14">
                        <strong>Presentation</strong></td>
                    <td class="style14">
                        <strong>Technical Depth</strong></td>
                    <td class="style14">
                        <strong>OVERALL RATING</strong></td>
                </tr>
                <tr>
                    <td class="style13">
                        <asp:DropDownList ID="ddlOriginality" runat="server">
                            <asp:ListItem Value="1">1 - Unacceptable</asp:ListItem>
                            <asp:ListItem Value="2">2 - Strong Reject</asp:ListItem>
                            <asp:ListItem Value="3">3 - Reject</asp:ListItem>
                            <asp:ListItem Value="4">4 - Weak Reject</asp:ListItem>
                            <asp:ListItem Value="5">5 - Neutral</asp:ListItem>
                            <asp:ListItem Value="6">6 - Weak Accept</asp:ListItem>
                            <asp:ListItem Value="7">7 - Accept</asp:ListItem>
                            <asp:ListItem Value="8">8 - Strong Accept</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="style13">
                        <asp:DropDownList ID="ddlImpact" runat="server">
                            <asp:ListItem Value="1">1 - Unacceptable</asp:ListItem>
                            <asp:ListItem Value="2">2 - Strong Reject</asp:ListItem>
                            <asp:ListItem Value="3">3 - Reject</asp:ListItem>
                            <asp:ListItem Value="4">4 - Weak Reject</asp:ListItem>
                            <asp:ListItem Value="5">5 - Neutral</asp:ListItem>
                            <asp:ListItem Value="6">6 - Weak Accept</asp:ListItem>
                            <asp:ListItem Value="7">7 - Accept</asp:ListItem>
                            <asp:ListItem Value="8">8 - Strong Accept</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="style13">
                        <asp:DropDownList ID="ddlPresentation" runat="server">
                            <asp:ListItem Value="1">1 - Unacceptable</asp:ListItem>
                            <asp:ListItem Value="2">2 - Strong Reject</asp:ListItem>
                            <asp:ListItem Value="3">3 - Reject</asp:ListItem>
                            <asp:ListItem Value="4">4 - Weak Reject</asp:ListItem>
                            <asp:ListItem Value="5">5 - Neutral</asp:ListItem>
                            <asp:ListItem Value="6">6 - Weak Accept</asp:ListItem>
                            <asp:ListItem Value="7">7 - Accept</asp:ListItem>
                            <asp:ListItem Value="8">8 - Strong Accept</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="style13">
                        <asp:DropDownList ID="ddlTechnicalDepth" runat="server">
                            <asp:ListItem Value="1">1 - Unacceptable</asp:ListItem>
                            <asp:ListItem Value="2">2 - Strong Reject</asp:ListItem>
                            <asp:ListItem Value="3">3 - Reject</asp:ListItem>
                            <asp:ListItem Value="4">4 - Weak Reject</asp:ListItem>
                            <asp:ListItem Value="5">5 - Neutral</asp:ListItem>
                            <asp:ListItem Value="6">6 - Weak Accept</asp:ListItem>
                            <asp:ListItem Value="7">7 - Accept</asp:ListItem>
                            <asp:ListItem Value="8">8 - Strong Accept</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="style13">
                        <asp:DropDownList ID="ddlOverallRating" runat="server">
                            <asp:ListItem Value="1">1 - Unacceptable</asp:ListItem>
                            <asp:ListItem Value="2">2 - Strong Reject</asp:ListItem>
                            <asp:ListItem Value="3">3 - Reject</asp:ListItem>
                            <asp:ListItem Value="4">4 - Weak Reject</asp:ListItem>
                            <asp:ListItem Value="5">5 - Neutral</asp:ListItem>
                            <asp:ListItem Value="6">6 - Weak Accept</asp:ListItem>
                            <asp:ListItem Value="7">7 - Accept</asp:ListItem>
                            <asp:ListItem Value="8">8 - Strong Accept</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <br />
            <strong>Reviewer Confidence (0.5-1):&nbsp;</strong>
            <asp:DropDownList ID="ddlConfidence" runat="server">
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>.9</asp:ListItem>
                <asp:ListItem>.8</asp:ListItem>
                <asp:ListItem>.7</asp:ListItem>
                <asp:ListItem>.6</asp:ListItem>
                <asp:ListItem>.5</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;<strong>Best Paper Award (i.e., destined to become a classic)?&nbsp;</strong>
            <asp:DropDownList ID="ddlBestPaper" runat="server">
                <asp:ListItem Value="N">No</asp:ListItem>
                <asp:ListItem Value="Y">Yes</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <table style="float:left" class="style15">
                <tr>
                    <td style="vertical-align:top;" class="auto-style6">
                        <p class="auto-style8">
                            <strong>Main Contribution(s):&nbsp;</strong></p>
                    </td>
                    <td>
                        <p class="auto-style7">
                            <asp:TextBox ID="txtMainContributions" runat="server" Height="100px" MaxLength="300" TextMode="MultiLine" Width="750px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvMainContributions" runat="server" ControlToValidate="txtMainContributions" EnableClientScript="False" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align:top;" class="auto-style6">
                        <p class="auto-style8">
                            <strong>Three strong points of the paper:&nbsp;</strong></p>
                    </td>
                    <td>
                        <p class="auto-style7">
                            <asp:TextBox ID="txtStrongPoints" runat="server" Height="100px" MaxLength="300" TextMode="MultiLine" Width="750px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvStrongPoints" runat="server" ControlToValidate="txtStrongPoints" EnableClientScript="False" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align:top;" class="auto-style6">
                        <p class="auto-style8">
                            <strong>Three weak points of the paper:&nbsp;</strong></p>
                    </td>
                    <td>
                        <p class="auto-style7">
                            <asp:TextBox ID="txtWeakPoints" runat="server" Height="100px" MaxLength="300" TextMode="MultiLine" Width="750px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvWeakPoints" runat="server" ControlToValidate="txtWeakPoints" EnableClientScript="False" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align:top;" class="auto-style6">
                        <p class="auto-style8">
                            <strong>Overall Summary:&nbsp;</strong></p>
                    </td>
                    <td>
                        <p class="auto-style7">
                            <asp:TextBox ID="txtOverallSummary" runat="server" Height="100px" MaxLength="300" TextMode="MultiLine" Width="750px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOverallSummary" EnableClientScript="False" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align:top;" class="auto-style6">
                        <p class="auto-style8">
                            <strong>Detailed Comments:&nbsp;</strong></p>
                    </td>
                    <td>
                        <p class="auto-style7">
                            <asp:TextBox ID="txtDetailedComments" runat="server" Height="100px" MaxLength="1000" TextMode="MultiLine" Width="750px"></asp:TextBox>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align:top;" class="auto-style6">
                        <p class="auto-style8">
                            <strong>Confidential comments to the PC, if any:&nbsp;</strong></p>
                    </td>
                    <td>
                        <p class="auto-style7">
                            <asp:TextBox ID="txtConfidentialComments" runat="server" Height="100px" MaxLength="300" TextMode="MultiLine" Width="750px"></asp:TextBox>
                        </p>
                    </td>
                </tr>
            </table>
            <br />
            <asp:Button ID="btnSubmitReview" runat="server" OnClick="btnSubmitReview_Click"
                Text="Submit Review" />
        </asp:Panel>
    </div>
</asp:Content>

