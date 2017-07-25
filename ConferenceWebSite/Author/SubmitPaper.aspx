<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="SubmitPaper.aspx.cs" Inherits="Author_SubmitPaper" %>

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

            .style2 {
                width: 648px;
            }

            .style7 {
                margin-left: 0px;
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

            .style13 {
                width: 463px;
            }

            .style17 {
                width: 55px;
                text-align: right;
            }

            .style19 {
                width: 109px;
            }

            .style21 {
                font-family: "Segoe UI";
                font-weight: bold;
                font-size: medium;
                color: #800000;
                text-decoration: underline;
            }

            .style23 {
                width: 641px;
            }

            .style24 {
                width: 458px;
            }

            .style25 {
                width: 215px;
            }

            .style26 {
                width: 69px;
                text-align: right;
            }

            .style29 {
                width: 78px;
            }

            .style30 {
                width: 109px;
                text-align: right;
            }

            .style31 {
                width: 583px;
            }

            .auto-style1 {
                width: 118px;
            }

            .auto-style2 {
                width: 85px;
            }

            .auto-style4 {
                width: 655px;
            }
            .auto-style7 {
                width: 677px;
            }
            .auto-style8 {
                width: 97px;
                text-align: right;
            }
            .auto-style10 {
                width: 97px;
            }
            .auto-style12 {
                width: 159px;
                text-align: right;
            }
            .auto-style13 {
                width: 123px;
                text-align: right;
            }
            .auto-style15 {
                width: 111px;
                text-align: right;
            }
        </style>
        <p class="style1">
            Submit A Paper
        </p>
        <table class="auto-style4">
            <tr>
                <td class="style17">
                    <strong>Title:&nbsp;</strong></td>
                <td class="style31">
                    <strong>
                        <asp:TextBox ID="txtTitle" runat="server" MaxLength="50" Width="650px"></asp:TextBox>
                    </strong>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top;" class="style17">
                    <strong>Abstract:&nbsp;</strong></td>
                <td style="vertical-align: top;" class="style31">
                    <asp:TextBox ID="txtAbstract" runat="server" CssClass="style7" Height="100px"
                        MaxLength="300" TextMode="MultiLine" Width="650px"></asp:TextBox>
                </td>
            </tr>
        </table>
        <br />
        <table>
            <tr>
                <td class="auto-style13">
                    <strong>Sunmission type:&nbsp;</strong></td>
                <td class="auto-style1">
                    <strong>
                        <asp:DropDownList ID="ddlSubmissionType" runat="server">
                            <asp:ListItem Value="research">Research</asp:ListItem>
                            <asp:ListItem Value="vision">Vision</asp:ListItem>
                            <asp:ListItem Value="industrial">Industrial</asp:ListItem>
                            <asp:ListItem Value="demo">Demo</asp:ListItem>
                        </asp:DropDownList>
                    </strong>
                </td>
                <td class="auto-style12">
                    <strong>Is this a PC paper?&nbsp;</strong></td>
                <td class="auto-style2">
                    <strong>
                        <asp:DropDownList ID="ddlPCPaper" runat="server">
                            <asp:ListItem Value="N">No</asp:ListItem>
                            <asp:ListItem Value="Y">Yes</asp:ListItem>
                        </asp:DropDownList>
                    </strong>
                </td>
            </tr>
        </table>
        <br />
        <span class="style21">Add An Author</span><br />
        <table class="auto-style7">
            <tr>
                <td class="auto-style8">
                    <strong>Title:</strong>
                    <asp:DropDownList ID="ddlTitle" runat="server">
                        <asp:ListItem>None</asp:ListItem>
                        <asp:ListItem>Mr</asp:ListItem>
                        <asp:ListItem>Ms</asp:ListItem>
                        <asp:ListItem>Miss</asp:ListItem>
                        <asp:ListItem>Dr</asp:ListItem>
                        <asp:ListItem>Prof</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style15">
                    <strong>Name:&nbsp;</strong></td>
                <td class="style24">
                    <asp:TextBox ID="txtAuthorName" runat="server" MaxLength="50" Width="450px"
                        Wrap="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">&nbsp;
                </td>
                <td style="vertical-align: top;" class="auto-style15">
                    <strong>Institution:&nbsp;</strong></td>
                <td style="vertical-align: top;" class="style24">
                    <asp:TextBox ID="txtInstitution" runat="server" Height="36px" MaxLength="100"
                        Width="450px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style15">
                    <strong>Country:&nbsp;</strong></td>
                <td class="style24">
                    <asp:TextBox ID="txtCountry" runat="server" MaxLength="30" Width="300px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">&nbsp;
                </td>
                <td class="auto-style15">
                    <strong>Email:&nbsp;</strong></td>
                <td class="style24">
                    <asp:TextBox ID="txtEmail" runat="server" MaxLength="50" Width="300px" TextMode="Email"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style15">
                    <strong>Phone number:&nbsp;</strong></td>
                <td class="style24">
                    <asp:TextBox ID="txtPhoneNumber" runat="server" MaxLength="20" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="text-center" colspan="2">
                    <asp:Button ID="btnAddAuthor" runat="server" OnClick="btnAddAuthor_Click"
                        Text="Add Author" />
                </td>
                <td class="style24">
                    <strong>Contact author?&nbsp;</strong>
                    <asp:DropDownList ID="ddlContactAuthor" runat="server">
                        <asp:ListItem Value="N">No</asp:ListItem>
                        <asp:ListItem Value="Y">Yes</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <br />
        <asp:Label ID="lblPaperAuthors" runat="server" Font-Bold="True"
            Font-Size="Medium" Font-Underline="True" ForeColor="Maroon"
            Text="Paper Authors" Visible="False"></asp:Label>
        <asp:GridView ID="gvAuthors"
            runat="server" ShowHeaderWhenEmpty="True">
        </asp:GridView>
        <br />
        <asp:Button ID="btnSubmitPaper" runat="server" OnClick="btnSubmitPaper_Click"
            Text="Submit Paper" Visible="False" />
        <br />
        <br />
        <asp:Label ID="lblSubmitResultMessage" runat="server" ForeColor="Blue"
            Font-Bold="True"></asp:Label>
    </div>
</asp:Content>

