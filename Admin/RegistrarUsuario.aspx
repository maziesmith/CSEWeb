<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="RegistrarUsuario.aspx.cs" Inherits="Admin_RegistrarUsuario"  Title="Registrar usuario"  %>

<%@ Register src="UserControls/MenuAdmin.ascx" tagname="MenuAdmin" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:MenuAdmin ID="MenuAdmin1" runat="server" />

    <div class="form">
        <h2>Registrar Usuario</h2>        
        
        <div class="row">
            <span class="label">Usuario:</span>
            <asp:TextBox ID="txt_usuario" MaxLength="100" runat="server" class="textbox"></asp:TextBox>
        </div>
        
        <div class="row">
            <span class="label">Contrase&ntilde;a</span>
            <asp:TextBox ID="txt_contrasena" MaxLength="100" runat="server" class="textbox"></asp:TextBox>
        </div>
        
        <asp:Button ID="btn_agregar" runat="server" Text="Agregar" class="button"
            onclick="btn_agregar_Click" />

    </div>

</asp:Content>

