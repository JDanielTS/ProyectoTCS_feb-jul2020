using System;
using System.Collections.Generic;
using System.Text;

namespace SistemaVehicular
{
    public class Conductor
    {
        private string num_lic_cond = "", user_cond = "", nom_cond = "", apat_cond = "", amat_cond = "";
        private DateTime fecha_nac_cond = new DateTime();
        private List<Vehiculo> vehiculos;

        public Conductor(string licencia, string user, string nombre, string a_pat, string a_mat, DateTime fech_nac)
        {
            this.Licencia = licencia;
            this.UsuarioC = user;
            this.NombreC = nombre;
            this.Ap_pat = a_pat;
            this.Ap_mat = a_mat;
            this.FechaNacC = fech_nac;
        }

        public string Licencia { get => num_lic_cond; set => num_lic_cond = value; }
        public string UsuarioC{ get => user_cond; set => user_cond = value; }
        public string NombreC{ get => nom_cond; set => nom_cond = value; }
        public string Ap_pat { get => apat_cond; set => apat_cond = value; }
        public string Ap_mat { get => amat_cond; set => amat_cond = value; }
        public DateTime FechaNacC { get => fecha_nac_cond; set => fecha_nac_cond = value; }

        public bool agregaVehiculo(Vehiculo vehic)
        {
            if (vehiculos.Contains(vehic))
            {
                return false;
            }
            else
            {
                vehiculos.Add(vehic);
            }
            return true;
        }

        public bool eliminarVehiculo(Vehiculo vehic)
        {
            if (vehiculos.Contains(vehic))
            {
                vehiculos.Remove(vehic);
            }
            else
            {
                return false;
            }
            return true;
        }

    }
}
