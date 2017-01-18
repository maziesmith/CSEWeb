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
/// Descripción breve de TipoCurso
/// </summary>
public class TipoCurso
{
	public TipoCurso()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    public static String Obtener_nombre(String codigo)
    {
        String nombre = "";

        CSEDataSetTableAdapters.Tipo_cursoTableAdapter adapter = new CSEDataSetTableAdapters.Tipo_cursoTableAdapter();
        CSEDataSet.Tipo_cursoDataTable dt = new CSEDataSet.Tipo_cursoDataTable();
        CSEDataSet.Tipo_cursoRow row = null;

        if (adapter.FillByxCodigo(dt, codigo) > 0)
        {
            nombre = dt[0].xTipoCurso;
        }

        return nombre;
    }
}
