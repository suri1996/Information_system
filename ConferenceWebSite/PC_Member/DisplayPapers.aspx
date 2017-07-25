<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DisplayPapers.aspx.cs" Inherits="PC_Member_DisplayPapers" %>

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
        Paper Information
        </p>
        <p>
            <strong>Enter PC Code:&nbsp;</strong>
            <asp:TextBox ID="txtPcCode" runat="server" MaxLength="4" Width="45px"></asp:TextBox>
            &nbsp;<asp:Button ID="btnGetPapers" runat="server" OnClick="btnGetPapers_Click"
                Text="Get Papers" />
        </p>
        <p>
            <asp:Label ID="lblResultMessage" runat="server" Font-Bold="True"
                ForeColor="Blue"></asp:Label>
        </p>
        <asp:Panel ID="pnlPreferencesSpecified" runat="server" Visible="False">
            <p class="style1">
                Papers For Which You Have Already Specified A Preference
            </p>
            <p>
                <asp:GridView ID="gvPreferenceSpecified" runat="server">
                </asp:GridView>
            </p>
        </asp:Panel>
        <asp:Panel ID="pnlPreferencesNotSpecified" runat="server" Visible="False">
            <p class="style1">
                Papers For Which You Have Not Specified A Preference
            </p>
            <p>
                <asp:GridView ID="gvNoPreferenceSpecified" runat="server">
                    <Columns>
                        <asp:TemplateField HeaderText="PREFERENCE">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlPreference" runat="server">
                                    <asp:ListItem>--Select--</asp:ListItem>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </p>
            <p>
                <asp:Button ID="btnUpdatePreferences" runat="server"
                    Text="Update Preferences" OnClick="btnUpdatePreferences_Click" />
            </p>
        </asp:Panel>
    </div>
</asp:Content>

