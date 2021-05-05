using FuncionesTipoUber.Controller;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FuncionesTipoUber
{
    public partial class Rotar_Marcador : System.Web.UI.Page
    {
        RotarMarcador_Datos datos;
        protected void Page_Load(object sender, EventArgs e)
        {
            var n = GetDatos();
            string script = string.Format("setRotation('{0}');", n.Grados);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", script, true);

        }
        public RotarMarcador_Datos GetDatos()
        {
            datos = new RotarMarcador_Datos();
            datos.Grados = txtGrados.Text;
            return datos;
        }
    }
}