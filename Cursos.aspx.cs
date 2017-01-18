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

public partial class Cursos : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            obtener_cursos();
        }

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

    protected void obtener_cursos()
    {
        CSEDataSet.Vi_CursosDataTable dt = new CSEDataSet.Vi_CursosDataTable();
        Vi_CursosTableAdapter adapter = new Vi_CursosTableAdapter();

        string cod = obtener_codigo_qr();

        if (cod == "PETR" || cod == "TODOS")
        {
            adapter.FillByxCodigo_publicado(dt, "PETR");
            rpt_cursos_petr.DataSource = dt;
            rpt_cursos_petr.DataBind();

            rpt_cursos_petr.Visible = true;
            lbl_cursos_petr.Visible = true;
            lbl_cursos_petr.Text = TipoCurso.Obtener_nombre("PETR");
        }
        
        if (cod == "COMP" || cod == "TODOS")
        {
            adapter.FillByxCodigo_publicado(dt, "COMP");
            rpt_cursos_comp.DataSource = dt;
            rpt_cursos_comp.DataBind();

            rpt_cursos_comp.Visible = true;
            lbl_cursos_comp.Visible = true;
            lbl_cursos_comp.Text = TipoCurso.Obtener_nombre("COMP");
        }
        
        if (cod == "CONT" || cod == "TODOS")
        {
            adapter.FillByxCodigo_publicado(dt, "CONT");
            rpt_cursos_cont.DataSource = dt;
            rpt_cursos_cont.DataBind();

            rpt_cursos_cont.Visible = true;
            lbl_cursos_cont.Visible = true;
            lbl_cursos_cont.Text = TipoCurso.Obtener_nombre("CONT");
        }
        
        if (cod == "PLAN" || cod == "TODOS")
        {
            adapter.FillByxCodigo_publicado(dt, "PLAN");
            rpt_cursos_plan.DataSource = dt;
            rpt_cursos_plan.DataBind();

            rpt_cursos_plan.Visible = true;
            lbl_cursos_plan.Visible = true;
            lbl_cursos_plan.Text = TipoCurso.Obtener_nombre("PLAN");
        }
        
        if (cod == "OTR" || cod == "TODOS")
        {
            adapter.FillByxCodigo_publicado(dt, "OTR");
            rpt_cursos_otr.DataSource = dt;
            rpt_cursos_otr.DataBind();

            rpt_cursos_otr.Visible = true;
            lbl_cursos_otr.Visible = true;
            lbl_cursos_otr.Text = TipoCurso.Obtener_nombre("OTR");
        }
               
    }

    protected void rpt_cursos_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        // en el caso de los repeater vacios
        Repeater rpt_cursos = sender as Repeater; // Get the Repeater control object.

        // If the Repeater contains no data.

        if (e.Item.ItemType == ListItemType.Footer)
        {
            if (rpt_cursos.Items.Count == 0)
            {
                // Show the Error Label (if no data is present).
                Label lbl_empty = e.Item.FindControl("lbl_empty") as Label;
                if (lbl_empty != null)
                {
                    lbl_empty.Visible = true;
                }
            }
        }

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

    protected String Agregar_etiqueta(Object cCurso)
    {
        int _cCurso = 0;
        String etiqueta = "";

        CSEDataSetTableAdapters.CursoTableAdapter adapter = new CSEDataSetTableAdapters.CursoTableAdapter();
        CSEDataSet.CursoDataTable dt = new CSEDataSet.CursoDataTable();
        CSEDataSet.CursoRow row = null;

        // Se obtiene la diferencia en dias desde la ultima modificacion para mostrar una etiqueta.
        if (Int32.TryParse(cCurso.ToString(), out _cCurso)) {
        if (adapter.FillBycCurso(dt, _cCurso) > 0)
        {
            row = dt[0];

            double dias_creacion = DateTime.Now.Subtract(row.fCreacion).TotalDays;
            double dias_modif = DateTime.Now.Subtract(row.fUltModificacion).TotalDays;
            
            // Se verifica si es una nueva publicacion o una nueva modificacion
            if (dias_creacion <= 4)
            {
                etiqueta = "<div class='curso_nuevo'></div>";
            } 
            if (dias_modif <= 4)
                if (dias_creacion != dias_modif)
                    etiqueta = "<div class='curso_modif'></div>";
            }
        }

        return etiqueta;
    }

}
