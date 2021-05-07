using System;
using System.Collections.Generic;
using System.Device.Location;
using System.Linq;
using System.Web;
using System.Windows.Forms;

namespace FuncionesTipoUber.Model
{
    public class CLocation
    {

        public void GetLocationProperty()
        {
            GeoCoordinateWatcher watcher = new GeoCoordinateWatcher();

            // Do not suppress prompt, and wait 1000 milliseconds to start.
            watcher.PositionChanged += (S, E) =>
            {
                var oCoordinate = E.Position.Location;
                MessageBox.Show("Lat del dispositivo desde c#: " + oCoordinate.Latitude.ToString());
                MessageBox.Show("Lng del dispositivo desde c#: " + oCoordinate.Longitude.ToString());
            };
            watcher.Start();

          
        }
    }
}