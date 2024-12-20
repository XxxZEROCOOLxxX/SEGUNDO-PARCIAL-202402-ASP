<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Parcial.aspx.cs" Inherits="SEGUNDO_PARCIAL_202402.Parcial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="Style/estilo.css" />
    <div class="row mt-4 justify-content-center">
        <div class="col-md-4 text-center mb-2">
            <asp:LinkButton ID="lnk_view1" runat="server" CssClass="text-decoration-none fw-bold h5 text-primary" CausesValidation="False" OnClick="lnk_view1_Click">Agregar estudiantes</asp:LinkButton>
        </div>
        <div class="col-md-4 text-center">
            <asp:LinkButton ID="lnk_view2" runat="server" CssClass="text-decoration-none fw-bold h5 text-secondary" CausesValidation="False" OnClick="lnk_view2_Click">Consultas</asp:LinkButton>
        </div>
    </div>
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <div class="container mt-5">
                <div class="top text-center p-4 rounded mb-4">
                    <h1>Administración de Usuario</h1>
                    <h2>Creación de Estudiante</h2>
                </div>
                <div class="d-flex justify-content-center">
                    <asp:Label ID="Label1" runat="server" Text="Los datos marcados con "></asp:Label>
                    <asp:Label ID="Label3" runat="server" Text="(*)" ForeColor="#CC0000"></asp:Label>
                    <asp:Label ID="Label4" runat="server" Text=" son obligatorios"></asp:Label>
                </div>
                <div class="row mb-3">
                    <asp:Label ID="status" runat="server" Text=""></asp:Label>
                    <!-- Tipo de documento -->
                    <div class="col-md-6">
                        <asp:Label ID="Label2" runat="server" Text="Tipo de documento de identidad "></asp:Label><asp:Label ID="Label5" runat="server" Text="(*)" ForeColor="#CC0000"></asp:Label>
                        <asp:DropDownList ID="ddl_tiposDocu" runat="server" class="form-control" AutoPostBack="True">
                            <asp:ListItem Value="0">Seleccione una opción</asp:ListItem>
                            <asp:ListItem Value="CC">Cédula de ciudadanía</asp:ListItem>
                            <asp:ListItem Value="CE">Cédula de extranjería</asp:ListItem>
                            <asp:ListItem>Pasaporte</asp:ListItem>
                            <asp:ListItem Value="FA">Documento de identificación de las Fuerzas Armadas</asp:ListItem>
                            <asp:ListItem Value="NIT">Número de Identificación Tributaria</asp:ListItem>
                            <asp:ListItem Value="TI">Tarjeta de identidad</asp:ListItem>
                            <asp:ListItem Value="PEP">Permiso Especial de Permanencia</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo obligatorio" Display="Dynamic" ForeColor="#CC0000" InitialValue="0" ControlToValidate="ddl_tiposDocu"></asp:RequiredFieldValidator>
                    </div>
                    <!-- Numero de documento -->
                    <div class="col-md-6">
                        <asp:Label ID="Label6" runat="server" Text="Número de documento "></asp:Label><asp:Label ID="Label7" runat="server" Text="(*)" ForeColor="#CC0000"></asp:Label>
                        <asp:TextBox ID="tb_numDocu" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Campo obligatorio" ControlToValidate="tb_numDocu" ForeColor="#CC0000" Display="Dynamic" InitialValue=""></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Documento incorrecto" ControlToValidate="tb_numDocu" ForeColor="#CC0000" ValidationExpression="^\d{6,10}$"></asp:RegularExpressionValidator>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="tb_numDocu" FilterType="Numbers" />
                    </div>
                </div>
                <!-- Nombres -->
                <div class="row mb-3">
                    <div class="col-md-6">
                        <asp:Label ID="Label8" runat="server" Text="Nombres "></asp:Label><asp:Label ID="Label9" runat="server" Text="(*)" ForeColor="#CC0000"></asp:Label>
                        <asp:TextBox ID="tb_nombs" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Campo obligatorio" ControlToValidate="tb_nombs" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <!-- Apellidos -->
                    <div class="col-md-6">
                        <asp:Label ID="Label10" runat="server" Text="Apellidos "></asp:Label><asp:Label ID="Label11" runat="server" Text="(*)" ForeColor="#CC0000"></asp:Label>
                        <asp:TextBox ID="tb_apells" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Campo obligatorio" ControlToValidate="tb_apells" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <!-- Fecha de nacimiento -->
                <div class="row mb-3">
                    <div class="col-md-6">
                        <asp:Label ID="Label12" runat="server" Text="Fecha de nacimiento"></asp:Label>
                        <asp:TextBox ID="tb_fecha" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </div>
                    <!-- Fotografia -->
                    <div class="col-md-6">
                        <asp:Label ID="Label13" runat="server" Text="Fotografía"></asp:Label>
                        <asp:FileUpload ID="fu_foto" runat="server" CssClass="form-control" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Solo se permiten imagenes jpg, jpeg, png o gif)" ControlToValidate="fu_foto" ForeColor="#CC0000" ValidationExpression="^.*\.(jpg|jpeg|png|gif)$"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="row mb-3">
                    <!-- Telefono residencial -->
                    <div class="col-md-6">
                        <asp:Label ID="Label14" runat="server" Text="Teléfono residencial "></asp:Label><asp:Label ID="Label15" runat="server" Text="(*)" ForeColor="#CC0000"></asp:Label>
                        <asp:TextBox ID="tb_tel_resi" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Campo obligatorio" ControlToValidate="tb_tel_resi" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Telefono incorrecto" ControlToValidate="tb_numDocu" ForeColor="#CC0000" ValidationExpression="^(?:\(?\d{3}\)? ?\d{3} ?\d{4}|\d{10})$"></asp:RegularExpressionValidator>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="tb_tel_resi" FilterType="Numbers" />
                    </div>
                    <!-- Direccion residencial -->
                    <div class="col-md-6">
                        <asp:Label ID="Label16" runat="server" Text="Dirección residencial "></asp:Label><asp:Label ID="Label17" runat="server" Text="(*)" ForeColor="#CC0000"></asp:Label>
                        <asp:TextBox ID="tb_dir_resi" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Campo obligatorio" ControlToValidate="tb_dir_resi" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row mb-3">
                    <!-- Telefono oficina -->
                    <div class="col-md-6">
                        <asp:Label ID="Label18" runat="server" Text="Teléfono oficina"></asp:Label>
                        <asp:TextBox ID="tb_tel_ofi" runat="server" CssClass="form-control"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="tb_tel_ofi" FilterType="Numbers" />
                    </div>
                    <!-- Direccion oficina -->
                    <div class="col-md-6">
                        <asp:Label ID="Label20" runat="server" Text="Dirección oficina"></asp:Label>
                        <asp:TextBox ID="tb_dir_ofi" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <!-- Telefono celular -->
                <div class="row mb-3">
                    <div class="col-md-6">
                        <asp:Label ID="Label19" runat="server" Text="Teléfono celular"></asp:Label>
                        <asp:TextBox ID="tb_tel_cel" runat="server" CssClass="form-control"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="tb_tel_cel" FilterType="Numbers" />
                    </div>
                    <!-- Otro -->
                    <div class="col-md-6">
                        <asp:Label ID="Label22" runat="server" Text="Otro"></asp:Label>
                        <asp:TextBox ID="tb_tel_otro" runat="server" CssClass="form-control"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" TargetControlID="tb_tel_otro" FilterType="Numbers" />
                    </div>
                </div>
                <!-- Grado del Estudiante -->
                <div class="row mb-3">
                    <div class="col-md-6">
                        <asp:Label ID="Label21" runat="server" Text="Grado del estudiante"></asp:Label><asp:Label ID="Label23" runat="server" Text="(*)" ForeColor="#CC0000"></asp:Label>
                        <asp:TextBox ID="tb_grado" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Campo obligatorio" ControlToValidate="tb_grado" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="tb_grado" FilterType="Numbers" />
                        <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="Coloque un grado correcto" ControlToValidate="tb_grado" Display="Dynamic" ForeColor="#CC0000" MaximumValue="11" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                    </div>
                    <!-- Agregar padres -->
                    <div class="col-md-6">
                        <asp:Label ID="Label24" runat="server" Text="Agregar padres/Acudientes"></asp:Label><asp:Label ID="Label25" runat="server" Text="(*)" ForeColor="#CC0000"></asp:Label>
                        <asp:TextBox ID="tb_padres" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Campo obligatorio" ControlToValidate="tb_padres" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <!-- grado ingreso -->
                <div class="row mb-3">
                    <div class="col-md-6">
                        <asp:Label ID="Label26" runat="server" Text="Grado de ingreso a la institución"></asp:Label>
                        <asp:TextBox ID="tb_grado_ingre" runat="server" CssClass="form-control"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" TargetControlID="tb_grado_ingre" FilterType="Numbers" />
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Coloque un grado correcto" ControlToValidate="tb_grado_ingre" Display="Dynamic" ForeColor="#CC0000" MaximumValue="11" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="El grado de ingreso debe ser menor o igual al grado actual" ControlToCompare="tb_grado" ControlToValidate="tb_grado_ingre" Display="Dynamic" ForeColor="#CC0000" Operator="LessThanEqual"></asp:CompareValidator>
                    </div>
                    <!-- Email -->
                    <div class="col-md-6">
                        <asp:Label ID="Label28" runat="server" Text="Email "></asp:Label><asp:Label ID="Label27" runat="server" Text="(*)" ForeColor="#CC0000"></asp:Label>
                        <asp:TextBox ID="tb_email" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Campo obligatorio" ControlToValidate="tb_email" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Telefono incorrecto" ControlToValidate="tb_email" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </div>
                </div>

                <!-- GridView -->
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id_Estudiante" DataSourceID="SqlDataSource1" CssClass="table table-bordered table-hover table-striped">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" />
                        <asp:BoundField DataField="Id_Estudiante" HeaderText="Id_Estudiante" InsertVisible="False" ReadOnly="True" SortExpression="Id_Estudiante" />
                        <asp:BoundField DataField="Tipo de documento" HeaderText="Tipo de documento" SortExpression="Tipo de documento" />
                        <asp:BoundField DataField="Numero de documento" HeaderText="Numero de documento" SortExpression="Numero de documento" />
                        <asp:BoundField DataField="Nombres" HeaderText="Nombres" SortExpression="Nombres" />
                        <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" />
                        <asp:BoundField DataField="Fecha de nacimiento" HeaderText="Fecha de nacimiento" SortExpression="Fecha de nacimiento" />
                        <asp:TemplateField HeaderText="Fotografia">
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server"
                                    ImageUrl='<%# Eval("Fotografia") != DBNull.Value ? "data:image/png;base64," + Convert.ToBase64String((byte[])Eval("Fotografia")) : "" %>'
                                    Width="100px" Height="100px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Telefono residencial" HeaderText="Telefono residencial" SortExpression="Telefono residencial" />
                        <asp:BoundField DataField="Dirección residencial" HeaderText="Dirección residencial" SortExpression="Dirección residencial" />
                        <asp:BoundField DataField="Teléfono oficina" HeaderText="Teléfono oficina" SortExpression="Teléfono oficina" />
                        <asp:BoundField DataField="Dirección oficina" HeaderText="Dirección oficina" SortExpression="Dirección oficina" />
                        <asp:BoundField DataField="Teléfono celular" HeaderText="Teléfono celular" SortExpression="Teléfono celular" />
                        <asp:BoundField DataField="Otro" HeaderText="Otro" SortExpression="Otro" />
                        <asp:BoundField DataField="Grado del estudiante" HeaderText="Grado del estudiante" SortExpression="Grado del estudiante" />
                        <asp:BoundField DataField="Agregar padres" HeaderText="Agregar padres" SortExpression="Agregar padres" />
                        <asp:BoundField DataField="Grado de ingreso" HeaderText="Grado de ingreso" SortExpression="Grado de ingreso" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"/>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Datos] WHERE [Id_Estudiante] = @Id_Estudiante" InsertCommand="INSERT INTO [Datos] ([Tipo de documento], [Numero de documento], [Nombres], [Apellidos], [Fecha de nacimiento], [Fotografia], [Telefono residencial], [Dirección residencial], [Teléfono oficina], [Dirección oficina], [Teléfono celular], [Otro], [Grado del estudiante], [Agregar padres], [Grado de ingreso], [Email]) VALUES (@Tipo_de_documento, @Numero_de_documento, @Nombres, @Apellidos, @Fecha_de_nacimiento, @Fotografia, @Telefono_residencial, @Dirección_residencial, @Teléfono_oficina, @Dirección_oficina, @Teléfono_celular, @Otro, @Grado_del_estudiante, @Agregar_padres, @Grado_de_ingreso, @Email)" SelectCommand="SELECT * FROM [Datos]" UpdateCommand="UPDATE [Datos] SET [Tipo de documento] = @Tipo_de_documento, [Numero de documento] = @Numero_de_documento, [Nombres] = @Nombres, [Apellidos] = @Apellidos, [Fecha de nacimiento] = @Fecha_de_nacimiento, [Fotografia] = @Fotografia, [Telefono residencial] = @Telefono_residencial, [Dirección residencial] = @Dirección_residencial, [Teléfono oficina] = @Teléfono_oficina, [Dirección oficina] = @Dirección_oficina, [Teléfono celular] = @Teléfono_celular, [Otro] = @Otro, [Grado del estudiante] = @Grado_del_estudiante, [Agregar padres] = @Agregar_padres, [Grado de ingreso] = @Grado_de_ingreso, [Email] = @Email WHERE [Id_Estudiante] = @Id_Estudiante">
                    <DeleteParameters>
                        <asp:Parameter Name="Id_Estudiante" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Tipo_de_documento" Type="String" />
                        <asp:Parameter Name="Numero_de_documento" Type="String" />
                        <asp:Parameter Name="Nombres" Type="String" />
                        <asp:Parameter Name="Apellidos" Type="String" />
                        <asp:Parameter DbType="Date" Name="Fecha_de_nacimiento" />
                        <asp:Parameter Name="Fotografia" Type="Object" />
                        <asp:Parameter Name="Telefono_residencial" Type="String" />
                        <asp:Parameter Name="Dirección_residencial" Type="String" />
                        <asp:Parameter Name="Teléfono_oficina" Type="String" />
                        <asp:Parameter Name="Dirección_oficina" Type="String" />
                        <asp:Parameter Name="Teléfono_celular" Type="String" />
                        <asp:Parameter Name="Otro" Type="String" />
                        <asp:Parameter Name="Grado_del_estudiante" Type="String" />
                        <asp:Parameter Name="Agregar_padres" Type="String" />
                        <asp:Parameter Name="Grado_de_ingreso" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Tipo_de_documento" Type="String" />
                        <asp:Parameter Name="Numero_de_documento" Type="String" />
                        <asp:Parameter Name="Nombres" Type="String" />
                        <asp:Parameter Name="Apellidos" Type="String" />
                        <asp:Parameter DbType="Date" Name="Fecha_de_nacimiento" />
                        <asp:Parameter Name="Fotografia" Type="Object" />
                        <asp:Parameter Name="Telefono_residencial" Type="String" />
                        <asp:Parameter Name="Dirección_residencial" Type="String" />
                        <asp:Parameter Name="Teléfono_oficina" Type="String" />
                        <asp:Parameter Name="Dirección_oficina" Type="String" />
                        <asp:Parameter Name="Teléfono_celular" Type="String" />
                        <asp:Parameter Name="Otro" Type="String" />
                        <asp:Parameter Name="Grado_del_estudiante" Type="String" />
                        <asp:Parameter Name="Agregar_padres" Type="String" />
                        <asp:Parameter Name="Grado_de_ingreso" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="Id_Estudiante" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <div class="row mt-4 justify-content-center">
                    <div class="col-md-4 text-center mb-2">
                        <asp:Button ID="btn_agre" runat="server" Text="Agregar" CssClass="btn btn-primary w-100" OnClick="btn_agre_Click" />
                    </div>
                    <div class="col-md-4 text-center">
                        <asp:Button ID="btn_cance" runat="server" Text="Cancelar" CssClass="btn btn-secondary w-100" OnClick="btn_cance_Click" CausesValidation="False" />
                    </div>
                </div>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <div class="container mt-5">
                <div class="top text-center p-4 rounded mb-4">
                    <h1>Administración de Usuario</h1>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <asp:Label ID="lb_opciones" runat="server" Text="Seleccione una opción:"></asp:Label>
                        <asp:DropDownList ID="ddl_opciones" runat="server" CssClass="form-control"
                            AutoPostBack="True" OnSelectedIndexChanged="ddl_opciones_SelectedIndexChanged">
                            <asp:ListItem Value="0" Text="Seleccione una opción" />
                            <asp:ListItem Value="1" Text="Consulta por grado" />
                            <asp:ListItem Value="2" Text="Buscar por nombre" />
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="row mb-3" id="div_grados" runat="server" visible="false">
                    <div class="col-md-6">
                        <asp:Label ID="lb_grados" runat="server" Text="Seleccione un grado:"></asp:Label>
                        <asp:DropDownList runat="server" AutoPostBack="True" CssClass="form-control" ID="ddl_grados" OnSelectedIndexChanged="ddl_grados_SelectedIndexChanged">
                            <asp:ListItem Value="0">Seleccione una opcion</asp:ListItem>
                            <asp:ListItem Value="1">1ro</asp:ListItem>
                            <asp:ListItem Value="2">2do</asp:ListItem>
                            <asp:ListItem Value="3">3ro</asp:ListItem>
                            <asp:ListItem Value="4">4to</asp:ListItem>
                            <asp:ListItem Value="5">5to</asp:ListItem>
                            <asp:ListItem Value="6">6to</asp:ListItem>
                            <asp:ListItem Value="7">7mo</asp:ListItem>
                            <asp:ListItem Value="8">8vo</asp:ListItem>
                            <asp:ListItem Value="9">9no</asp:ListItem>
                            <asp:ListItem Value="10">10mo</asp:ListItem>
                            <asp:ListItem Value="11">11vo</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="row mb-3" id="div_nombres" runat="server" visible="false">
                    <div class="col-md-6">
                        <asp:TextBox ID="tb_buscarNombres" runat="server" CssClass="form-control"
                            Placeholder="Ingrese el nombre"></asp:TextBox>
                    </div>
                    <div class="col-md-2">
                        <asp:Button ID="btn_buscar" runat="server" Text="Buscar" CssClass="btn btn-primary" OnClick="btn_buscar_Click" />
                    </div>
                    <div class="col-md-4">
                        <asp:Label ID="lb_mensaje" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                    </div>
                </div>

                <div class="row mt-4">
                    <div class="col-md-12">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Id_Estudiante" DataSourceID="SqlDataSource2" Visible="False" CssClass="table table-bordered table-hover table-striped">
                            <Columns>
                                <asp:BoundField DataField="Id_Estudiante" HeaderText="Id_Estudiante" InsertVisible="False" ReadOnly="True" SortExpression="Id_Estudiante" />
                                <asp:BoundField DataField="Tipo de documento" HeaderText="Tipo de documento" SortExpression="Tipo de documento" />
                                <asp:BoundField DataField="Numero de documento" HeaderText="Numero de documento" SortExpression="Numero de documento" />
                                <asp:BoundField DataField="Nombres" HeaderText="Nombres" SortExpression="Nombres" />
                                <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" />
                                <asp:BoundField DataField="Fecha de nacimiento" HeaderText="Fecha de nacimiento" SortExpression="Fecha de nacimiento" />
                                <asp:TemplateField HeaderText="Fotografia">
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server"
                                            ImageUrl='<%# Eval("Fotografia") != DBNull.Value ? "data:image/png;base64," + Convert.ToBase64String((byte[])Eval("Fotografia")) : "" %>'
                                            Width="100px" Height="100px" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Telefono residencial" HeaderText="Telefono residencial" SortExpression="Telefono residencial" />
                                <asp:BoundField DataField="Dirección residencial" HeaderText="Dirección residencial" SortExpression="Dirección residencial" />
                                <asp:BoundField DataField="Teléfono oficina" HeaderText="Teléfono oficina" SortExpression="Teléfono oficina" />
                                <asp:BoundField DataField="Dirección oficina" HeaderText="Dirección oficina" SortExpression="Dirección oficina" />
                                <asp:BoundField DataField="Teléfono celular" HeaderText="Teléfono celular" SortExpression="Teléfono celular" />
                                <asp:BoundField DataField="Otro" HeaderText="Otro" SortExpression="Otro" />
                                <asp:BoundField DataField="Grado del estudiante" HeaderText="Grado del estudiante" SortExpression="Grado del estudiante" />
                                <asp:BoundField DataField="Agregar padres" HeaderText="Agregar padres" SortExpression="Agregar padres" />
                                <asp:BoundField DataField="Grado de ingreso" HeaderText="Grado de ingreso" SortExpression="Grado de ingreso" />
                                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Datos] WHERE [Id_Estudiante] = @Id_Estudiante" InsertCommand="INSERT INTO [Datos] ([Tipo de documento], [Numero de documento], [Nombres], [Apellidos], [Fecha de nacimiento], [Fotografia], [Telefono residencial], [Dirección residencial], [Teléfono oficina], [Dirección oficina], [Teléfono celular], [Otro], [Grado del estudiante], [Agregar padres], [Grado de ingreso], [Email]) VALUES (@Tipo_de_documento, @Numero_de_documento, @Nombres, @Apellidos, @Fecha_de_nacimiento, @Fotografia, @Telefono_residencial, @Dirección_residencial, @Teléfono_oficina, @Dirección_oficina, @Teléfono_celular, @Otro, @Grado_del_estudiante, @Agregar_padres, @Grado_de_ingreso, @Email)" SelectCommand="SELECT * FROM [Datos]" UpdateCommand="UPDATE [Datos] SET [Tipo de documento] = @Tipo_de_documento, [Numero de documento] = @Numero_de_documento, [Nombres] = @Nombres, [Apellidos] = @Apellidos, [Fecha de nacimiento] = @Fecha_de_nacimiento, [Fotografia] = @Fotografia, [Telefono residencial] = @Telefono_residencial, [Dirección residencial] = @Dirección_residencial, [Teléfono oficina] = @Teléfono_oficina, [Dirección oficina] = @Dirección_oficina, [Teléfono celular] = @Teléfono_celular, [Otro] = @Otro, [Grado del estudiante] = @Grado_del_estudiante, [Agregar padres] = @Agregar_padres, [Grado de ingreso] = @Grado_de_ingreso, [Email] = @Email WHERE [Id_Estudiante] = @Id_Estudiante">
                            <DeleteParameters>
                                <asp:Parameter Name="Id_Estudiante" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Tipo_de_documento" Type="String" />
                                <asp:Parameter Name="Numero_de_documento" Type="String" />
                                <asp:Parameter Name="Nombres" Type="String" />
                                <asp:Parameter Name="Apellidos" Type="String" />
                                <asp:Parameter DbType="Date" Name="Fecha_de_nacimiento" />
                                <asp:Parameter Name="Fotografia" Type="Object" />
                                <asp:Parameter Name="Telefono_residencial" Type="String" />
                                <asp:Parameter Name="Dirección_residencial" Type="String" />
                                <asp:Parameter Name="Teléfono_oficina" Type="String" />
                                <asp:Parameter Name="Dirección_oficina" Type="String" />
                                <asp:Parameter Name="Teléfono_celular" Type="String" />
                                <asp:Parameter Name="Otro" Type="String" />
                                <asp:Parameter Name="Grado_del_estudiante" Type="String" />
                                <asp:Parameter Name="Agregar_padres" Type="String" />
                                <asp:Parameter Name="Grado_de_ingreso" Type="String" />
                                <asp:Parameter Name="Email" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Tipo_de_documento" Type="String" />
                                <asp:Parameter Name="Numero_de_documento" Type="String" />
                                <asp:Parameter Name="Nombres" Type="String" />
                                <asp:Parameter Name="Apellidos" Type="String" />
                                <asp:Parameter DbType="Date" Name="Fecha_de_nacimiento" />
                                <asp:Parameter Name="Fotografia" Type="Object" />
                                <asp:Parameter Name="Telefono_residencial" Type="String" />
                                <asp:Parameter Name="Dirección_residencial" Type="String" />
                                <asp:Parameter Name="Teléfono_oficina" Type="String" />
                                <asp:Parameter Name="Dirección_oficina" Type="String" />
                                <asp:Parameter Name="Teléfono_celular" Type="String" />
                                <asp:Parameter Name="Otro" Type="String" />
                                <asp:Parameter Name="Grado_del_estudiante" Type="String" />
                                <asp:Parameter Name="Agregar_padres" Type="String" />
                                <asp:Parameter Name="Grado_de_ingreso" Type="String" />
                                <asp:Parameter Name="Email" Type="String" />
                                <asp:Parameter Name="Id_Estudiante" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>
