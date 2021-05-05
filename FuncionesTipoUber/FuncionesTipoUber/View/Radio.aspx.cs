using FuncionesTipoUber.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FuncionesTipoUber.View
{
    public partial class Radio : System.Web.UI.Page
    {
        Radio_Datos radio_;
        protected void Page_Load(object sender, EventArgs e)
        {

            SetDatos();
            GetDatosCordenadas();
        }

        public Radio_Datos GetDatosCordenadas()
        {
            radio_ = new Radio_Datos();

            radio_.CorLat = Lat.Text;
            radio_.CorLng = Lng.Text;
            radio_.Radio = txtRadio.Text;
            return radio_;
        }
        public void SetDatos()
        {

            txtRadio.Text = (500).ToString();
            Lat.Text = (19.4199042).ToString();
            Lng.Text = (-99.169275).ToString();
        }

        

        protected void btn_Cordenadas_Click(object sender, EventArgs e)
        {
           /* var n = GetDatosCordenadas();
            string script = string.Format("Alerta('{0}','{1}');", n.CorLat,n.CorLng);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", script, true);*/
        }

    }
}