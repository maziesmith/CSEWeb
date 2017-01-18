<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="AdministrarCursos.aspx.cs" Inherits="Admin_AdministrarCursos" Title="Administrar cursos" EnableEventValidation="false" %>

<%@ Register src="UserControls/MenuAdmin.ascx" tagname="MenuAdmin" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        #content 
        {
            overflow: visible;
        }
        .table .row 
        {
            width: 1330px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:MenuAdmin ID="MenuAdmin1" runat="server" />
    
    <div class="table">
        <h2><%= TipoCurso.Obtener_nombre("PETR") %></h2>
        <asp:Repeater ID="rpt_cursos_petr" runat="server" 
        onitemcommand="rpt_cursos_ItemCommand" onitemdatabound="rpt_cursos_ItemDataBound">
        <FooterTemplate>
            <asp:Label ID="lbl_empty" CssClass="empty" runat="server" Text="No existen registros a&uacute;n" Visible="false"></asp:Label>
            <div class="separator"></div>
        </FooterTemplate>
        <HeaderTemplate>
            <div class="row header">
                <div class="col small">Mod.</div>
                <div class="col small">Elim.</div>
                <div class="col small">Publ.</div>
                <div class="col small">Pos.</div>
                <div class="col medium">Nombre</div>
                <%--<div class="col medium">Tipo de curso</div>--%>
                <div class="col big">Descripci&oacute;n</div>
                <div class="col medium">Inicio</div>
                <div class="col medium">Duracion</div>
                <div class="col medium">Inscripcion</div>
                <div class="col medium">Inversion</div>
                <div class="col medium">Horario</div>
                <div class="col big">Requisitos</div>                
                <div class="col medium">creaci&oacute;n</div>
                <div class="col medium">&uacute;ltima modif.</div>
            </div>
        </HeaderTemplate>
        <ItemTemplate>
            <div class="row">
                <div class="col small"><a href='CrearCurso.aspx?id=<%# Eval("cCurso") %>'><img src="../public/images/modificar.png" alt="Modificar" title="Modificar" /></a></div>
                <div class="col small"><asp:ImageButton ID="btn_eliminar" AlternateText="Eliminar" runat="server" CommandName="Eliminar" CommandArgument='<%# Eval("cCurso") %>' OnClientClick='return confirm("¿Está seguro de eliminar este registro?");' ImageUrl="~/public/images/eliminar.png" title="Eliminar" /></div>
                <div class="col small">
                    <asp:ImageButton ID="btn_publicar" AlternateText='<%# verificar_publicado(Eval("iPublicado"))? "Publicar": "No publicar" %>' OnClientClick='return confirm("¿Está seguro de realizar hacer esta operación?");' runat="server" CommandName="Publicar" CommandArgument='<%# Eval("cCurso") %>' ImageUrl='<%# verificar_publicado(Eval("iPublicado"))? "~/public/images/checked.png": "~/public/images/unchecked.png" %>' title='<%# verificar_publicado(Eval("iPublicado"))? "Publicar": "No publicar" %>' />
                </div>
                <div class="col small">
                    <asp:ImageButton ID="btn_subir" AlternateText="Subir" runat="server" CommandName="Subir" CommandArgument='<%# Eval("cCurso") %>' ImageUrl="~/public/images/subir.png" title="Subir" />
                    <asp:ImageButton ID="btn_bajar" AlternateText="Bajar" runat="server" CommandName="Bajar" CommandArgument='<%# Eval("cCurso") %>' ImageUrl="~/public/images/bajar.png" title="Bajar" />
                </div>
                <div class="col medium"><%# Eval("xCurso") %></div>
                <%--<div class="col medium"><%# Eval("cTipoCurso") %></div>--%>
                <div class="col big"><%# Eval("xDescripcion") %></div>
                <div class="col medium"><%# Eval("fInicio", "{0:dd/MM/yyyy}") %></div>
                <div class="col medium"><%# Eval("xDuracion") %></div>
                <div class="col medium"><%# Eval("xInscripcion") %></div>
                <div class="col medium"><%# Eval("xInversion") %></div>
                <div class="col medium"><%# Eval("xHorario") %></div>
                <div class="col big"><%# Eval("xRequisitos") %></div>
                <div class="col medium"><%# Eval("fCreacion") %></div>
                <div class="col medium"><%# Eval("fUltModificacion") %></div>
            </div>
        </ItemTemplate>
        </asp:Repeater>
    </div>
    
    <div class="table">
        <h2><%= TipoCurso.Obtener_nombre("COMP") %></h2>
        <asp:Repeater ID="rpt_cursos_comp" runat="server" 
        onitemcommand="rpt_cursos_ItemCommand" onitemdatabound="rpt_cursos_ItemDataBound">
        <FooterTemplate>
            <asp:Label ID="lbl_empty" CssClass="empty" runat="server" Text="No existen registros a&uacute;n" Visible="false"></asp:Label>
            <div class="separator"></div>
        </FooterTemplate>
        <HeaderTemplate>
            <div class="row header">
                <div class="col small">Mod.</div>
                <div class="col small">Elim.</div>
                <div class="col small">Publ.</div>
                <div class="col small">Pos.</div>
                <div class="col medium">Nombre</div>
                <%--<div class="col medium">Tipo de curso</div>--%>
                <div class="col big">Descripci&oacute;n</div>
                <div class="col medium">Inicio</div>
                <div class="col medium">Duracion</div>
                <div class="col medium">Inscripcion</div>
                <div class="col medium">Inversion</div>
                <div class="col medium">Horario</div>
                <div class="col big">Requisitos</div>        
                <div class="col medium">creaci&oacute;n</div>
                <div class="col medium">&uacute;ltima modif.</div>        
            </div>
        </HeaderTemplate>
        <ItemTemplate>
            <div class="row">
                <div class="col small"><a href='CrearCurso.aspx?id=<%# Eval("cCurso") %>'><img src="../public/images/modificar.png" alt="Modificar" title="Modificar" /></a></div>
                <div class="col small"><asp:ImageButton ID="btn_eliminar" AlternateText="Eliminar" runat="server" CommandName="Eliminar" CommandArgument='<%# Eval("cCurso") %>' OnClientClick='return confirm("¿Está seguro de eliminar este registro?");' ImageUrl="~/public/images/eliminar.png" title="Eliminar" /></div>
                <div class="col small">
                    <asp:ImageButton ID="btn_publicar" AlternateText='<%# verificar_publicado(Eval("iPublicado"))? "Publicar": "No publicar" %>' OnClientClick='return confirm("¿Está seguro de realizar hacer esta operación?");' runat="server" CommandName="Publicar" CommandArgument='<%# Eval("cCurso") %>' ImageUrl='<%# verificar_publicado(Eval("iPublicado"))? "~/public/images/checked.png": "~/public/images/unchecked.png" %>' title='<%# verificar_publicado(Eval("iPublicado"))? "Publicar": "No publicar" %>' />
                </div>
                <div class="col small">
                    <asp:ImageButton ID="btn_subir" AlternateText="Subir" runat="server" CommandName="Subir" CommandArgument='<%# Eval("cCurso") %>' ImageUrl="~/public/images/subir.png" title="Subir" />
                    <asp:ImageButton ID="btn_bajar" AlternateText="Bajar" runat="server" CommandName="Bajar" CommandArgument='<%# Eval("cCurso") %>' ImageUrl="~/public/images/bajar.png" title="Bajar" />
                </div>
                <div class="col medium"><%# Eval("xCurso") %></div>
                <%--<div class="col medium"><%# Eval("cTipoCurso") %></div>--%>
                <div class="col big"><%# Eval("xDescripcion") %></div>
                <div class="col medium"><%# Eval("fInicio", "{0:dd/MM/yyyy}") %></div>
                <div class="col medium"><%# Eval("xDuracion") %></div>
                <div class="col medium"><%# Eval("xInscripcion") %></div>
                <div class="col medium"><%# Eval("xInversion") %></div>
                <div class="col medium"><%# Eval("xHorario") %></div>
                <div class="col big"><%# Eval("xRequisitos") %></div>
                <div class="col medium"><%# Eval("fCreacion") %></div>
                <div class="col medium"><%# Eval("fUltModificacion") %></div>
            </div>
        </ItemTemplate>
        </asp:Repeater>
    </div>
    
    <div class="table">
        <h2><%= TipoCurso.Obtener_nombre("CONT") %></h2>
        <asp:Repeater ID="rpt_cursos_cont" runat="server" 
        onitemcommand="rpt_cursos_ItemCommand" onitemdatabound="rpt_cursos_ItemDataBound">
        <FooterTemplate>
            <asp:Label ID="lbl_empty" CssClass="empty" runat="server" Text="No existen registros a&uacute;n" Visible="false"></asp:Label>
            <div class="separator"></div>
        </FooterTemplate>
        <HeaderTemplate>
            <div class="row header">
                <div class="col small">Mod.</div>
                <div class="col small">Elim.</div>
                <div class="col small">Publ.</div>
                <div class="col small">Pos.</div>
                <div class="col medium">Nombre</div>
                <%--<div class="col medium">Tipo de curso</div>--%>
                <div class="col big">Descripci&oacute;n</div>
                <div class="col medium">Inicio</div>
                <div class="col medium">Duracion</div>
                <div class="col medium">Inscripcion</div>
                <div class="col medium">Inversion</div>
                <div class="col medium">Horario</div>
                <div class="col big">Requisitos</div>      
                <div class="col medium">creaci&oacute;n</div>
                <div class="col medium">&uacute;ltima modif.</div>          
            </div>
        </HeaderTemplate>
        <ItemTemplate>
            <div class="row">
                <div class="col small"><a href='CrearCurso.aspx?id=<%# Eval("cCurso") %>'><img src="../public/images/modificar.png" alt="Modificar" title="Modificar" /></a></div>
                <div class="col small"><asp:ImageButton ID="btn_eliminar" AlternateText="Eliminar" runat="server" CommandName="Eliminar" CommandArgument='<%# Eval("cCurso") %>' OnClientClick='return confirm("¿Está seguro de eliminar este registro?");' ImageUrl="~/public/images/eliminar.png" title="Eliminar" /></div>
                <div class="col small">
                    <asp:ImageButton ID="btn_publicar" AlternateText='<%# verificar_publicado(Eval("iPublicado"))? "Publicar": "No publicar" %>' OnClientClick='return confirm("¿Está seguro de realizar hacer esta operación?");' runat="server" CommandName="Publicar" CommandArgument='<%# Eval("cCurso") %>' ImageUrl='<%# verificar_publicado(Eval("iPublicado"))? "~/public/images/checked.png": "~/public/images/unchecked.png" %>' title='<%# verificar_publicado(Eval("iPublicado"))? "Publicar": "No publicar" %>' />
                </div>
                <div class="col small">
                    <asp:ImageButton ID="btn_subir" AlternateText="Subir" runat="server" CommandName="Subir" CommandArgument='<%# Eval("cCurso") %>' ImageUrl="~/public/images/subir.png" title="Subir" />
                    <asp:ImageButton ID="btn_bajar" AlternateText="Bajar" runat="server" CommandName="Bajar" CommandArgument='<%# Eval("cCurso") %>' ImageUrl="~/public/images/bajar.png" title="Bajar" />
                </div>
                <div class="col medium"><%# Eval("xCurso") %></div>
                <%--<div class="col medium"><%# Eval("cTipoCurso") %></div>--%>
                <div class="col big"><%# Eval("xDescripcion") %></div>
                <div class="col medium"><%# Eval("fInicio", "{0:dd/MM/yyyy}") %></div>
                <div class="col medium"><%# Eval("xDuracion") %></div>
                <div class="col medium"><%# Eval("xInscripcion") %></div>
                <div class="col medium"><%# Eval("xInversion") %></div>
                <div class="col medium"><%# Eval("xHorario") %></div>
                <div class="col big"><%# Eval("xRequisitos") %></div>
                <div class="col medium"><%# Eval("fCreacion") %></div>
                <div class="col medium"><%# Eval("fUltModificacion") %></div>
            </div>
        </ItemTemplate>
        </asp:Repeater>
    </div>
    
    <div class="table">
        <h2><%= TipoCurso.Obtener_nombre("PLAN") %></h2>
        <asp:Repeater ID="rpt_cursos_plan" runat="server" 
        onitemcommand="rpt_cursos_ItemCommand" onitemdatabound="rpt_cursos_ItemDataBound">
        <FooterTemplate>
            <asp:Label ID="lbl_empty" CssClass="empty" runat="server" Text="No existen registros a&uacute;n" Visible="false"></asp:Label>
            <div class="separator"></div>
        </FooterTemplate>
        <HeaderTemplate>
            <div class="row header">
                <div class="col small">Mod.</div>
                <div class="col small">Elim.</div>
                <div class="col small">Publ.</div>
                <div class="col small">Pos.</div>
                <div class="col medium">Nombre</div>
                <%--<div class="col medium">Tipo de curso</div>--%>
                <div class="col big">Descripci&oacute;n</div>
                <div class="col medium">Inicio</div>
                <div class="col medium">Duracion</div>
                <div class="col medium">Inscripcion</div>
                <div class="col medium">Inversion</div>
                <div class="col medium">Horario</div>
                <div class="col big">Requisitos</div>       
                <div class="col medium">creaci&oacute;n</div>
                <div class="col medium">&uacute;ltima modif.</div>         
            </div>
        </HeaderTemplate>
        <ItemTemplate>
            <div class="row">
                <div class="col small"><a href='CrearCurso.aspx?id=<%# Eval("cCurso") %>'><img src="../public/images/modificar.png" alt="Modificar" title="Modificar" /></a></div>
                <div class="col small"><asp:ImageButton ID="btn_eliminar" AlternateText="Eliminar" runat="server" CommandName="Eliminar" CommandArgument='<%# Eval("cCurso") %>' OnClientClick='return confirm("¿Está seguro de eliminar este registro?");' ImageUrl="~/public/images/eliminar.png" title="Eliminar" /></div>
                <div class="col small">
                    <asp:ImageButton ID="btn_publicar" AlternateText='<%# verificar_publicado(Eval("iPublicado"))? "Publicar": "No publicar" %>' OnClientClick='return confirm("¿Está seguro de realizar hacer esta operación?");' runat="server" CommandName="Publicar" CommandArgument='<%# Eval("cCurso") %>' ImageUrl='<%# verificar_publicado(Eval("iPublicado"))? "~/public/images/checked.png": "~/public/images/unchecked.png" %>' title='<%# verificar_publicado(Eval("iPublicado"))? "Publicar": "No publicar" %>' />
                </div>
                <div class="col small">
                    <asp:ImageButton ID="btn_subir" AlternateText="Subir" runat="server" CommandName="Subir" CommandArgument='<%# Eval("cCurso") %>' ImageUrl="~/public/images/subir.png" title="Subir" />
                    <asp:ImageButton ID="btn_bajar" AlternateText="Bajar" runat="server" CommandName="Bajar" CommandArgument='<%# Eval("cCurso") %>' ImageUrl="~/public/images/bajar.png" title="Bajar" />
                </div>
                <div class="col medium"><%# Eval("xCurso") %></div>
                <%--<div class="col medium"><%# Eval("cTipoCurso") %></div>--%>
                <div class="col big"><%# Eval("xDescripcion") %></div>
                <div class="col medium"><%# Eval("fInicio", "{0:dd/MM/yyyy}") %></div>
                <div class="col medium"><%# Eval("xDuracion") %></div>
                <div class="col medium"><%# Eval("xInscripcion") %></div>
                <div class="col medium"><%# Eval("xInversion") %></div>
                <div class="col medium"><%# Eval("xHorario") %></div>
                <div class="col big"><%# Eval("xRequisitos") %></div>
                <div class="col medium"><%# Eval("fCreacion") %></div>
                <div class="col medium"><%# Eval("fUltModificacion") %></div>
            </div>
        </ItemTemplate>
        </asp:Repeater>
    </div>
    
    <div class="table">
        <h2><%= TipoCurso.Obtener_nombre("OTR") %></h2>
        <asp:Repeater ID="rpt_cursos_otr" runat="server" 
        onitemcommand="rpt_cursos_ItemCommand" onitemdatabound="rpt_cursos_ItemDataBound">
        <FooterTemplate>
            <asp:Label ID="lbl_empty" CssClass="empty" runat="server" Text="No existen registros a&uacute;n" Visible="false"></asp:Label>
            <div class="separator"></div>
        </FooterTemplate>
        <HeaderTemplate>
            <div class="row header">
                <div class="col small">Mod.</div>
                <div class="col small">Elim.</div>
                <div class="col small">Publ.</div>
                <div class="col small">Pos.</div>
                <div class="col medium">Nombre</div>
                <%--<div class="col medium">Tipo de curso</div>--%>
                <div class="col big">Descripci&oacute;n</div>
                <div class="col medium">Inicio</div>
                <div class="col medium">Duracion</div>
                <div class="col medium">Inscripcion</div>
                <div class="col medium">Inversion</div>
                <div class="col medium">Horario</div>
                <div class="col big">Requisitos</div>    
                <div class="col medium">creaci&oacute;n</div>
                <div class="col medium">&uacute;ltima modif.</div>            
            </div>
        </HeaderTemplate>
        <ItemTemplate>
            <div class="row">
                <div class="col small"><a href='CrearCurso.aspx?id=<%# Eval("cCurso") %>'><img src="../public/images/modificar.png" alt="Modificar" title="Modificar" /></a></div>
                <div class="col small"><asp:ImageButton ID="btn_eliminar" AlternateText="Eliminar" runat="server" CommandName="Eliminar" CommandArgument='<%# Eval("cCurso") %>' OnClientClick='return confirm("¿Está seguro de eliminar este registro?");' ImageUrl="~/public/images/eliminar.png" title="Eliminar" /></div>
                <div class="col small">
                    <asp:ImageButton ID="btn_publicar" AlternateText='<%# verificar_publicado(Eval("iPublicado"))? "Publicar": "No publicar" %>' OnClientClick='return confirm("¿Está seguro de realizar hacer esta operación?");' runat="server" CommandName="Publicar" CommandArgument='<%# Eval("cCurso") %>' ImageUrl='<%# verificar_publicado(Eval("iPublicado"))? "~/public/images/checked.png": "~/public/images/unchecked.png" %>' title='<%# verificar_publicado(Eval("iPublicado"))? "Publicar": "No publicar" %>' />
                </div>
                <div class="col small">
                    <asp:ImageButton ID="btn_subir" AlternateText="Subir" runat="server" CommandName="Subir" CommandArgument='<%# Eval("cCurso") %>' ImageUrl="~/public/images/subir.png" title="Subir" />
                    <asp:ImageButton ID="btn_bajar" AlternateText="Bajar" runat="server" CommandName="Bajar" CommandArgument='<%# Eval("cCurso") %>' ImageUrl="~/public/images/bajar.png" title="Bajar" />
                </div>
                <div class="col medium"><%# Eval("xCurso") %></div>
                <%--<div class="col medium"><%# Eval("cTipoCurso") %></div>--%>
                <div class="col big"><%# Eval("xDescripcion") %></div>
                <div class="col medium"><%# Eval("fInicio", "{0:dd/MM/yyyy}") %></div>
                <div class="col medium"><%# Eval("xDuracion") %></div>
                <div class="col medium"><%# Eval("xInscripcion") %></div>
                <div class="col medium"><%# Eval("xInversion") %></div>
                <div class="col medium"><%# Eval("xHorario") %></div>
                <div class="col big"><%# Eval("xRequisitos") %></div>
                <div class="col medium"><%# Eval("fCreacion") %></div>
                <div class="col medium"><%# Eval("fUltModificacion") %></div>
            </div>
        </ItemTemplate>
        </asp:Repeater>
    </div>

</asp:Content>

