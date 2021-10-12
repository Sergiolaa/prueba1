using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Prueba1_DTO;

namespace Prueba1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            { 
                //List<Comunas_DTO> lasComunas = CargarComunas();
                lstComunas.DataSource = CargarComunas();
                lstComunas.DataTextField = "Nombre";
                lstComunas.DataValueField = "Codigo";
                lstComunas.DataBind();
            }
        }

        private List<Comunas_DTO> CargarComunas()
        {
            List<Comunas_DTO> salida = new List<Comunas_DTO>
            {
                new Comunas_DTO { Codigo = "01", Nombre = "las Condes"   },
                new Comunas_DTO { Codigo = "02", Nombre = "Renca"        },
                new Comunas_DTO { Codigo = "03", Nombre = "San Bernardo" },
                new Comunas_DTO { Codigo = "04", Nombre = "Quilicura"    },
                new Comunas_DTO { Codigo = "00", Nombre = " Seleccione opcion" }
            };

            salida = salida.OrderBy(x => x.Nombre).ToList();
            //salida = salida.CopyTo

            var valores = new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
            var suma = valores.Sum();
            var pares = valores.Where(x => x % 2 == 0).ToList();
            var losPrimerosCinco = valores.Where(x => x <= 5).ToList();


            List<Alumnos_DTO> Alumno = new List<Alumnos_DTO>
            {
                new Alumnos_DTO  {Nombre = "Pedro",Nota = 5},
                new Alumnos_DTO  {Nombre = "Jorge",Nota = 8},
                new Alumnos_DTO  {Nombre = "Andres",Nota = 3}
            };

            var nombresAlumnos = Alumno.Select(x => x.Nombre).ToList();
            var alumnosAprobados = Alumno.Where(x => x.Nota >= 5).ToList();
            int sumaNotas = Alumno.Sum(x => x.Nota);
            int notaMaxima = Alumno.Max(x => x.Nota);
            int notaMinima = Alumno.Min(x => x.Nota);
            double media = Alumno.Average(x => x.Nota);
            bool todosAprobados = Alumno.All(x => x.Nota >= 5);
            bool algunAprobado = Alumno.Any(x => x.Nota >= 5);


            var resultado = from Alumnos in Alumno
                            where Alumnos.Nota >= 5
                            orderby Alumnos.Nota
                            select Alumno;

            return salida;
        }

        private void CrearClase()
        {

        }
        protected void lkbContinuar_Click(object sender, EventArgs e)
        {
            List<string> msg = ValidarDatos();
            if (msg.Count > 1)
            {
                lblModalTitulo.Text = "Validacion de los datos";
                lblModalDetalle.Text =  "";

                foreach( string item in msg)
                {
                    lblModalDetalle.Text += item + "<br/>";
                }

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "VentanaModal", "$('#miModal').modal();", true);
                upModal.Update();
            }
            else
            {

            }

        }

        protected void lstComunas_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (lstComunas.SelectedItem != null)
                {
                    if (lstComunas.SelectedItem.Value.Count() > 0)
                    {

                    }
                }
                else
                {

                }
            }
            catch (Exception ex)
            {

            }
        }

        private List<string> ValidarDatos()
        {
            List<string> msg = new List<string>();
            msg.Add("No ha completado todos los datos del formulario: <br/> ");

            if (tx_rut.Text == "")
                msg.Add("- Falta ingresar el Rut");

            if (tx_nombre.Text == "")
                msg.Add("- Falta ingresar el Nombre");

            if (tx_direccion.Text == "")
                msg.Add("- Falta ingresar la dirección");

            if (lstComunas.SelectedItem.Text == " Seleccione opcion")
                msg.Add("- Falta ingresar la comuna");

            return (msg);

        }


    }
}