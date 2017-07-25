<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="FindPaper.aspx.cs" Inherits="Author_FindPaper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div>
        <style type="text/css">
            .style1 {
                font-family: "Segoe UI";
                font-size: large;
                color: #800000;
                font-weight: bold;
                text-decoration: underline;
            }

            .style13 {
                width: 463px;
            }

            .style29 {
                width: 78px;
            }

            .style9 {
                width: 85px;
                text-align: right;
            }

            .style10 {
                width: 156px;
            }

            .style11 {
                width: 143px;
                text-align: right;
            }

            .style12 {
                width: 49px;
            }

            .style30 {
                width: 625px;
            }

            .style32 {
                width: 55px;
                text-align: right;
            }

            .style34 {
                width: 560px;
            }

            .auto-style2 {
                width: 544px;
            }

            .auto-style5 {
                width: 223px;
            }
            .auto-style6 {
                width: 146px;
            }
            .auto-style7 {
                width: 75px;
                text-align: right;
            }
            .auto-style8 {
                width: 647px;
            }
            .auto-style9 {
                line-height: 150%;
            }
        </style>
        <p class="style1">
            Paper Information
        </p>
        <p>
            <strong>Enter the paper number:&nbsp;</strong>
            <asp:TextBox ID="txtPaperNumber" runat="server" MaxLength="3" Width="48px"></asp:TextBox>
            &nbsp;<asp:Button ID="btnSearchPaper" runat="server" OnClick="btnSearchPaper_Click"
                Text="Search" />
        </p>
        <p>
            <asp:Label ID="lblSearchResultMessage" runat="server" Font-Bold="True"
                ForeColor="Blue"></asp:Label>
        </p>
        <table class="auto-style8">
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="lblTitleLabel" runat="server" Font-Bold="True" Text="Title:"
                        Visible="False"></asp:Label>
                &nbsp;</td>
                <td class="style34">
                    <asp:Label ID="lblTitle" runat="server" Width="560px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top;" class="auto-style7">
                    <p class="auto-style9">
                        <asp:Label ID="lblAbstractLabel" runat="server" Font-Bold="True"
                            Text="Abstract:" Visible="False"></asp:Label>
                        &nbsp;
                    </p>
                </td>
                <td style="vertical-align: top;" class="style34">
                    <asp:Label ID="lblAbstract" runat="server" Width="560px"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <table class="auto-style2">
            <tr>
                <td class="auto-style6">&nbsp;
                <asp:Label ID="lblSubmissionTypeLabel" runat="server" Font-Bold="True"
                    Text="Submission type:" Visible="False"></asp:Label>&nbsp;
                </td>
                <td class="auto-style5">
                    <asp:Label ID="lblSubmissionType" runat="server"></asp:Label>
                </td>
                <td class="style11">
                    <asp:Label ID="lblPcPaperlabel" runat="server" Font-Bold="True"
                        Text="PC paper:" Visible="False"></asp:Label>&nbsp;
                </td>
                <td class="style12">
                    <asp:Label ID="lblPcPaper" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <asp:Label ID="lblAuthorInfoLabel" runat="server" Font-Bold="True"
            Font-Size="Medium" Font-Underline="True" ForeColor="Maroon"
            Text="Author Information" Visible="False"></asp:Label>
        <br />
        <asp:GridView ID="gvAuthor" runat="server">
        </asp:GridView>
    </div>
</asp:Content>

