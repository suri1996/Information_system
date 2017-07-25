<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <h4 style="text-decoration: underline; color: #990000">Select Your Role</h4>
        <p>
            <asp:HyperLink ID="hlAuthor" runat="server" NavigateUrl="~/Author/AuthorDefault.aspx">Author</asp:HyperLink>
        </p>
        <p>
            <asp:HyperLink ID="hlPCChair" runat="server" NavigateUrl="~/PC_Chair/PC_ChairDefault.aspx">PC Chair</asp:HyperLink>
        </p>
        <p>
            <asp:HyperLink ID="hlPCMember" runat="server" NavigateUrl="~/PC_Member/PC_MemberDefault.aspx">PC Member</asp:HyperLink>
        </p>
    </div>
</asp:Content>
