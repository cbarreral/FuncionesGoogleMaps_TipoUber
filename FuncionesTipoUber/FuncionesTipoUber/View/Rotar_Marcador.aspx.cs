using FuncionesTipoUber.Controller;
using FuncionesTipoUber.Model;
using System;
using System.Collections.Generic;
using System.Device.Location;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace FuncionesTipoUber
{
    public partial class Rotar_Marcador : System.Web.UI.Page
    {
        RotarMarcador_Datos datos;
        CLocation ubi;
        protected void Page_Load(object sender, EventArgs e)
        {
          var n = GetDatos();
            // string script = string.Format("setRotation('{0}');", (120).ToString());
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", script, true);
            txtGrado.Value =n.Grados;


            GeoCoordinateWatcher watcher = new GeoCoordinateWatcher();

            // Do not suppress prompt, and wait 1000 milliseconds to start.
            watcher.PositionChanged += (S, E) =>
            {
                var oCoordinate = E.Position.Location;
                Console.WriteLine("Lat del dispositivo desde c#: " + oCoordinate.Latitude.ToString());
                Console.WriteLine("Lng del dispositivo desde c#: " + oCoordinate.Longitude.ToString());
            };
            watcher.Start();


        }
        public RotarMarcador_Datos GetDatos()
        {
            datos = new RotarMarcador_Datos();
            datos.Grados = (120).ToString();
            return datos;
        }
    }
}