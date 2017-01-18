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

public partial class Admin_ModificarTiposCurso : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txt_tipocurso1.Text = TipoCurso.Obtener_nombre("PETR");

            txt_tipocurso2.Text = TipoCurso.Obtener_nombre("COMP");

            txt_tipocurso3.Text = TipoCurso.Obtener_nombre("CONT");

            txt_tipocurso4.Text = TipoCurso.Obtener_nombre("PLAN");

            txt_tipocurso5.Text = TipoCurso.Obtener_nombre("OTR");
        }
    }
    protected void btn_modificar_Click(object sender, EventArgs e)
    {
        String mensaje = "Se han modificado los Tipos de Curso exitosamente";

        CSEDataSetTableAdapters.Tipo_cursoTableAdapter adapter = new CSEDataSetTableAdapters.Tipo_cursoTableAdapter();
        CSEDataSet.Tipo_cursoDataTable dt = new CSEDataSet.Tipo_cursoDataTable();
        CSEDataSet.Tipo_cursoRow row = null;

        if (adapter.FillByxCodigo(dt, "PETR") > 0)
        {
            row = dt[0];
            row.xTipoCurso = txt_tipocurso1.Text;
            if (adapter.Update(row) <= 0)
            {
                mensaje = "Ha ocurrido un error actualizando el Tipo de Curso 1, por favor vuelva a intentarlo";
            }
        }
        else
        {
            mensaje = "Ha ocurrido un error con el Tipo de Curso 1, por favor vuelva a intentarlo";
        }

        if (adapter.FillByxCodigo(dt, "COMP") > 0)
        {
            row = dt[0];
            row.xTipoCurso = txt_tipocurso2.Text;
            if (adapter.Update(row) <= 0)
            {
                mensaje = "Ha ocurrido un error actualizando el Tipo de Curso 2, por favor vuelva a intentarlo";
            }
        }
        else
        {
            mensaje = "Ha ocurrido un error con el Tipo de Curso 2, por favor vuelva a intentarlo";
        }

        if (adapter.FillByxCodigo(dt, "CONT") > 0)
        {
            row = dt[0];
            row.xTipoCurso = txt_tipocurso3.Text;
            if (adapter.Update(row) <= 0)
            {
                mensaje = "Ha ocurrido un error actualizando el Tipo de Curso 3, por favor vuelva a intentarlo";
            }
        }
        else
        {
            mensaje = "Ha ocurrido un error con el Tipo de Curso 3, por favor vuelva a intentarlo";
        }

        if (adapter.FillByxCodigo(dt, "PLAN") > 0)
        {
            row = dt[0];
            row.xTipoCurso = txt_tipocurso4.Text;
            if (adapter.Update(row) <= 0)
            {
                mensaje = "Ha ocurrido un error actualizando el Tipo de Curso 4, por favor vuelva a intentarlo";
            }
        }
        else
        {
            mensaje = "Ha ocurrido un error con el Tipo de Curso 4, por favor vuelva a intentarlo";
        }

        if (adapter.FillByxCodigo(dt, "OTR") > 0)
        {
            row = dt[0];
            row.xTipoCurso = txt_tipocurso5.Text;
            if (adapter.Update(row) <= 0)
            {
                mensaje = "Ha ocurrido un error actualizando el Tipo de Curso 5, por favor vuelva a intentarlo";
            }
        }
        else
        {
            mensaje = "Ha ocurrido un error con el Tipo de Curso 5, por favor vuelva a intentarlo";
        }

        Admin_MasterPage admin_master = (Admin_MasterPage)Master;
        ((Label)admin_master.FindControl("lbl_mensaje")).Text = mensaje;
        ((Label)admin_master.FindControl("lbl_mensaje")).Visible = true;

    }
}
