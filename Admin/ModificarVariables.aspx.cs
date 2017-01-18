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

public partial class Admin_ModificarVariables : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CSEDataSetTableAdapters.VariableTableAdapter adapter = new CSEDataSetTableAdapters.VariableTableAdapter();
            CSEDataSet.VariableDataTable dt = new CSEDataSet.VariableDataTable();
            CSEDataSet.VariableRow row = null;

            if (adapter.FillByxVariable(dt, "TLF") > 0)
                txt_telefono.Text = dt[0].xInformacion;

            if (adapter.FillByxVariable(dt, "EMAIL") > 0)
                txt_email.Text = dt[0].xInformacion;

            if (adapter.FillByxVariable(dt, "INFO_ADICIONAL") > 0)
                txt_info_adicional.Text = dt[0].xInformacion;
        }
    }

    protected void btn_modificar_Click(object sender, EventArgs e)
    {
        String mensaje = "Se han modificado las variables exitosamente";

        CSEDataSetTableAdapters.VariableTableAdapter adapter = new CSEDataSetTableAdapters.VariableTableAdapter();
        CSEDataSet.VariableDataTable dt = new CSEDataSet.VariableDataTable();
        CSEDataSet.VariableRow row = null;

        if (adapter.FillByxVariable(dt, "TLF") > 0)
        {
            row = dt[0];
            row.xInformacion = txt_telefono.Text;
            if (adapter.Update(row) <= 0)
            {
                mensaje = "Ha ocurrido un error actualizando el teléfono, por favor vuelva a intentarlo";
            }
        }
        else
        {
            mensaje = "Ha ocurrido un error con el teléfono, por favor vuelva a intentarlo";
        }

        if (adapter.FillByxVariable(dt, "EMAIL") > 0)
        {
            row = dt[0];
            row.xInformacion = txt_email.Text;
            if (adapter.Update(row) <= 0)
            {
                mensaje = "Ha ocurrido un error actualizando el email, por favor vuelva a intentarlo";
            }
        }
        else
        {
            mensaje = "Ha ocurrido un error con el email, por favor vuelva a intentarlo";
        }

        if (adapter.FillByxVariable(dt, "INFO_ADICIONAL") > 0)
        {
            row = dt[0];
            row.xInformacion = txt_info_adicional.Text;
            if (adapter.Update(row) <= 0)
            {
                mensaje = "Ha ocurrido un error actualizando la información adicional, por favor vuelva a intentarlo";
            }
        }
        else
        {
            mensaje = "Ha ocurrido un error con la información adicional, por favor vuelva a intentarlo";
        }

        Admin_MasterPage admin_master = (Admin_MasterPage)Master;
        ((Label)admin_master.FindControl("lbl_mensaje")).Text = mensaje;
        ((Label)admin_master.FindControl("lbl_mensaje")).Visible = true;

    }
}
