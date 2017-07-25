<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AssignPaper.aspx.cs" Inherits="PC_Chair_AssignPaper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div>
        <style type="text/css">
            .style1 {
                font-family: "Segoe UI";
                font-size: medium;
                color: #800000;
                font-weight: bold;
                text-decoration: underline;
            }

            .style2 {
                font-family: "Segoe UI";
                font-size: large;
                color: #800000;
                font-weight: bold;
                text-decoration: underline;
            }
        </style>

        <p class="style2">
            Assign A Paper To A PC Member
        </p>
        <strong>Paper Number:&nbsp;<asp:DropDownList ID="ddlPaperNumber" runat="server"
            OnSelectedIndexChanged="ddlPaperNumber_SelectedIndexChanged"
            AutoPostBack="True">
        </asp:DropDownList>
        </strong>
        <br />
        <br />
        <asp:Label ID="lblResultMessage" runat="server" Font-Bold="True"
            ForeColor="Blue"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lblPcMembersCurrentlyAssigned" runat="server" Font-Bold="True"
            Font-Size="Medium" Font-Underline="True" ForeColor="Maroon"
            Text="PC Members Assigned To:" Visible="False"></asp:Label>
                    <br />
                    <asp:Label ID="lblTitle" runat="server" Width="560px"></asp:Label>
        <p>
            <asp:GridView ID="gvCurrentlyAssigned" runat="server" Visible="False">
            </asp:GridView>
        </p>
        <p>
            <asp:Label ID="lblMinimumPreference" runat="server" Font-Bold="True"
                Text="Minimum preference: " Visible="False"></asp:Label>
            &nbsp;<asp:DropDownList ID="ddlMinimumPreference" runat="server"
                OnSelectedIndexChanged="ddlMinimumPreference_SelectedIndexChanged"
                AutoPostBack="True" Visible="False">
                <asp:ListItem>--Select Preference--</asp:ListItem>
                <asp:ListItem Value="None">None</asp:ListItem>
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem Value="4"></asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
            </asp:DropDownList>
        </p>
        <p class="style1">
            <asp:Label ID="lblAvailableForAssignment" runat="server"
                Text="PC Members Available To Be Assigned" Visible="False"></asp:Label>
        </p>
        <p>
            <asp:GridView ID="gvAvailableForAssignment" runat="server" Visible="False">
                <Columns>
                    <asp:TemplateField HeaderText="SELECT">
                        <EditItemTemplate>
                            <asp:CheckBox ID="chkSelected" runat="server" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSelected" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </p>
        <p>
            <asp:Button ID="btnAssignPcMember" runat="server"
                OnClick="btnAssignPcMember_Click" Text="Assign Selected PC Members"
                Visible="False" />
        </p>
    </div>
</asp:Content>

