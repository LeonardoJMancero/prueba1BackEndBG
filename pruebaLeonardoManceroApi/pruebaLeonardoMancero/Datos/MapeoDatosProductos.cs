using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using pruebaLeonardoMancero.Context;
using pruebaLeonardoMancero.Models;
using pruebaLeonardoMancero.Utils;
using System.Data;

namespace pruebaLeonardoMancero.Datos
{
    public interface IMapeoDatosProductos
    {
        MensajeResponse PostProductosRequest(ProductosRequest ProductoRequest, AppDbContext context);
        MensajeResponse DeleteProductosRequest(EliminarProductoRequest ProductoRequest, AppDbContext _context);
        MensajeResponse PutProductosRequest(ProductosRequest ProductoRequest, AppDbContext _context);
        List<ProductosResponse> Consultar(ConsultarProductoRequest consultarProducto, AppDbContext _context, string accion);
    }

    public class MapeoDatosProductos:IMapeoDatosProductos
    {
        public MensajeResponse PostProductosRequest(ProductosRequest ProductoRequest, AppDbContext context)
        {

            using (var command = context.Database.GetDbConnection().CreateCommand())
            {
                MensajeResponse mensajeResponse = new MensajeResponse();

                try
                {
                    var validar = validacion(ProductoRequest);

                    if (validar.mensaje != "" && validar.statusCode != 0)
                    {
                        return validar;
                    }


                    command.CommandText = stringHandlers.sp_productos;
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add(new SqlParameter("@accion", stringHandlers.InsertarProductos));
                    command.Parameters.Add(new SqlParameter("@codigo", ProductoRequest.codigo.Trim()));
                    command.Parameters.Add(new SqlParameter("@nombreProducto", ProductoRequest.nombreProducto.Trim()));
                    command.Parameters.Add(new SqlParameter("@estado", ProductoRequest.estado.Trim()));
                    command.Parameters.Add(new SqlParameter("@precio", ProductoRequest.precio));
                    command.Parameters.Add(new SqlParameter("@costo", ProductoRequest.costo));
                    



                    context.Database.OpenConnection();
                    using (var reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            mensajeResponse.mensaje = reader[0].ToString();
                            mensajeResponse.statusCode = int.Parse(reader[1].ToString());
                        }
                    }
                    context.Database.CloseConnection();
                    return mensajeResponse;

                }
                catch (DbUpdateException ex)
                {
                    context.Database.CloseConnection();
                    mensajeResponse.mensaje = ex.Message.ToString();
                    return mensajeResponse;
                }

            }

        }

        public MensajeResponse DeleteProductosRequest(EliminarProductoRequest ProductoRequest, AppDbContext _context)
        {
            using (var command = _context.Database.GetDbConnection().CreateCommand())
            {
                MensajeResponse mensajeResponse = new MensajeResponse();
                try
                {

                    command.CommandText = stringHandlers.sp_productos.Trim();
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add(new SqlParameter("@accion", stringHandlers.EliminarUsuarios));
                    command.Parameters.Add(new SqlParameter("@estado", stringHandlers.Inactivo.Trim()));
                    command.Parameters.Add(new SqlParameter("@codigo", ProductoRequest.codigo.Trim()));


                    _context.Database.OpenConnection();
                    using (var reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            mensajeResponse.mensaje = reader[0].ToString();
                            mensajeResponse.statusCode = int.Parse(reader[1].ToString());
                        }
                    }
                    _context.Database.CloseConnection();
                    return mensajeResponse;

                }
                catch (DbUpdateException ex)
                {
                    _context.Database.CloseConnection();
                    mensajeResponse.mensaje = ex.Message.ToString();
                    return mensajeResponse;
                }
            }

        }

        public MensajeResponse PutProductosRequest(ProductosRequest ProductoRequest, AppDbContext _context)
        {
            using (var command = _context.Database.GetDbConnection().CreateCommand())
            {
                MensajeResponse mensajeResponse = new MensajeResponse();
                try
                {
                    command.CommandText = stringHandlers.sp_productos.Trim();
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add(new SqlParameter("@accion", stringHandlers.ModificarProductos));
                    command.Parameters.Add(new SqlParameter("@codigo", ProductoRequest.codigo.Trim()));
                    command.Parameters.Add(new SqlParameter("@nombreProducto", ProductoRequest.nombreProducto.Trim()));
                    command.Parameters.Add(new SqlParameter("@estado", ProductoRequest.estado.Trim()));
                    command.Parameters.Add(new SqlParameter("@precio", ProductoRequest.precio));
                    command.Parameters.Add(new SqlParameter("@costo", ProductoRequest.costo));

                    _context.Database.OpenConnection();
                    using (var reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            mensajeResponse.mensaje = reader[0].ToString();
                            mensajeResponse.statusCode = int.Parse(reader[1].ToString());
                        }
                    }
                    _context.Database.CloseConnection();
                    return mensajeResponse;

                }
                catch (DbUpdateException ex)
                {
                    _context.Database.CloseConnection();
                    mensajeResponse.mensaje = ex.Message.ToString();
                    return mensajeResponse;
                }

            }

        }

        public List<ProductosResponse> Consultar(ConsultarProductoRequest consultarProducto, AppDbContext _context, string accion)
        {
            using (var command = _context.Database.GetDbConnection().CreateCommand())
            {
                SqlDataAdapter ad = new SqlDataAdapter();
                DataSet ds = new DataSet();
                List<ProductosResponse> response = new List<ProductosResponse>();
                try
                {
                    if (consultarProducto.codigo == null)
                    {
                        consultarProducto.codigo = "";
                    }

                    command.CommandText = stringHandlers.sp_productos.Trim();
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add(new SqlParameter("@accion", accion));
                    command.Parameters.Add(new SqlParameter("@codigo", consultarProducto.codigo.ToString().Trim()));

                    _context.Database.OpenConnection();
                    ad = new SqlDataAdapter((SqlCommand)command);
                    ad.Fill(ds);
                    var json = JsonConvert.SerializeObject(ds.Tables[0]);
                    response = JsonConvert.DeserializeObject<List<ProductosResponse>>(json);
                    _context.Database.CloseConnection();

                    return response;

                }
                catch (DbUpdateException ex)
                {
                    _context.Database.CloseConnection();
                    throw new Exception(ex.Message.ToString());
                }
            }
        }


        private MensajeResponse validacion(ProductosRequest ProductoRequest)
        {
            MensajeResponse mensajeResponse = new MensajeResponse();

            if (Validador.Producto(ProductoRequest.codigo))
            {
                mensajeResponse.mensaje = stringHandlers.mensajeUsuario;
                mensajeResponse.statusCode = stringHandlers.statusMensaje;
            }

            if (Validador.Producto(ProductoRequest.nombreProducto))
            {
                mensajeResponse.mensaje = stringHandlers.mensajeNombres;
                mensajeResponse.statusCode = stringHandlers.statusMensaje;
            }
            

            if (Validador.Producto(ProductoRequest.estado))
            {
                mensajeResponse.mensaje = stringHandlers.mensajePassword;
                mensajeResponse.statusCode = stringHandlers.statusMensaje;
            }

            return mensajeResponse;
        }
    }
}
