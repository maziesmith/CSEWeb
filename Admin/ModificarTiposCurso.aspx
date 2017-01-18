<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="ModificarTiposCurso.aspx.cs" Inherits="Admin_ModificarTiposCurso" Title="Modificar Tipos de Curso" %>

<%@ Register src="UserControls/MenuAdmin.ascx" tagname="MenuAdmin" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:MenuAdmin ID="MenuAdmin1" runat="server" />

    <div class="form">
        <h2>Informaci&oacute;n de Tipos de Curso</h2>        
        
        <div class="row">
            <span class="label">Tipo de Curso 1</span>
            <asp:TextBox ID="txt_tipocurso1" MaxLength="250" runat="server" class="textbox"></asp:TextBox>
        </div>
        
        <div class="row">
            <span class="label">Tipo de Curso 2</span>
            <asp:TextBox ID="txt_tipocurso2" MaxLength="250" runat="server" class="textbox"></asp:TextBox>
        </div>
        
        <div class="row">
            <span class="label">Tipo de Curso 3</span>
            <asp:TextBox ID="txt_tipocurso3" MaxLength="250" runat="server" class="textbox"></asp:TextBox>
        </div>
        
        <div class="row">
            <span class="label">Tipo de Curso 4</span>
            <asp:TextBox ID="txt_tipocurso4" MaxLength="250" runat="server" class="textbox"></asp:TextBox>
        </div>
        
        <div class="row">
            <span class="label">Tipo de Curso 5</span>
            <asp:TextBox ID="txt_tipocurso5" MaxLength="250" runat="server" class="textbox"></asp:TextBox>
        </div>
                
        <asp:Button ID="btn_modificar" runat="server" Text="Modificar" class="button"
            onclick="btn_modificar_Click" />
            
    </div>
            
</asp:Content>

