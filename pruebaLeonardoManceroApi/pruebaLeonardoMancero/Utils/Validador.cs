namespace pruebaLeonardoMancero.Utils
{
    public static class Validador
    {
        public static bool usuario(string? valor)
        {
            return string.IsNullOrWhiteSpace(valor);
        }

        public static bool cliente(string? valor)
        {
            return string.IsNullOrWhiteSpace(valor);
        }

        public static bool Producto(string? valor)
        {
            return string.IsNullOrWhiteSpace(valor);
        }


    }

    public static class stringHandlers
    {
        internal static string mensajeNombres = "Debe de Ingresar los Nombres.";
        internal static string mensajeApellidos = "Debe de Ingresar los Apellidos.";
        internal static string mensajeEmail = "Debe de Ingresar el Email.";
        internal static string mensajePassword = "Debe de Ingresar el Password.";
        internal static string mensajeConfirmacion= "Debe de Ingresar la confirmación del Password.";
        internal static string mensajeUsuario= "Debe de Ingresar el Usuario.";
        internal static string mensajeIdentificacion= "Debe de Ingresar el Número de Identificación.";
        internal static string mensajeTelefono= "Debe de Ingresar el Número de Teléfono.";
        internal static string mensajeDireccion= "Debe de Ingresar la Dirección.";
        
        
        internal static string Activo= "Activo";
        internal static string Inactivo= "Inactivo";
      
        internal static int statusMensaje = 500;

        internal static string consultarUsuarios = "C";
        internal static string InsertarUsuarios = "I";
        internal static string ModificarUsuarios = "U";
        internal static string EliminarUsuarios = "D";
        internal static string ModificarPasswordUsuarios = "UP";
        internal static string LogindUsuarios = "CL";


        internal static string consultarClientes = "C";
        internal static string consultarAllClientes = "AC";
        internal static string InsertarClientes = "I";
        internal static string ModificarClientes = "U";
        internal static string EliminarClientes = "D";


        internal static string consultarProductos = "C";
        internal static string consultarAllProductos = "AC";
        internal static string InsertarProductos = "I";
        internal static string ModificarProductos = "U";
        internal static string EliminarProductos = "D";


        internal static string sp_Usuarios = "sp_usuarios";
        internal static string sp_clientes = "sp_Cliente";
        internal static string sp_productos = "sp_Producto";


    }
}
