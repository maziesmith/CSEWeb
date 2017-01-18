<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title="Centro Superior de Estudios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <!-- CSS for slidesjs -->
    <link rel="stylesheet" href="public/styles/slidesjs.css">
    <!-- End CSS for slidesjs -->
    
    <!-- CSS for hoverzoom -->
    <link rel="stylesheet" href="public/styles/hoverzoom.css">
    <!-- End CSS for hoverzoom -->

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="slides">
      <img src="public/images/slide1.jpg" alt="Cada uno de nosotros es responsable de su propio destino ¡Sup&eacute;rate desde hoy!" />
      <img src="public/images/slide2.jpg" alt="M&aacute;s de 30 a&ntilde;os de experiencia en la zona" />
      <img src="public/images/slide3.jpg" alt="Lo que hagas hoy... Permitir&aacute; mejorar tu ma&ntilde;ana" />
      <%--<a href="#" class="slidesjs-previous slidesjs-navigation"><i class="icon-chevron-left icon-large"></i></a>--%>
      <%--<a href="#" class="slidesjs-next slidesjs-navigation"><i class="icon-chevron-right icon-large"></i></a>--%>
    </div>

    <div id="cursos">
        <div id="petroleros" class="curso">
            <a href="Cursos.aspx?cod=PETR">
                <span style="display: none;" class="dark-background">Descubre m&aacute;s</span>
                <img src="public/images/petroleros.jpg" alt="Cursos petroleros" />
                <span><%= TipoCurso.Obtener_nombre("PETR") %></span>
            </a>
        </div>
        <div id="computacion" class="curso">
            <a href="Cursos.aspx?cod=COMP">
                <span style="display: none;" class="dark-background">Descubre m&aacute;s</span>
                <img src="public/images/computacion.jpg" alt=" Cursos de computaci&oacute;n" />
                <span><%= TipoCurso.Obtener_nombre("COMP") %></span>
            </a>
        </div>
        <div id="contabilidad" class="curso">
            <a href="Cursos.aspx?cod=CONT">
                <span style="display: none;" class="dark-background">Descubre m&aacute;s</span>
                <img src="public/images/contabilidad.jpg" alt="Cursos de contabilidad" />
                <span><%= TipoCurso.Obtener_nombre("CONT") %></span>
            </a>
        </div>
        <div id="vacacionales" class="curso">
            <a href="Cursos.aspx?cod=PLAN">
                <span style="display: none;" class="dark-background">Descubre m&aacute;s</span>
                <img src="public/images/vacacionales.jpg" alt="Planes vacacionales" />
                <span><%= TipoCurso.Obtener_nombre("PLAN") %></span>
            </a>
        </div>
        <div id="otros" class="curso">
            <a href="Cursos.aspx?cod=OTR">
                <span style="display: none;" class="dark-background">Descubre m&aacute;s</span>
                <img src="public/images/otros_cursos.jpg" alt="Otros cursos" />
                <span><%= TipoCurso.Obtener_nombre("OTR") %></span>
            </a>
        </div>
    </div>
    
    <div id="informacion">
        <div class="info">
            <h3>Ubicaci&oacute;n</h3>
            <p>Calle Sucre No. 40, paralelo a la Calle Bol&iacute;var, Casco Viejo. El Tigre, Edo. Anzo&aacute;tegui</p>
            <a target="_blank" href="https://maps.google.co.ve/maps?expflags=enable_star_based_justifications:true&ie=UTF8&cid=16114017575988091303&q=Centro+Superior+de+Estudios&iwloc=A&gl=VE&hl=es">
                <img src="public/images/ubicacion.jpg" alt="Ubicaci&oacute;n" />
            </a>
            <a class="mas" target="_blank" href="https://maps.google.co.ve/maps?expflags=enable_star_based_justifications:true&ie=UTF8&cid=16114017575988091303&q=Centro+Superior+de+Estudios&iwloc=A&gl=VE&hl=es">
                M&aacute;s informaci&oacute;n
            </a>
        </div>
        <div class="info">
            <h3>MPPE</h3>
            <p>Registrado en el Ministerio del Poder Popular para la Educaci&oacute;n No. R.0042-02-4</p>
            <img src="public/images/mppe.jpg" alt="MPPE" />
        </div>
        <div class="info">
            <h3>Informaci&oacute;n adicional</h3>
            <p><%= Variable.Obtener_variable("INFO_ADICIONAL") %></p>
        </div>
    </div>
    
    <!-- SlidesJS Required: Link to jQuery -->
    <script type="text/javascript" src="public/scripts/jquery-1.9.1.min.js"></script>
    <!-- End SlidesJS Required -->

    <!-- SlidesJS Required: Link to jquery.slides.js -->
    <script type="text/javascript" src="public/scripts/jquery.slides.min.js"></script>
    <!-- End SlidesJS Required -->

    <!-- SlidesJS Required: Initialize SlidesJS with a jQuery doc ready -->
    <script type="text/javascript">
    $(function() {
      $('#slides').slidesjs({
        width: 950,
        height: 400,
        navigation: false,
        pagination: false,
        play: {
            active: false,
            interval: 6000,
            auto: true,
            swap: false,
            pauseOnHover: false
        }
      });
    });
    </script>
    <!-- End SlidesJS Required -->
    
    <!-- jquery.hoverzoom.js -->
    <script type="text/javascript" src="public/scripts/jquery.hoverzoom.js"></script>
    <!-- End jquery.hoverzoom.js -->

</asp:Content>

