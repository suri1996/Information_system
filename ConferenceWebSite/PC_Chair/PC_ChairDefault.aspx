<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="PC_ChairDefault.aspx.cs" Inherits="PC_Chair_PC_ChairDefault" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div>
        <h4 style="text-decoration: underline; color: #990000">Select A PC Chair Activity</h4>
        <p>
            <asp:HyperLink ID="hlAddPCMember" runat="server" NavigateUrl="~/PC_Chair/AddPCMember.aspx">Add A PC Member</asp:HyperLink>
        </p>
                <p>
            <asp:HyperLink ID="hlAssignPapers" runat="server" NavigateUrl="~/PC_Chair/AssignPaper.aspx">Assign A Paper To A PC Member</asp:HyperLink>
        </p>
        <p>
            <asp:HyperLink ID="hlDisplayPCMember" runat="server" NavigateUrl="~/PC_Chair/DisplayPCMemberInfo.aspx">Display PC Member Information</asp:HyperLink>
        </p>
    </div>
</asp:Content>

