<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin_Admin" Title="Administrador" %>

<%@ Register src="UserControls/MenuAdmin.ascx" tagname="MenuAdmin" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:MenuAdmin ID="MenuAdmin1" runat="server" />
    
    <h2>Administrador</h2>

    <ul class="menu_vertical">
        <li><a href="RegistrarUsuario.aspx">Registrar usuario</a></li>  
        <li><a href="ChangePassword.aspx">Cambiar contrase&ntilde;a</a></li>
        <li><a href="ModificarTiposCurso.aspx">Modificar tipos de curso</a></li>
        <li><a href="CrearCurso.aspx">Crear curso</a></li>
        <li><a href="AdministrarCursos.aspx">Administrar cursos</a></li>
        <li><a href="ModificarVariables.aspx">Modificar variables</a></li>        
    </ul>

</asp:Content>

