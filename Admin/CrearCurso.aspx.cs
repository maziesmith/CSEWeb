using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using CSEDataSetTableAdapters;

public partial class Admin_CrearCurso : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {        
        
            // Se busca el curso que se desea modificar si lo hay (querystring).
            int cCurso = obtener_curso_querystring();
            CSEDataSet.CursoDataTable dt = new CSEDataSet.CursoDataTable();
            CursoTableAdapter adapter = new CursoTableAdapter();
            CSEDataSet.CursoRow row = null;

            adapter.FillBycCurso(dt, cCurso);
            if (dt.Count > 0)
            {
                row = dt[0];
                txt_nombre.Text = row.xCurso;
                ddl_tipo.SelectedValue = row.cTipoCurso.ToString();
                txt_descripcion.Text = row.xDescripcion;
                txt_finicio.Text = row.IsfInicioNull()?"":row.fInicio; //row.fInicio.ToShortDateString();
                txt_duracion.Text = row.xDuracion;
                txt_inscripcion.Text = row.xInscripcion;
                txt_inversion.Text = row.xInversion;
                txt_horario.Text = row.xHorario;
                txt_requisitos.Text = row.xRequisitos;

                btn_agregar.Text = "Modificar";
            }

        }
        
    }

    protected int obtener_curso_querystring()
    {
        int cCurso = 0;

        if (Request.QueryString["id"] != null)
        {
            Int32.TryParse(Request.QueryString["id"].ToString(), out cCurso);
        }

        return cCurso;
    }

    protected void btn_agregar_Click(object sender, EventArgs e)
    {
        String mensaje = "";
        int cCurso = obtener_curso_querystring();

        // Se verifica si se esta agregando o modificando un curso.
        if (cCurso != 0)
        {
            // Se modifica el curso
            if (modificar_curso(cCurso, out mensaje))
            {
                mensaje = "El curso se ha modificado satisfactoriamente";
                Admin_MasterPage admin_master = (Admin_MasterPage)Master;
                ((Label)admin_master.FindControl("lbl_mensaje")).Text = mensaje;
                ((Label)admin_master.FindControl("lbl_mensaje")).Visible = true;
            }
            else
            {
                Admin_MasterPage admin_master = (Admin_MasterPage)Master;
                ((Label)admin_master.FindControl("lbl_mensaje")).Text = mensaje;
                ((Label)admin_master.FindControl("lbl_mensaje")).Visible = true;
            }
        }
        else
        {
            // Se agrega el curso nuev
            if (agregar_curso(out mensaje))
            {
                mensaje = "El curso se ha creado satisfactoriamente. Recuerde hacerlo público en el botón Publicar";
                mensaje = HttpUtility.UrlEncode(mensaje);
                Response.Redirect("~/Admin/AdministrarCursos.aspx?mensaje=" + mensaje);
            }
            else
            {
                Admin_MasterPage admin_master = (Admin_MasterPage)Master;
                ((Label)admin_master.FindControl("lbl_mensaje")).Text = mensaje;
                ((Label)admin_master.FindControl("lbl_mensaje")).Visible = true;
            }
        }

    }

    protected Boolean agregar_curso(out String mensaje)
    {
        CSEDataSet.CursoDataTable dt = new CSEDataSet.CursoDataTable();
        CursoTableAdapter adapter = new CursoTableAdapter();
        //CSEDataSet.CursoRow row = null;

        // Se verifican los datos.
        mensaje = "";
        int _tipo_curso = 0;
        //DateTime? _finicio = null; DateTime _finicio_;
        if (String.IsNullOrEmpty(txt_nombre.Text))
        {
            mensaje = "Por favor ingrese un nombre de curso válido";
            return false;
        }
        if (!Int32.TryParse(ddl_tipo.SelectedValue, out _tipo_curso))
        {
            mensaje = "Por favor ingrese un tipo de curso válido";
            return false;
        }
        //if (!DateTime.TryParse(txt_finicio.Text, out _finicio_))
        //{
        //    if (txt_finicio.Text != "") 
        //    {
        //        mensaje = "Por favor ingrese una fecha de inicio válida";
        //        return false;
        //    }
        //} else {
        //    _finicio = _finicio_;
        //}

        // Se obtienen los datos.
        int cCurso = Contador.Obtener_contador_e_incrementar("CURSO");
        String nombre = txt_nombre.Text;
        int tipo_curso = _tipo_curso;
        String descripcion = txt_descripcion.Text;
        String finicio = txt_finicio.Text;
        String duracion = txt_duracion.Text;
        String inscripcion = txt_inscripcion.Text;
        String inversion = txt_inversion.Text;
        String horario = txt_horario.Text;
        String requisitos = txt_requisitos.Text;
        Boolean publicado = false;
        int posicion = 0;
        DateTime fCreacion = DateTime.Now;
        DateTime fUltModificacion = DateTime.Now;

        // Se debe busca una posicion valida (ultimo de ese tipo de curso).
        int count = adapter.FillBycTipoCurso_Ultimo(dt, tipo_curso);
        if (count >= 0)
        {
            if (count == 0) 
                posicion = 0;
            else
                posicion = dt[0].nPosicion + 1;

            // Se intenta agregar en la BD.
            if (adapter.Insert(cCurso, tipo_curso, nombre, descripcion, finicio, duracion, inscripcion, inversion, horario, requisitos, posicion, publicado, fCreacion, fUltModificacion) > 0)
            {
                return true;
            }
        }        

        return false;
    }

    protected Boolean modificar_curso(int cCurso, out String mensaje)
    {
        CSEDataSet.CursoDataTable dt = new CSEDataSet.CursoDataTable();
        CursoTableAdapter adapter = new CursoTableAdapter();
        CSEDataSet.CursoRow row = null;

        // Se busca el curso a modificar
        if (adapter.FillBycCurso(dt, cCurso) > 0)
        {
            row = dt[0];

            // Se verifican los datos.
            mensaje = "";
            int _tipo_curso = 0;
            //DateTime? _finicio = null; DateTime _finicio_;
            if (String.IsNullOrEmpty(txt_nombre.Text))
            {
                mensaje = "Por favor ingrese un nombre de curso válido";
                return false;
            }
            if (!Int32.TryParse(ddl_tipo.SelectedValue, out _tipo_curso))
            {
                mensaje = "Por favor ingrese un tipo de curso válido";
                return false;
            }
            //if (!DateTime.TryParse(txt_finicio.Text, out _finicio_))
            //{
            //    if (txt_finicio.Text != "")
            //    {
            //        mensaje = "Por favor ingrese una fecha de inicio válida";
            //        return false;
            //    }
            //}
            //else
            //{
            //    _finicio = _finicio_;
            //}

            // Se verifica si se cambio el tipo de curso
            int _posicion = row.nPosicion;
            if (row.cTipoCurso != _tipo_curso)
            {
                // Se debe busca una posicion valida (ultimo de ese tipo de curso).
                CSEDataSet.CursoDataTable _dt = new CSEDataSet.CursoDataTable();
                int count = adapter.FillBycTipoCurso_Ultimo(_dt, _tipo_curso);
                if (count >= 0)
                {
                    if (count == 0)
                        _posicion = 0;
                    else
                        _posicion = _dt[0].nPosicion + 1;
                }   
            }            

            // Se obtienen los datos.
            row.xCurso = txt_nombre.Text;
            row.cTipoCurso = _tipo_curso;
            row.xDescripcion = txt_descripcion.Text;
            row.fInicio = txt_finicio.Text;
            row.xDuracion = txt_duracion.Text;
            row.xInscripcion = txt_inscripcion.Text;
            row.xInversion = txt_inversion.Text;
            row.xHorario = txt_horario.Text;
            row.xRequisitos = txt_requisitos.Text;
            row.nPosicion = _posicion;
            row.fUltModificacion = DateTime.Now;

            // Se intenta modificar en la BD.
            if (adapter.Update(row) > 0)
            {
                return true;
            }
        }
        else
        {
            mensaje = "El curso que desea modificar no existe, por favor verifique los datos";
        }

        return false;

    }

    protected String obtener_codigo_qr()
    {
        String cod = "";

        if (Request.QueryString["cod"] != null)
        {
            cod = Request.QueryString["cod"].ToString();
        }

        if (String.IsNullOrEmpty(cod)) cod = "TODOS";

        return cod;

    }

    protected String es_menu_actual(String menu)
    {
        String cssclass = "";

        if (obtener_codigo_qr() == menu)
        {
            cssclass = "current";
        }

        return cssclass;
    }
}
