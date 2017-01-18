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
/// Descripción breve de Contador
/// </summary>
public class Contador
{
	public Contador()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    public static int Obtener_contador(String nombre)
    {
        CSEDataSetTableAdapters.ContadorTableAdapter adapter = new CSEDataSetTableAdapters.ContadorTableAdapter();
        CSEDataSet.ContadorDataTable dt = new CSEDataSet.ContadorDataTable();
        CSEDataSet.ContadorRow row = null;
        int contador = -1;

        if (adapter.FillByxContador(dt, nombre) > 0) {
            row = dt[0];
            contador = row.nContador;
        }

        return contador;
    }

    public static int Obtener_contador_e_incrementar(String nombre)
    {
        CSEDataSetTableAdapters.ContadorTableAdapter adapter = new CSEDataSetTableAdapters.ContadorTableAdapter();
        CSEDataSet.ContadorDataTable dt = new CSEDataSet.ContadorDataTable();
        CSEDataSet.ContadorRow row = null;
        int contador = -1;

        if (adapter.FillByxContador(dt, nombre) > 0)
        {
            row = dt[0];
            contador = row.nContador;

            row.nContador++;
            if (adapter.Update(row) <= 0)
            {
                return -1;
            }
        }

        return contador;
    }
}
