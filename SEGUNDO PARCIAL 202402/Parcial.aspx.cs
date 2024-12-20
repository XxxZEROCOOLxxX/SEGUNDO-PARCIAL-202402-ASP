using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;

namespace SEGUNDO_PARCIAL_202402
{
    public partial class Parcial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
            }
        }

        protected void btn_agre_Click(object sender, EventArgs e)
        {
            try
            {
                GuardarDatosEstudiante();
                status.Text = "Datos del estudiante guardados exitosamente.";
            }
            catch (Exception ex)
            {
                status.Text = "Ocurrió un error al guardar los datos: " + ex.Message;
            }
        }

        private void GuardarDatosEstudiante()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            string tipoDocumento = ddl_tiposDocu.SelectedValue;
            string numeroDocumento = tb_numDocu.Text;
            string nombres = tb_nombs.Text;
            string apellidos = tb_apells.Text;
            DateTime? fechaNacimiento = null;

            if (!string.IsNullOrEmpty(tb_fecha.Text))
            {
                fechaNacimiento = DateTime.Parse(tb_fecha.Text);
            }

            string telefonoResidencial = tb_tel_resi.Text;
            string direccionResidencial = tb_dir_resi.Text;
            string telefonoOficina = tb_tel_ofi.Text;
            string direccionOficina = tb_dir_ofi.Text;
            string telefonoCelular = tb_tel_cel.Text;
            string otro = tb_tel_otro.Text;
            string gradoEstudiante = tb_grado.Text;
            string agregarPadres = tb_padres.Text;
            string gradoIngreso = tb_grado_ingre.Text;
            string email = tb_email.Text;

            byte[] fotografia = null;
            if (fu_foto.HasFile)
            {
                using (Stream fs = fu_foto.PostedFile.InputStream)
                using (BinaryReader br = new BinaryReader(fs))
                {
                    fotografia = br.ReadBytes((int)fs.Length);
                }
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"INSERT INTO [dbo].[Datos] 
                 ([Tipo de documento], [Numero de documento], [Nombres], [Apellidos], [Fecha de nacimiento], [Fotografia], 
                  [Telefono residencial], [Dirección residencial], [Teléfono oficina], [Dirección oficina], 
                  [Teléfono celular], [Otro], [Grado del estudiante], [Agregar padres], [Grado de ingreso], [Email]) 
                 VALUES 
                 (@TipoDocumento, @NumeroDocumento, @Nombres, @Apellidos, @FechaNacimiento, @Fotografia, 
                  @TelefonoResidencial, @DireccionResidencial, @TelefonoOficina, @DireccionOficina, 
                  @TelefonoCelular, @Otro, @GradoEstudiante, @AgregarPadres, @GradoIngreso, @Email)";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@TipoDocumento", tipoDocumento);
                    cmd.Parameters.AddWithValue("@NumeroDocumento", numeroDocumento);
                    cmd.Parameters.AddWithValue("@Nombres", nombres);
                    cmd.Parameters.AddWithValue("@Apellidos", apellidos);
                    cmd.Parameters.AddWithValue("@FechaNacimiento", (object)fechaNacimiento ?? DBNull.Value);

                    SqlParameter fotoParam = new SqlParameter("@Fotografia", SqlDbType.VarBinary, -1);
                    fotoParam.Value = fotografia ?? (object)DBNull.Value;
                    cmd.Parameters.Add(fotoParam);

                    cmd.Parameters.AddWithValue("@TelefonoResidencial", telefonoResidencial);
                    cmd.Parameters.AddWithValue("@DireccionResidencial", direccionResidencial);
                    cmd.Parameters.AddWithValue("@TelefonoOficina", telefonoOficina);
                    cmd.Parameters.AddWithValue("@DireccionOficina", direccionOficina);
                    cmd.Parameters.AddWithValue("@TelefonoCelular", telefonoCelular);
                    cmd.Parameters.AddWithValue("@Otro", otro);
                    cmd.Parameters.AddWithValue("@GradoEstudiante", gradoEstudiante);
                    cmd.Parameters.AddWithValue("@AgregarPadres", agregarPadres);
                    cmd.Parameters.AddWithValue("@GradoIngreso", gradoIngreso);
                    cmd.Parameters.AddWithValue("@Email", email);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    ddl_tiposDocu.SelectedIndex = 0; 
                    tb_numDocu.Text = "";
                    tb_nombs.Text = ""; 
                    tb_apells.Text = ""; 
                    tb_fecha.Text = ""; 
                    fu_foto.Attributes.Clear();
                    tb_tel_resi.Text = ""; 
                    tb_dir_resi.Text = ""; 
                    tb_tel_ofi.Text = ""; 
                    tb_dir_ofi.Text = ""; 
                    tb_tel_cel.Text = ""; 
                    tb_tel_otro.Text = "";
                    tb_grado.Text = ""; 
                    tb_padres.Text = ""; 
                    tb_grado_ingre.Text = ""; 
                    tb_email.Text = "";

                    GridView1.DataBind();
                    GridView2.DataBind();
                }
            }
        }

        protected void btn_cance_Click(object sender, EventArgs e)
        {
            ddl_tiposDocu.SelectedIndex = 0;
            tb_numDocu.Text = "";
            tb_nombs.Text = "";
            tb_apells.Text = "";
            tb_fecha.Text = "";
            fu_foto.Attributes.Clear();
            tb_tel_resi.Text = "";
            tb_dir_resi.Text = "";
            tb_tel_ofi.Text = "";
            tb_dir_ofi.Text = "";
            tb_tel_cel.Text = "";
            tb_tel_otro.Text = "";
            tb_grado.Text = "";
            tb_padres.Text = "";
            tb_grado_ingre.Text = "";
            tb_email.Text = "";
        }

        protected void lnk_view1_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void lnk_view2_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void ddl_opciones_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddl_opciones.SelectedValue == "1")
            {
                div_grados.Visible = true;
                div_nombres.Visible = false;
                GridView2.DataSource = null;
                GridView2.Visible = false;
            }
            else if (ddl_opciones.SelectedValue == "2")
            {
                div_nombres.Visible = true;
                div_grados.Visible = false;
                GridView2.DataSource = null;
                GridView2.Visible = false;
            }
            else
            {
                div_grados.Visible = false;
                div_nombres.Visible = false;
                GridView2.DataSource = null;
                GridView2.Visible = false;
            }
        }

        protected void ddl_grados_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddl_grados.SelectedValue != "0")
            {
                string gradoSeleccionado = ddl_grados.SelectedValue;
                SqlDataSource2.SelectCommand = $"SELECT * FROM [Datos] WHERE [Grado del estudiante] = @Grado";
                SqlDataSource2.SelectParameters.Clear();
                SqlDataSource2.SelectParameters.Add("Grado", gradoSeleccionado);
                GridView2.DataBind();
                GridView2.Visible = true;
            }
            else
            {
                GridView2.Visible = false;
            }
        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            string nombreBuscar = tb_buscarNombres.Text.Trim();
            if (!string.IsNullOrEmpty(nombreBuscar))
            {
                SqlDataSource2.SelectCommand = "SELECT * FROM [Datos] WHERE [Nombres] LIKE @Nombre";
                SqlDataSource2.SelectParameters.Clear();
                SqlDataSource2.SelectParameters.Add("Nombre", "%" + nombreBuscar + "%");
                GridView2.DataBind();
                GridView2.Visible = true;
            }
            else
            {
                lb_mensaje.Text = "Por favor ingrese un nombre para buscar.";
                lb_mensaje.Visible = true;
                GridView2.Visible = false;
            }
        }
    }
}