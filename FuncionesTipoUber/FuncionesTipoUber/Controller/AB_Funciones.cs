using FuncionesTipoUber.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Windows.Forms;

namespace FuncionesTipoUber.Controller
{
    public class A_B_Funciones
    {
      
        public string CalcularDistancia(A_B_Datos getDatos)
        {
            Console.WriteLine("getdatos: " + getDatos.A_Lat);
            var R = 6371;
            var dLat = deg2rad(Convert.ToDouble(getDatos.B_Lat) - Convert.ToDouble(getDatos.A_Lat));
            var dLng = deg2rad(Convert.ToDouble(getDatos.A_Lng) - Convert.ToDouble(getDatos.B_Lng));

            var a = Math.Sin(dLat / 2) * Math.Sin(dLat / 2) + Math.Cos(deg2rad(Convert.ToDouble(getDatos.A_Lat))) * Math.Cos(deg2rad(Convert.ToDouble(getDatos.B_Lat))) * Math.Sin(dLng / 2) * Math.Sin(dLng / 2);

            var c = 2 * Math.Atan2(Math.Sqrt(a), Math.Sqrt(1 - a));
            var d = R * c;

            var total = d * 1000;
            MessageBox.Show("Distancia: " + total);
            return total.ToString() + " metros";
           
        }

        public double deg2rad(double n)
        {
           return n * (Math.PI / 180);
        }

    }
}