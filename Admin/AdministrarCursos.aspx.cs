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

public partial class Admin_AdministrarCursos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {
            obtener_cursos();
        }
        
    }

    protected void obtener_cursos()
    {
        CSEDataSet.Vi_CursosDataTable dt = new CSEDataSet.Vi_CursosDataTable();
        Vi_CursosTableAdapter adapter = new Vi_CursosTableAdapter();        

        adapter.FillByxCodigo(dt, "PETR");
        rpt_cursos_petr.DataSource = dt;
        rpt_cursos_petr.DataBind();

        adapter.FillByxCodigo(dt, "COMP");
        rpt_cursos_comp.DataSource = dt;
        rpt_cursos_comp.DataBind();

        adapter.FillByxCodigo(dt, "CONT");
        rpt_cursos_cont.DataSource = dt;
        rpt_cursos_cont.DataBind();

        adapter.FillByxCodigo(dt, "PLAN");
        rpt_cursos_plan.DataSource = dt;
        rpt_cursos_plan.DataBind();

        adapter.FillByxCodigo(dt, "OTR");
        rpt_cursos_otr.DataSource = dt;
        rpt_cursos_otr.DataBind();
    }
    protected void rpt_cursos_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        // Se busca el curso que se esta modificando
        int cCurso = 0;
        Int32.TryParse(e.CommandArgument.ToString(), out cCurso);
        CSEDataSet.CursoDataTable dt = new CSEDataSet.CursoDataTable();
        CursoTableAdapter adapter = new CursoTableAdapter();
        CSEDataSet.CursoRow row = null;
        if (adapter.FillBycCurso(dt, cCurso) > 0)
        {
            String mensaje = "";
            row = dt[0];

            // Se realiza el comando llamado
            if (e.CommandName == "Publicar")
            {
                row.iPublicado = !row.iPublicado;
                adapter.Update(row);
                if (row.iPublicado) mensaje = "Se ha publicado el curso especificado";
                else mensaje = "El curso especificado ya no es público";
            } else if(e.CommandName == "Subir") {
                subir_curso(cCurso);
                mensaje = "Se ha subido de posición el curso especificado";
            }
            else if (e.CommandName == "Bajar")
            {
                bajar_curso(cCurso);
                mensaje = "Se ha bajado de posición el curso especificado";
            }
            else if (e.CommandName == "Eliminar")
            {
                adapter.Delete(cCurso);
                mensaje = "Se ha eliminado el curso especificado";
            }

            if (mensaje != "")
            {
                Admin_MasterPage admin_master = (Admin_MasterPage)Master;
                ((Label)admin_master.FindControl("lbl_mensaje")).Text = mensaje;
                ((Label)admin_master.FindControl("lbl_mensaje")).Visible = true;
            }
        }

        obtener_cursos();
    }

    public Boolean verificar_publicado(Object obj)
    {
        Boolean iPublicado = false;
        if (Boolean.TryParse(obj.ToString(), out iPublicado)) {
            return iPublicado;
        }

        return false;
    }

    protected void subir_curso(int cCurso)
    {
        CSEDataSet.CursoDataTable dt = new CSEDataSet.CursoDataTable();
        CSEDataSet.CursoDataTable dt_aux = new CSEDataSet.CursoDataTable();
        CursoTableAdapter adapter = new CursoTableAdapter();
        CSEDataSet.CursoRow row_actual = null;
        CSEDataSet.CursoRow row_aux = null;
        int cTipoCurso = 0;
        int nPosicion = 0;

        // Se busca el curso que se desea modificar
        if (adapter.FillBycCurso(dt, cCurso) > 0)
        {
            row_actual = dt[0];
            cTipoCurso = row_actual.cTipoCurso;
            nPosicion = row_actual.nPosicion;

            // Se busca el curso (del mismo tipo) inmediato de arriba
            if (adapter.FillBycTipoCurso_nPosicion(dt_aux, cTipoCurso, nPosicion + 1) > 0)
            {
                row_aux = dt_aux[0];

                // Se cambia las posiciones de ambos
                row_actual.nPosicion = row_actual.nPosicion + 1;
                row_aux.nPosicion = row_aux.nPosicion - 1;
                adapter.Update(row_actual);
                adapter.Update(row_aux);
            }

            rpt_cursos_petr.DataBind();
            rpt_cursos_comp.DataBind();
            rpt_cursos_cont.DataBind();
            rpt_cursos_plan.DataBind();
            rpt_cursos_otr.DataBind();
        }
    }

    protected void bajar_curso(int cCurso)
    {
        CSEDataSet.CursoDataTable dt = new CSEDataSet.CursoDataTable();
        CSEDataSet.CursoDataTable dt_aux = new CSEDataSet.CursoDataTable();
        CursoTableAdapter adapter = new CursoTableAdapter();
        CSEDataSet.CursoRow row_actual = null;
        CSEDataSet.CursoRow row_aux = null;
        int cTipoCurso = 0;
        int nPosicion = 0;

        // Se busca el curso que se desea modificar
        if (adapter.FillBycCurso(dt, cCurso) > 0)
        {
            row_actual = dt[0];
            cTipoCurso = row_actual.cTipoCurso;
            nPosicion = row_actual.nPosicion;

            // Se busca el curso (del mismo tipo) inmediato de abajo
            if (adapter.FillBycTipoCurso_nPosicion(dt_aux, cTipoCurso, nPosicion - 1) > 0)
            {
                row_aux = dt_aux[0];

                // Se cambia las posiciones de ambos
                row_actual.nPosicion = row_actual.nPosicion - 1;
                row_aux.nPosicion = row_aux.nPosicion + 1;
                adapter.Update(row_actual);
                adapter.Update(row_aux);
            }

            rpt_cursos_petr.DataBind();
            rpt_cursos_comp.DataBind();
            rpt_cursos_cont.DataBind();
            rpt_cursos_plan.DataBind();
            rpt_cursos_otr.DataBind();
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
}
