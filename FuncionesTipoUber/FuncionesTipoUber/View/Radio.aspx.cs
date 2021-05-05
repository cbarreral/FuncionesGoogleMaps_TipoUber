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
           
        }

        public Radio_Datos GetDatosCordenadas()
        {
            radio_ = new Radio_Datos();
          //  radio_.Geolocalizacion = txtGeo.Text;
            radio_.CorLat = (19.4199042).ToString();
            radio_.CorLng = (-99.169275).ToString();
            radio_.Radio = (50).ToString();
            return radio_;
        }
        public void SetDatos()
        {GetDatosCordenadas();
            radio_ = new Radio_Datos();
            txtRadio.Text = radio_.Radio;
            Lat.Text = radio_.CorLat;
            Lng.Text = radio_.CorLng;
        }

        protected void btn_Geo_Click(object sender, EventArgs e)
        {
            SetDatos();
        }

        protected void btn_Cordenadas_Click(object sender, EventArgs e)
        {
           /* var n = GetDatosCordenadas();
            string script = string.Format("Alerta('{0}','{1}');", n.CorLat,n.CorLng);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", script, true);*/
        }
    }
}