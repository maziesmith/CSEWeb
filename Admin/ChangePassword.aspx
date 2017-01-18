<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="Admin_ChangePassword" Title="Cambiar password" %>

<%@ Register src="UserControls/MenuAdmin.ascx" tagname="MenuAdmin" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:MenuAdmin ID="MenuAdmin1" runat="server" />
    
    <asp:ChangePassword ID="ChangePassword1" runat="server" CssClass="login"
        MembershipProvider="CSESqlProvider" 
        CancelDestinationPageUrl="~/Admin/Admin.aspx" 
        ContinueDestinationPageUrl="~/Admin/Admin.aspx">
        <TitleTextStyle CssClass="title" />
    </asp:ChangePassword>

</asp:Content>

