<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Cursos.aspx.cs" Inherits="Cursos" Title="Cursos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        #content 
        {
            overflow: hidden;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <ul id="menu_cursos" class="menu_horizontal">
        <li><a href="Cursos.aspx?cod=PETR" class='menu_petr <%= es_menu_actual("PETR") %>'><%= TipoCurso.Obtener_nombre("PETR") %></a></li>
        <li><a href="Cursos.aspx?cod=COMP" class='menu_comp <%= es_menu_actual("COMP") %>'><%= TipoCurso.Obtener_nombre("COMP") %></a></li>
        <li><a href="Cursos.aspx?cod=CONT" class='menu_cont <%= es_menu_actual("CONT") %>'><%= TipoCurso.Obtener_nombre("CONT") %></a></li>
        <li><a href="Cursos.aspx?cod=PLAN" class='menu_plan <%= es_menu_actual("PLAN") %>'><%= TipoCurso.Obtener_nombre("PLAN") %></a></li>
        <li><a href="Cursos.aspx?cod=OTR" class='menu_otr <%= es_menu_actual("OTR") %>'><%= TipoCurso.Obtener_nombre("OTR") %></a></li>
        <li><a href="Cursos.aspx" class='menu_todos <%= es_menu_actual("TODOS") %>'>Todos los cursos</a></li>
    </ul>

    <div class="table">
        <asp:Label ID="lbl_cursos_petr" runat="server" CssClass="title" Text="" Visible="false"></asp:Label>
        <asp:Repeater ID="rpt_cursos_petr" runat="server"  Visible="false"
        onitemdatabound="rpt_cursos_ItemDataBound">
        <FooterTemplate>
            <asp:Label ID="lbl_empty" CssClass="empty" runat="server" Text="No existen registros a&uacute;n" Visible="false"></asp:Label>
            <div class="separator"></div>
        </FooterTemplate>
        <HeaderTemplate>
            <div class="row header">
                <div class="col medium">Nombre</div>
                <div class="col big">Descripci&oacute;n</div>
                <div class="col medium">Inicio</div>
                <div class="col medium">Duracion</div>
                <div class="col medium">Inscripcion</div>
                <div class="col medium">Inversion</div>
                <div class="col medium">Horario</div>
                <div class="col big">Requisitos</div>                
            </div>
        </HeaderTemplate>
        <ItemTemplate>
            <div class="row">
                <div class="col medium"><%# Eval("xCurso") %></div>
                <div class="col big"><%# Eval("xDescripcion") %></div>
                <div class="col medium"><%# Eval("fInicio", "{0:dd/MM/yyyy}") %></div>
                <div class="col medium"><%# Eval("xDuracion") %></div>
                <div class="col medium"><%# Eval("xInscripcion") %></div>
                <div class="col medium"><%# Eval("xInversion") %></div>
                <div class="col medium"><%# Eval("xHorario") %></div>
                <div class="col big"><%# Eval("xRequisitos") %></div>
                <%# Agregar_etiqueta(Eval("cCurso")) %>
            </div>
        </ItemTemplate>
        </asp:Repeater>
    </div>
    
    <div class="table">
        <asp:Label ID="lbl_cursos_comp" runat="server" CssClass="title" Text="" Visible="false"></asp:Label>
        <asp:Repeater ID="rpt_cursos_comp" runat="server"  Visible="false"
        onitemdatabound="rpt_cursos_ItemDataBound">
        <FooterTemplate>
            <asp:Label ID="lbl_empty" CssClass="empty" runat="server" Text="No existen registros a&uacute;n" Visible="false"></asp:Label>
            <div class="separator"></div>
        </FooterTemplate>
        <HeaderTemplate>
            <div class="row header">
                <div class="col medium">Nombre</div>
                <div class="col big">Descripci&oacute;n</div>
                <div class="col medium">Inicio</div>
                <div class="col medium">Duracion</div>
                <div class="col medium">Inscripcion</div>
                <div class="col medium">Inversion</div>
                <div class="col medium">Horario</div>
                <div class="col big">Requisitos</div>                
            </div>
        </HeaderTemplate>
        <ItemTemplate>
            <div class="row">
                <div class="col medium"><%# Eval("xCurso") %></div>
                <div class="col big"><%# Eval("xDescripcion") %></div>
                <div class="col medium"><%# Eval("fInicio", "{0:dd/MM/yyyy}") %></div>
                <div class="col medium"><%# Eval("xDuracion") %></div>
                <div class="col medium"><%# Eval("xInscripcion") %></div>
                <div class="col medium"><%# Eval("xInversion") %></div>
                <div class="col medium"><%# Eval("xHorario") %></div>
                <div class="col big"><%# Eval("xRequisitos") %></div>
                <%# Agregar_etiqueta(Eval("cCurso")) %>
            </div>
        </ItemTemplate>
        </asp:Repeater>
    </div>
    
    <div class="table">
        <asp:Label ID="lbl_cursos_cont" runat="server" CssClass="title" Text="" Visible="false"></asp:Label>
        <asp:Repeater ID="rpt_cursos_cont" runat="server"  Visible="false"
        onitemdatabound="rpt_cursos_ItemDataBound">
        <FooterTemplate>
            <asp:Label ID="lbl_empty" CssClass="empty" runat="server" Text="No existen registros a&uacute;n" Visible="false"></asp:Label>
            <div class="separator"></div>
        </FooterTemplate>
        <HeaderTemplate>
            <div class="row header">
                <div class="col medium">Nombre</div>
                <div class="col big">Descripci&oacute;n</div>
                <div class="col medium">Inicio</div>
                <div class="col medium">Duracion</div>
                <div class="col medium">Inscripcion</div>
                <div class="col medium">Inversion</div>
                <div class="col medium">Horario</div>
                <div class="col big">Requisitos</div>                
            </div>
        </HeaderTemplate>
        <ItemTemplate>
            <div class="row">
                <div class="col medium"><%# Eval("xCurso") %></div>
                <div class="col big"><%# Eval("xDescripcion") %></div>
                <div class="col medium"><%# Eval("fInicio", "{0:dd/MM/yyyy}") %></div>
                <div class="col medium"><%# Eval("xDuracion") %></div>
                <div class="col medium"><%# Eval("xInscripcion") %></div>
                <div class="col medium"><%# Eval("xInversion") %></div>
                <div class="col medium"><%# Eval("xHorario") %></div>
                <div class="col big"><%# Eval("xRequisitos") %></div>
                <%# Agregar_etiqueta(Eval("cCurso")) %>
            </div>
        </ItemTemplate>
        </asp:Repeater>
    </div>
    
    <div class="table">
        <asp:Label ID="lbl_cursos_plan" runat="server" CssClass="title" Text="" Visible="false"></asp:Label>
        <asp:Repeater ID="rpt_cursos_plan" runat="server"  Visible="false"
        onitemdatabound="rpt_cursos_ItemDataBound">
        <FooterTemplate>
            <asp:Label ID="lbl_empty" CssClass="empty" runat="server" Text="No existen registros a&uacute;n" Visible="false"></asp:Label>
            <div class="separator"></div>
        </FooterTemplate>
        <HeaderTemplate>
            <div class="row header">
                <div class="col medium">Nombre</div>
                <div class="col big">Descripci&oacute;n</div>
                <div class="col medium">Inicio</div>
                <div class="col medium">Duracion</div>
                <div class="col medium">Inscripcion</div>
                <div class="col medium">Inversion</div>
                <div class="col medium">Horario</div>
                <div class="col big">Requisitos</div>                
            </div>
        </HeaderTemplate>
        <ItemTemplate>
            <div class="row">
                <div class="col medium"><%# Eval("xCurso") %></div>
                <div class="col big"><%# Eval("xDescripcion") %></div>
                <div class="col medium"><%# Eval("fInicio", "{0:dd/MM/yyyy}") %></div>
                <div class="col medium"><%# Eval("xDuracion") %></div>
                <div class="col medium"><%# Eval("xInscripcion") %></div>
                <div class="col medium"><%# Eval("xInversion") %></div>
                <div class="col medium"><%# Eval("xHorario") %></div>
                <div class="col big"><%# Eval("xRequisitos") %></div>
                <%# Agregar_etiqueta(Eval("cCurso")) %>
            </div>
        </ItemTemplate>
        </asp:Repeater>
    </div>
    
    <div class="table">
        <asp:Label ID="lbl_cursos_otr" runat="server" CssClass="title" Text="" Visible="false"></asp:Label>
        <asp:Repeater ID="rpt_cursos_otr" runat="server"  Visible="false"
        onitemdatabound="rpt_cursos_ItemDataBound">
        <FooterTemplate>
            <asp:Label ID="lbl_empty" CssClass="empty" runat="server" Text="No existen registros a&uacute;n" Visible="false"></asp:Label>
            <div class="separator"></div>
        </FooterTemplate>
        <HeaderTemplate>
            <div class="row header">
                <div class="col medium">Nombre</div>
                <div class="col big">Descripci&oacute;n</div>
                <div class="col medium">Inicio</div>
                <div class="col medium">Duracion</div>
                <div class="col medium">Inscripcion</div>
                <div class="col medium">Inversion</div>
                <div class="col medium">Horario</div>
                <div class="col big">Requisitos</div>                
            </div>
        </HeaderTemplate>
        <ItemTemplate>
            <div class="row">
                <div class="col medium"><%# Eval("xCurso") %></div>
                <div class="col big"><%# Eval("xDescripcion") %></div>
                <div class="col medium"><%# Eval("fInicio", "{0:dd/MM/yyyy}") %></div>
                <div class="col medium"><%# Eval("xDuracion") %></div>
                <div class="col medium"><%# Eval("xInscripcion") %></div>
                <div class="col medium"><%# Eval("xInversion") %></div>
                <div class="col medium"><%# Eval("xHorario") %></div>
                <div class="col big"><%# Eval("xRequisitos") %></div>
                <%# Agregar_etiqueta(Eval("cCurso")) %>
            </div>
        </ItemTemplate>
        </asp:Repeater>
    </div>
    
</asp:Content>

