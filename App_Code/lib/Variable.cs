using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

/// <summary>
/// Descripción breve de Variable
/// </summary>
public class Variable
{
	public Variable()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    public static String Obtener_variable(String nombre)
    {
        String variable = "";

        CSEDataSetTableAdapters.VariableTableAdapter adapter = new CSEDataSetTableAdapters.VariableTableAdapter();
        CSEDataSet.VariableDataTable dt = new CSEDataSet.VariableDataTable();
        CSEDataSet.VariableRow row = null;

        if (adapter.FillByxVariable(dt, nombre) > 0)
        {
            row = dt[0];
            variable = row.xInformacion;
        }

        return variable;
    }
}
