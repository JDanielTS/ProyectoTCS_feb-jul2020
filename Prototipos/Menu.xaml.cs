using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Prototipos
{
    /// <summary>
    /// Lógica de interacción para Menu.xaml
    /// </summary>
    public partial class Menu : Window
    {
        Window inises;
        public Menu(Window pantalla)
        {
            InitializeComponent();
            this.inises = pantalla;
        }

        private void Btn_Sesion_Click(object sender, RoutedEventArgs e)
        {
            this.Hide();
            this.inises.Show();
            this.inises.Focus();
            this.Close();
        }

        private void Btn_Conductor_Click(object sender, RoutedEventArgs e)
        {
            Conductores cond = new Conductores();
            cond.Show();
        }

        private void Btn_Vehiculo_Click(object sender, RoutedEventArgs e)
        {
            Vehiculos veh = new Vehiculos();
            veh.Show();
        }

        private void Btn_Reporte_Click(object sender, RoutedEventArgs e)
        {
            ///
        }

        private void Btn_Chat_Click(object sender, RoutedEventArgs e)
        {
            if (this.Height == this.MaxHeight)
            {
                //Cerrar el chat.
                this.Height = this.MinHeight;
            }
            else
            {
                //Cargar el chat.
                this.Height = this.MaxHeight;
            }
        }
    }
}
