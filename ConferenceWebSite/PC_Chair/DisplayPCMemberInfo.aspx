<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DisplayPCMemberInfo.aspx.cs" Inherits="PC_Chair_DisplayPCMemberInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div>
        <style type="text/css">
            .style1 {
                font-family: "Segoe UI";
                font-size: large;
                color: #800000;
                text-decoration: underline;
                font-weight: bold;
            }
        </style>

        <p class="style1">
            PC Member Information
        </p>
        <br />
        <asp:Label ID="lblResultMessage" runat="server" ForeColor="Blue" Font-Bold="True"></asp:Label>
        <asp:GridView ID="gvPCMember" runat="server">
        </asp:GridView>
    </div>
</asp:Content>

