using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApiCarrental
{
    public class RespuestaApi 
    {
        internal List<Marca> dataMarcas;

        //Creando propiedades
        public int totalElementos { get; set; }

        public string error { get; set; }

        public List<Coche> data { get; set; }
    }
}