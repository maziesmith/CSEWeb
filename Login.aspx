<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" Title="Iniciar sesión" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Login ID="Login1" runat="server" DisplayRememberMe="False"  CssClass="login"
    MembershipProvider="CSESqlProvider" DestinationPageUrl="~/Admin/Admin.aspx" 
        VisibleWhenLoggedIn="False">
        <TitleTextStyle CssClass="title" />
    </asp:Login>
</asp:Content>

