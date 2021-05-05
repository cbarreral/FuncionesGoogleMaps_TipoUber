using FuncionesTipoUber.Controller;
using FuncionesTipoUber.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FuncionesTipoUber.View
{
    public partial class Index : System.Web.UI.Page
    {
        A_B_Datos datos;
        A_B_Funciones funcion;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCalcular_Click(object sender, EventArgs e)
        {
            funcion = new A_B_Funciones();
            
            Distancia.Text=funcion.CalcularDistancia(GetDatos());
        }
        public A_B_Datos GetDatos()
        {
            datos = new A_B_Datos();

            //Recolectar datos
            datos.A_Lat = A_Lat.Text;
            datos.A_Lng = A_Lng.Text;
            datos.B_Lat = B_Lat.Text;
            datos.B_Lng = B_Lng.Text;
           // SetDatos();
            return datos;
        }
        public void SetDatos()
        {
            datos = new A_B_Datos();
            txt_A_Lat.Value =datos.A_Lat;
            txt_A_Lng.Value=datos.A_Lng;
        }

        
    }
}