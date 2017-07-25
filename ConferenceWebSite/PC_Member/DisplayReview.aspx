<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DisplayReview.aspx.cs" Inherits="PC_Member_DisplayReview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div>
        <style type="text/css">
            .style1 {
                width: 800px;
            }

            .style10 {
                width: 800px;
            }

            .style14 {
                text-align: center;
                width: 128px;
                height: 21px;
            }

            .style13 {
                text-align: center;
                width: 128px;
            }

            .style15 {
                width: 94%;
            }

            .style16 {
                width: 145px;
            }

            .style19 {
                font-family: "Segoe UI";
                font-weight: bold;
                font-size: medium;
                color: #800000;
                text-decoration: underline;
            }

            .style20 {
                width: 657px;
            }

            .style22 {
                width: 91px;
                text-align: right;
            }

            .style23 {
                width: 91px;
                text-align: right;
                height: 21px;
            }

            .style24 {
                width: 657px;
                height: 21px;
            }

            .style25 {
                width: 100%;
            }

            .style26 {
                width: 145px;
            }

            .style27 {
                width: 145px;
            }

            .style29 {
                width: 759px;
            }

            .style30 {
                width: 750px;
            }

            .style31 {
                font-family: "Segoe UI";
                font-weight: bold;
                font-size: large;
                color: #800000;
                text-decoration: underline;
            }
            .auto-style2 {
                width: 100%;
            }
            .auto-style6 {
                width: 115px;
                text-align: right;
            }
            .auto-style8 {
                width: 115px;
                text-align: right;
                height: 21px;
            }
            .auto-style9 {
                width: 115px;
                text-align: right;
            }
            .auto-style10 {
                width: 282px;
                text-align: right;
            }
            .auto-style11 {
                width: 400px;
                text-align: right;
            }
        </style>

        <p class="style31">
            Display The Review/Discussion For A Paper — Add Discussion To A Paper
        </p>
        <p class="style5">
            <strong>Enter Your PC Code:&nbsp;</strong>
            <asp:TextBox ID="txtPcCode" runat="server" MaxLength="4" Width="39px"></asp:TextBox>
            &nbsp;<asp:Button ID="btnGetReviews" runat="server" OnClick="btnGetReviews_Click"
                Text="Get My Reviews" />
        </p>
        <p class="style5">
            <asp:Label ID="lblResultMessage" runat="server" Font-Bold="True"
                ForeColor="Blue" Visible="False"></asp:Label>
        </p>
        <asp:Panel ID="pnlPaperInformation" runat="server" Visible="False">
            <table class="style1">
                <tr>
                    <td class="auto-style6">
                        <asp:Label ID="lblPaperNumberLabel" runat="server" Font-Bold="True"
                            Text="Paper number:"></asp:Label>&nbsp;
                    </td>
                    <td class="style20">
                        <asp:DropDownList ID="ddlPaperNumber" runat="server" AutoPostBack="True"
                            OnSelectedIndexChanged="ddlPaperNumber_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="pnlRefereeReport" runat="server" Visible="False">
            <table class="style1">
                <tr>
                    <td class="auto-style9">
                        <asp:Label ID="lblTitleLabel" runat="server" Font-Bold="True" Text="Title:"></asp:Label>&nbsp;
                    </td>
                    <td class="style20">
                        <asp:Label ID="lblTitle" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">
                        <asp:Label ID="lblAuthorLabel" runat="server" Font-Bold="True"
                            Text="Author(s):"></asp:Label>&nbsp;
                    </td>
                    <td class="style24">
                        <asp:Label ID="lblAuthor" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <strong>
                <br />
                The paper is relevant to the conference:&nbsp;</strong>
            <asp:Label ID="lblRelevant" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;<strong>The paper is technically correct</strong>:&nbsp;
        <asp:Label ID="lblTechnicallyCorrect" runat="server"></asp:Label>
            <br />
            <br />
            <strong>The length and content of the paper are comparable to the expected final 
    version:&nbsp;</strong>
            <asp:Label ID="lblLengthAndContent" runat="server"></asp:Label>
            <br />
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
                        <asp:Label ID="lblOriginality" runat="server"></asp:Label>
                    </td>
                    <td class="style13">
                        <asp:Label ID="lblImpact" runat="server"></asp:Label>
                    </td>
                    <td class="style13">
                        <asp:Label ID="lblPresentation" runat="server"></asp:Label>
                    </td>
                    <td class="style13">
                        <asp:Label ID="lblTechnicalDepth" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="style13">
                        <asp:Label ID="lblOverallRating" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <strong>Reviewer Confidence (0.5-1):&nbsp;</strong>
            <asp:Label ID="lblConfidence" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;<strong>Best Paper Award (i.e., destined to become a classic)?&nbsp;</strong>
            <asp:Label ID="lblBestPaper" runat="server"></asp:Label>
            <br />
            <br />
            <table style="float:left" class="auto-style2">
                <tr>
                    <td style="vertical-align:top;" class="auto-style11">
                        <strong>Main Contribution(s):&nbsp;</strong></td>
                    <td>
                        <asp:TextBox ID="txtMainContributions" runat="server" Height="100px"
                            MaxLength="300" TextMode="MultiLine" Width="750px" ReadOnly="True" CssClass="auto-style2"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align:top;" class="auto-style11">
                        <strong>Three strong points of the paper:&nbsp;</strong></td>
                    <td>
                        <asp:TextBox ID="txtStrongPoints" runat="server" Height="100px" MaxLength="300"
                            TextMode="MultiLine" Width="750px" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align:top;" class="auto-style11">
                        <strong>Three weak points of the paper:&nbsp;</strong></td>
                    <td>
                        <asp:TextBox ID="txtWeakPoints" runat="server" Height="100px" MaxLength="300"
                            TextMode="MultiLine" Width="750px" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align:top;" class="auto-style11">
                        <strong>Overall Summary:&nbsp;</strong></td>
                    <td>
                        <asp:TextBox ID="txtOverallSummary" runat="server" Height="100px"
                            MaxLength="300" TextMode="MultiLine" Width="750px" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align:top;" class="auto-style11">
                        <strong>Detailed Comments:&nbsp;</strong></td>
                    <td>
                        <asp:TextBox ID="txtDetailedComments" runat="server" Height="100px"
                            MaxLength="1000" TextMode="MultiLine" Width="750px" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align:top;" class="auto-style11">
                        <strong>Confidential comments to the PC, if any:&nbsp;</strong></td>
                    <td>
                        <asp:TextBox ID="txtConfidentialComments" runat="server" Height="100px"
                            MaxLength="300" TextMode="MultiLine" Width="750px" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="pnlViewDiscussion" runat="server">
                <table class="style25">
                    <tr>
                        <td style="vertical-align:top;" class="style26">
                            <br />
                            <br />
                            <asp:Button ID="btnViewDiscussion" runat="server"
                                OnClick="btnViewDiscussion_Click" Text="View Discussion" />
                        </td>
                        <td>
                            <asp:Panel ID="pnlDiscussion" runat="server" Visible="False" Width="709px">
                                <span class="style19">Discussion For This Paper</span><br />
                                <asp:GridView ID="gvDiscussion" runat="server" Width="600px">
                                </asp:GridView>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <br />
        </asp:Panel>
        <asp:Panel ID="pnlAddNewDiscussion" runat="server" Visible="False">
            <table class="style29">
                <tr>
                    <td style="text-align:center;" class="style27">&nbsp;
                    </td>
                    <td class="style30">
                        <span class="style19">Add Comments To This Discussion</span></td>
                </tr>
                <tr>
                    <td style="text-align:center;" class="style27">
                        <asp:Button ID="btnAddToDiscussion0" runat="server"
                            OnClick="btnAddToDiscussion_Click" Text="Add" />
                    </td>
                    <td class="style30">
                        <asp:TextBox ID="txtNewDiscussion" runat="server" Height="60px" MaxLength="200"
                            TextMode="MultiLine" Width="750px"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <br />
        </asp:Panel>
    </div>
</asp:Content>

