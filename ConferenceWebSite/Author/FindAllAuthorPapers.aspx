<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="FindAllAuthorPapers.aspx.cs" Inherits="Author_FindAllAuthorPapers" %>

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

            </style>
        <p class="style1">
            Paper Information
        </p>
        <p>
            <strong>Enter your email address:&nbsp;</strong>
            <asp:TextBox ID="txtEmail" runat="server" MaxLength="50" Width="300px" TextMode="Email"></asp:TextBox>
            &nbsp;<asp:Button ID="btnSearchPaper" runat="server" OnClick="btnSearchPaper_Click"
                Text="Search" />
        </p>
        <p>
            <asp:Label ID="lblSearchResultMessage" runat="server" Font-Bold="True"
                ForeColor="Blue"></asp:Label>
        </p>
        <asp:Label ID="lblPaperInfoLabel" runat="server" Font-Bold="True"
            Font-Size="Medium" Font-Underline="True" ForeColor="Maroon"
            Text="Paper Information" Visible="False"></asp:Label>
        <br />
        <asp:GridView ID="gvPaper" runat="server">
        </asp:GridView>
    </div>
</asp:Content>

