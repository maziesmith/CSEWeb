using System;
using System.Collections;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.Security;

public partial class Admin_RegistrarUsuario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
        }        
    }

    protected void btn_agregar_Click(object sender, EventArgs e)
    {
        String mensaje = "Se ha agregado el usuario exitosamente";

        try
        {
            MembershipUser newUser = Membership.CreateUser(txt_usuario.Text, txt_contrasena.Text, "admin@gmail.com");

            txt_usuario.Text = "";
            txt_contrasena.Text = "";
        }
        catch (Exception ex)
        {
            mensaje = "Se ha generado un error creando el usuario, por favor intentelo nuevamente";
            //throw ex;
        }
        
        Admin_MasterPage admin_master = (Admin_MasterPage)Master;
        ((Label)admin_master.FindControl("lbl_mensaje")).Text = mensaje;
        ((Label)admin_master.FindControl("lbl_mensaje")).Visible = true;

    }
}