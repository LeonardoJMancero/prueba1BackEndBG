using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using pruebaLeonardoMancero.Context;
using pruebaLeonardoMancero.Models;
using pruebaLeonardoMancero.Utils;
using System.Data;

namespace pruebaLeonardoMancero.Datos
{
    public interface IDatosClientes
    {
        List<ClienteResponse> Consultar(ConsultarCliente consultarCliente, AppDbContext _context, string accion);
        MensajeResponse PostClientesRequest(ClienteRequest clienteRequest, AppDbContext context);

        MensajeResponse DeleteClientesRequest(EliminarCliente clienteRequest, AppDbContext _context);
        MensajeResponse PutClientesRequest(ModificarClienteRequest clienteRequest, AppDbContext _context);
    }
    public class DatosClientes : IDatosClientes
    {
        public List<ClienteResponse> Consultar(ConsultarCliente consultarCliente, AppDbContext _context,string accion)
        {
            using (var command = _context.Database.GetDbConnection().CreateCommand())
            {
                SqlDataAdapter ad = new SqlDataAdapter();
                DataSet ds = new DataSet();
                List<ClienteResponse> response = new List<ClienteResponse>();
                try
                {
                    if (consultarCliente.identificacion == null)
                    {
                        consultarCliente.identificacion = "";
                    }

                    command.CommandText = stringHandlers.sp_clientes.Trim();
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add(new SqlParameter("@accion", accion));
                    command.Parameters.Add(new SqlParameter("@identificacion", consultarCliente.identificacion.ToString().Trim()));

                    _context.Database.OpenConnection();
                    ad = new SqlDataAdapter((SqlCommand)command);
                    ad.Fill(ds);
                    var json = JsonConvert.SerializeObject(ds.Tables[0]);
                    response = JsonConvert.DeserializeObject<List<ClienteResponse>>(json);
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

        public MensajeResponse PostClientesRequest(ClienteRequest clienteRequest, AppDbContext context)
        {

            using (var command = context.Database.GetDbConnection().CreateCommand())
            {
                MensajeResponse mensajeResponse = new MensajeResponse();

                try
                {
                    var validar = validacion(clienteRequest);

                    if (validar.mensaje != "" && validar.statusCode != 0)
                    {
                        return validar;
                    }


                    command.CommandText = stringHandlers.sp_clientes;
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add(new SqlParameter("@accion", stringHandlers.InsertarClientes));
                    command.Parameters.Add(new SqlParameter("@nombre", clienteRequest.nombres.Trim()));
                    command.Parameters.Add(new SqlParameter("@identificacion", clienteRequest.identificacion.Trim()));
                    command.Parameters.Add(new SqlParameter("@direccion", clienteRequest.direccion.Trim()));
                    command.Parameters.Add(new SqlParameter("@telefono", clienteRequest.telefono.Trim()));
                    command.Parameters.Add(new SqlParameter("@email", clienteRequest.email.Trim()));
                    


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

        public MensajeResponse PutClientesRequest(ModificarClienteRequest clienteRequest, AppDbContext _context)
        {
            using (var command = _context.Database.GetDbConnection().CreateCommand())
            {
                MensajeResponse mensajeResponse = new MensajeResponse();
                try
                {
                    command.CommandText = stringHandlers.sp_clientes.Trim();
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add(new SqlParameter("@accion", stringHandlers.ModificarClientes));
                    command.Parameters.Add(new SqlParameter("@nombre", clienteRequest.nombres.Trim()));
                    command.Parameters.Add(new SqlParameter("@direccion", clienteRequest.direccion.Trim()));
                    command.Parameters.Add(new SqlParameter("@telefono", clienteRequest.telefono.Trim()));
                    command.Parameters.Add(new SqlParameter("@email", clienteRequest.email.Trim()));
                    command.Parameters.Add(new SqlParameter("@estado", clienteRequest.estado.Trim()));
                    command.Parameters.Add(new SqlParameter("@identificacion", clienteRequest.identificacion.Trim()));


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

        public MensajeResponse DeleteClientesRequest(EliminarCliente clienteRequest, AppDbContext _context)
        {
            using (var command = _context.Database.GetDbConnection().CreateCommand())
            {
                MensajeResponse mensajeResponse = new MensajeResponse();
                try
                {

                    command.CommandText = stringHandlers.sp_clientes.Trim();
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add(new SqlParameter("@accion", stringHandlers.EliminarUsuarios));
                    command.Parameters.Add(new SqlParameter("@estado", stringHandlers.Inactivo.Trim()));
                    command.Parameters.Add(new SqlParameter("@identificacion", clienteRequest.identificacion.Trim()));


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

        private MensajeResponse validacion(ClienteRequest clienteRequest)
        {
            MensajeResponse mensajeResponse = new MensajeResponse();

            if (Validador.cliente(clienteRequest.nombres))
            {
                mensajeResponse.mensaje = stringHandlers.mensajeUsuario;
                mensajeResponse.statusCode = stringHandlers.statusMensaje;
            }

            if (Validador.cliente(clienteRequest.identificacion))
            {
                mensajeResponse.mensaje = stringHandlers.mensajeIdentificacion;
                mensajeResponse.statusCode = stringHandlers.statusMensaje;
            }

            if (Validador.cliente(clienteRequest.direccion))
            {
                mensajeResponse.mensaje = stringHandlers.mensajeDireccion;
                mensajeResponse.statusCode = stringHandlers.statusMensaje;
            }

            if (Validador.cliente(clienteRequest.telefono))
            {
                mensajeResponse.mensaje = stringHandlers.mensajeTelefono;
                mensajeResponse.statusCode = stringHandlers.statusMensaje;
            }

            if (Validador.cliente(clienteRequest.email))
            {
                mensajeResponse.mensaje = stringHandlers.mensajeEmail;
                mensajeResponse.statusCode = stringHandlers.statusMensaje;
            }            

            return mensajeResponse;
        }

    }
}
