<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="CrearCurso.aspx.cs" Inherits="Admin_CrearCurso" Title="Crear curso" %>

<%@ Register src="UserControls/MenuAdmin.ascx" tagname="MenuAdmin" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link rel="stylesheet" href="../public/styles/zebra_datepicker.css" type="text/css" />
        
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:MenuAdmin ID="MenuAdmin1" runat="server" />

    <div class="form">
        <h2>Informaci&oacute;n del curso</h2>        
        
        <div class="row">
            <span class="label">Nombre</span>
            <asp:TextBox ID="txt_nombre" MaxLength="100" runat="server" class="textbox"></asp:TextBox>
        </div>
        
        <div class="row">
            <span class="label">Tipo de curso</span>
            <asp:DropDownList ID="ddl_tipo" runat="server" DataSourceID="ods_tipo" class="dropdownlist"
                DataTextField="xTipoCurso" DataValueField="cTipoCurso">
            </asp:DropDownList>
            <asp:ObjectDataSource ID="ods_tipo" runat="server" DeleteMethod="Delete" 
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetData" 
                TypeName="CSEDataSetTableAdapters.Tipo_cursoTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_cTipoCurso" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="xTipoCurso" Type="String" />
                    <asp:Parameter Name="xCodigo" Type="String" />
                    <asp:Parameter Name="Original_cTipoCurso" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="xTipoCurso" Type="String" />
                    <asp:Parameter Name="xCodigo" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
        </div>
        
        <div class="row">
            <span class="label">Descripci&oacute;n</span>
            <asp:TextBox ID="txt_descripcion" MaxLength="500" runat="server" class="textbox"></asp:TextBox>
        </div>
        
        <div class="row">
            <span class="label">Fecha de inicio</span>
            <asp:TextBox ID="txt_finicio" runat="server" class="textbox datepicker"></asp:TextBox>
        </div>
        
        <div class="row">
            <span class="label">Duraci&oacute;n</span>
            <asp:TextBox ID="txt_duracion" MaxLength="100" runat="server" class="textbox"></asp:TextBox>
        </div>
        
        <div class="row">
            <span class="label">Inscripci&oacute;n</span>
            <asp:TextBox ID="txt_inscripcion" MaxLength="100" runat="server" class="textbox"></asp:TextBox>
        </div>
        
        <div class="row">
            <span class="label">Inversi&oacute;n</span>
            <asp:TextBox ID="txt_inversion" MaxLength="100" runat="server" class="textbox"></asp:TextBox>
        </div>
        
        <div class="row">
            <span class="label">Horario</span>
            <asp:TextBox ID="txt_horario" MaxLength="300" runat="server" class="textbox"></asp:TextBox>
        </div>
        
        <div class="row">
            <span class="label">Requisitos </span>
            <asp:TextBox ID="txt_requisitos" MaxLength="500" runat="server" class="textbox"></asp:TextBox>
        </div>
        
        <asp:Button ID="btn_agregar" runat="server" Text="Crear nuevo" class="button"
            onclick="btn_agregar_Click" />

    </div>
    
    <!-- Zebra_Datepicker -->
    <script type="text/javascript" src="../public/scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="../public/scripts/zebra_datepicker.js"></script>
    <%-- Se cambio esta sentencia para que funcionara el IE sin readonly
        a.settings.readonly_element&& d.attr("color","")--%>
    <script type="text/javascript">
        $(document).ready(function() {
            $('input.datepicker').Zebra_DatePicker({
                format: 'd/m/Y'
            }).removeAttr('readOnly');
        });
    </script>    
    <!-- End Zebra_Datepicker Required -->
    
</asp:Content>

