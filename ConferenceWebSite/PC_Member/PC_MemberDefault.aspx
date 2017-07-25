<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="PC_MemberDefault.aspx.cs" Inherits="PC_Member_PC_MemberDefault" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h4 style="text-decoration: underline; color: #990000">Select A PC Member Activity</h4>
    <p>
        <asp:HyperLink ID="hlDisplayPapers" runat="server" NavigateUrl="~/PC_Member/DisplayPapers.aspx">Display Papers And Reviewing Preferences</asp:HyperLink>
    </p>
        <p>
        <asp:HyperLink ID="hlDisplayReview" runat="server" NavigateUrl="~/PC_Member/DisplayReview.aspx">Display The Review/Discussion For A Paper</asp:HyperLink>
    </p>
    <p>
        <asp:HyperLink ID="hlSubmitReview" runat="server" NavigateUrl="~/PC_Member/SubmitReview.aspx">Submit A Review</asp:HyperLink>
    </p>
</asp:Content>

