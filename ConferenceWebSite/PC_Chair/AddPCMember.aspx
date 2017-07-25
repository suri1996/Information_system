<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddPCMember.aspx.cs" Inherits="PC_Chair_AddPCMember" %>

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

            .style18 {
                text-align: left;
            }

            .style26 {
                width: 506px;
            }

            .style28 {
                width: 69px;
                text-align: right;
            }

            .style29 {
                text-align: right;
            }

            .style30 {
                width: 208px;
            }

            .style31 {
                text-align: left;
                width: 142px;
            }

            .style32 {
                width: 100px;
            }

            .auto-style3 {
                text-align: left;
                width: 267px;
            }

            .auto-style4 {
                width: 267px;
            }

            .auto-style5 {
                width: 624px;
            }

            .auto-style8 {
                text-align: left;
                width: 279px;
            }

            .auto-style9 {
                text-align: right;
                width: 45px;
            }

            .auto-style10 {
                width: 145px;
                text-align: right;
            }
        </style>

        <p class="style1">
            Add A PC Member
        </p>
        <table class="auto-style5">
            <tr>
                <td class="auto-style10">
                    <strong>PC code:&nbsp;</strong>
                </td>
                <td class="auto-style8">
                    <strong>
                        <asp:TextBox ID="txtPcCode" runat="server" Width="45px" MaxLength="4"></asp:TextBox>
                    </strong>
                </td>
                <td class="style29" colspan="2">&nbsp;
                </td>
                <td class="auto-style3">&nbsp;
                </td>
            </tr>
            <tr>
                <td class="auto-style10">
                    <strong>Name:&nbsp;</strong></td>
                <td colspan="2" class="style32">
                    <asp:TextBox ID="txtName" runat="server" Width="200px" MaxLength="50"></asp:TextBox>
                </td>
                <td class="auto-style9">
                    <strong>Title:&nbsp;</strong></td>
                <td class="auto-style4">
                    <asp:DropDownList ID="ddlTitle" runat="server">
                        <asp:ListItem>None</asp:ListItem>
                        <asp:ListItem>Prof</asp:ListItem>
                        <asp:ListItem>Dr</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">
                    <strong>Institution:&nbsp;</strong>
                </td>
                <td colspan="4">
                    <asp:TextBox ID="txtInstitution" runat="server" MaxLength="100" Width="415px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">
                    <strong>Country:&nbsp;</strong>
                </td>
                <td colspan="4">
                    <asp:TextBox ID="txtCountry" runat="server" MaxLength="30" Width="300px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">
                    <strong>Email:&nbsp;</strong></td>
                <td colspan="4">
                    <asp:TextBox ID="txtEmail" runat="server" Width="300px"
                        MaxLength="50" TextMode="Email"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">
                    <strong>Phone number:&nbsp;</strong></td>
                <td colspan="4">
                    <asp:TextBox ID="txtPhoneNumber" runat="server" MaxLength="20"
                        Width="200px"></asp:TextBox>
                </td>
            </tr>
        </table>
        <br />
        <asp:Label ID="lblSubmitResultMessage" runat="server" Font-Bold="True"
            ForeColor="Blue"></asp:Label>
        <br />
        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click"
            Text="Submit" />
    </div>
</asp:Content>

