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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Prototipos
{
    /// <summary>
    /// Lógica de interacción para MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {

        private string usuario;
        private string contras;

        public MainWindow()
        {
            InitializeComponent();
        }

        public bool getUsersInfo()
        {
            //Conexión a base de datos.
            return false;
        }

        private void Btn_inicio_Click(object sender, RoutedEventArgs e)
        {
            this.usuario = txt_usuario.Text;
            this.contras = txt_contra.Password.ToString();

            if ()
            {

            }

            Menu menu = new Menu(this);
            menu.Show();
            this.Hide();
        }
    }
}
