<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="ModificarVariables.aspx.cs" Inherits="Admin_ModificarVariables" Title="Modificar Variables" %>

<%@ Register src="UserControls/MenuAdmin.ascx" tagname="MenuAdmin" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:MenuAdmin ID="MenuAdmin1" runat="server" />

    <div class="form">
        <h2>Informaci&oacute;n de variables</h2>        
        
        <div class="row">
            <span class="label">Tel&eacute;fono</span>
            <asp:TextBox ID="txt_telefono" MaxLength="100" runat="server" class="textbox"></asp:TextBox>
        </div>
        
        <div class="row">
            <span class="label">Email</span>
            <asp:TextBox ID="txt_email" MaxLength="100" runat="server" class="textbox"></asp:TextBox>
        </div>
        
        <div class="row">
            <span class="label">Informaci&oacute;n adicional</span>
            <asp:TextBox ID="txt_info_adicional" MaxLength="500" runat="server" class="textbox"></asp:TextBox>
        </div>
                
        <asp:Button ID="btn_modificar" runat="server" Text="Modificar" class="button"
            onclick="btn_modificar_Click" />

    </div>
    
</asp:Content>

