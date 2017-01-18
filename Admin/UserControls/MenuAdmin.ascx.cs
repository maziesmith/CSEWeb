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

public partial class Admin_UserControls_MenuAdmin : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected String obtener_codigo_qr()
    {
        String cod = "";

        if (Request.QueryString["cod"] != null)
        {
            cod = Request.QueryString["cod"].ToString();
        }

        return cod;

    }

    protected String obtener_id_qr()
    {
        String id = "";

        if (Request.QueryString["id"] != null)
        {
            id = Request.QueryString["id"].ToString();
        }

        return id;

    }

    protected String es_menu_actual(String menu)
    {
        String cssclass = "";

        if (Request.RawUrl.Contains(menu))
        {
            cssclass = "current";
            if (menu == "CrearCurso" && !String.IsNullOrEmpty(obtener_id_qr()))
            {
                cssclass = "";
            }            
        }

        return cssclass;
    }
}
