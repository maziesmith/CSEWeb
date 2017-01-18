<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MenuAdmin.ascx.cs" Inherits="Admin_UserControls_MenuAdmin" %>

<ul id="menu_cursos" class="menu_horizontal">
    <li><a href="Admin.aspx" class='menu_petr <%= es_menu_actual("Admin.") %>'>Inicio</a></li>
    <li><a href="ChangePassword.aspx" class='menu_comp <%= es_menu_actual("ChangePassword") %>'>Cambiar contrase&ntilde;a</a></li>
    <li><a href="ModificarTiposCurso.aspx" class='menu_cont <%= es_menu_actual("ModificarTiposCurso") %>'>Modificar Tipos de Curso</a></li>
    <li><a href="CrearCurso.aspx" class='menu_plan <%= es_menu_actual("CrearCurso") %>'>Crear Curso</a></li>
    <li><a href="AdministrarCursos.aspx" class='menu_otr <%= es_menu_actual("AdministrarCursos") %>'>Administrar Cursos</a></li>
    <li><a href="ModificarVariables.aspx" class='menu_todos <%= es_menu_actual("ModificarVariables") %>'>Modificar Variables</a></li>
</ul>
