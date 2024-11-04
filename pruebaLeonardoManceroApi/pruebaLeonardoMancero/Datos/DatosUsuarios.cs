using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.VisualStudio.Web.CodeGenerators.Mvc.Templates.BlazorIdentity.Shared;
using Newtonsoft.Json;
using pruebaLeonardoMancero.Context;
using pruebaLeonardoMancero.Models;
using pruebaLeonardoMancero.Utils;
using System.Data;

namespace pruebaLeonardoMancero.Datos
{
    #pragma warning disable // Desactiva todos los warnings
    public interface IDatosUsuarios
    {
        MensajeResponse PostUsuariosRequest(UsuariosRequest usuariosRequest, AppDbContext context);
        List<UsuariosResponse> GetUsuariosRequest(ConsultarUsuario consultarUsuario , AppDbContext context);
        List<UsuariosResponse> GetUsuariosAllRequest(AppDbContext context);
        MensajeResponse PutUsuariosRequest(ModificarUsuarios usuariosRequest, AppDbContext _context);
        MensajeResponse PutUsuariosPaswwordRequest(ModificarPasswordUsuarios usuariosRequest, AppDbContext context);
        MensajeResponse DeleteUsuariosRequest(EliminarUsuarios usuariosRequest, AppDbContext _context);
        List<MensajeResponse> GetLoginRequest(ConsultarLogin consultarLogin, AppDbContext _context);

    }
    public class DatosUsuarios : IDatosUsuarios
    {
        public MensajeResponse DeleteUsuariosRequest(EliminarUsuarios usuariosRequest, AppDbContext _context)
        {
            using (var command = _context.Database.GetDbConnection().CreateCommand())
            {
                MensajeResponse mensajeResponse = new MensajeResponse();
                try
                {

                    command.CommandText = stringHandlers.sp_Usuarios.Trim();
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add(new SqlParameter("@accion", stringHandlers.EliminarUsuarios));
                    command.Parameters.Add(new SqlParameter("@estado", stringHandlers.Inactivo));
                    command.Parameters.Add(new SqlParameter("@usuario", usuariosRequest.usuario.Trim()));


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

        public List<UsuariosResponse> GetUsuariosRequest(ConsultarUsuario consultarUsuario, AppDbContext _context)
        {
            using (var command = _context.Database.GetDbConnection().CreateCommand())
            {
                SqlDataAdapter ad = new SqlDataAdapter();
                DataSet ds = new DataSet();
                List<UsuariosResponse> response = new List<UsuariosResponse>();
                try
                {
                    command.CommandText = stringHandlers.sp_Usuarios.Trim();
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add(new SqlParameter("@accion", stringHandlers.consultarUsuarios));
                    command.Parameters.Add(new SqlParameter("@usuario", consultarUsuario.usuario.ToString().Trim()));

                    _context.Database.OpenConnection();
                    ad = new SqlDataAdapter((SqlCommand)command);
                    ad.Fill(ds);
                    var json = JsonConvert.SerializeObject(ds.Tables[0]);
                    response = JsonConvert.DeserializeObject<List<UsuariosResponse>>(json);
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

        public List<UsuariosResponse> GetUsuariosAllRequest(AppDbContext _context)
        {
            using (var command = _context.Database.GetDbConnection().CreateCommand())
            {
                SqlDataAdapter ad = new SqlDataAdapter();
                DataSet ds = new DataSet();
                List<UsuariosResponse> response = new List<UsuariosResponse>();
                try
                {
                    command.CommandText = stringHandlers.sp_Usuarios.Trim();
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add(new SqlParameter("@accion", stringHandlers.consultarUsuariosAll));
                    _context.Database.OpenConnection();
                    ad = new SqlDataAdapter((SqlCommand)command);
                    ad.Fill(ds);
                    var json = JsonConvert.SerializeObject(ds.Tables[0]);
                    response = JsonConvert.DeserializeObject<List<UsuariosResponse>>(json);
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


        public List<MensajeResponse> GetLoginRequest(ConsultarLogin consultarLogin, AppDbContext _context)
        {
            using (var command = _context.Database.GetDbConnection().CreateCommand())
            {
                SqlDataAdapter ad = new SqlDataAdapter();
                DataSet ds = new DataSet();
                List<MensajeResponse> response = new List<MensajeResponse>();
                try
                {
                    command.CommandText = stringHandlers.sp_Usuarios.Trim();
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add(new SqlParameter("@accion", stringHandlers.LogindUsuarios));
                    command.Parameters.Add(new SqlParameter("@usuario", consultarLogin.usuario.ToString().Trim()));
                    command.Parameters.Add(new SqlParameter("@password", consultarLogin.password.ToString().Trim()));

                    _context.Database.OpenConnection();
                    ad = new SqlDataAdapter((SqlCommand)command);
                    ad.Fill(ds);
                    var json = JsonConvert.SerializeObject(ds.Tables[0]);
                    response = JsonConvert.DeserializeObject<List<MensajeResponse>>(json);
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



        public MensajeResponse PostUsuariosRequest(UsuariosRequest usuariosRequest, AppDbContext context)
        {

            using (var command = context.Database.GetDbConnection().CreateCommand())
            {
                MensajeResponse mensajeResponse = new MensajeResponse();

                try
                {
                    var validar = validacion(usuariosRequest);

                    if (validar.mensaje!="" && validar.statusCode!=0)
                    {
                        return validar;
                    }


                    command.CommandText = stringHandlers.sp_Usuarios;
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add(new SqlParameter("@accion", stringHandlers.InsertarUsuarios));
                    command.Parameters.Add(new SqlParameter("@nombre", usuariosRequest.nombres.Trim()));
                    command.Parameters.Add(new SqlParameter("@apellidos", usuariosRequest.apellidos.Trim()));
                    command.Parameters.Add(new SqlParameter("@usuario", usuariosRequest.usuario.Trim()));
                    command.Parameters.Add(new SqlParameter("@email", usuariosRequest.email.Trim()));
                    command.Parameters.Add(new SqlParameter("@password", usuariosRequest.password.Trim()));
                    command.Parameters.Add(new SqlParameter("@confirmacionPassword", usuariosRequest.confirmacionPassword.Trim()));
                    command.Parameters.Add(new SqlParameter("@estado", "Activo"));

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


        public MensajeResponse PutUsuariosPaswwordRequest(ModificarPasswordUsuarios usuariosRequest, AppDbContext _context)
        {
            using (var command = _context.Database.GetDbConnection().CreateCommand())
            {
                MensajeResponse mensajeResponse = new MensajeResponse();
                try
                {
                    command.CommandText = stringHandlers.sp_Usuarios.Trim();
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add(new SqlParameter("@accion", stringHandlers.ModificarPasswordUsuarios));
                    command.Parameters.Add(new SqlParameter("@password", usuariosRequest.password.Trim()));
                    command.Parameters.Add(new SqlParameter("@confirmacionPassword", usuariosRequest.confirmacionPassword.Trim()));
                    command.Parameters.Add(new SqlParameter("@usuario", usuariosRequest.usuario.Trim()));


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

        public MensajeResponse PutUsuariosRequest(ModificarUsuarios usuariosRequest, AppDbContext _context)
        {
            using (var command = _context.Database.GetDbConnection().CreateCommand())
            {
                MensajeResponse mensajeResponse = new MensajeResponse();
                try
                {
                    command.CommandText = stringHandlers.sp_Usuarios.Trim();
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add(new SqlParameter("@accion", stringHandlers.ModificarUsuarios));
                    command.Parameters.Add(new SqlParameter("@nombre", usuariosRequest.nombres.Trim()));
                    command.Parameters.Add(new SqlParameter("@apellidos", usuariosRequest.apellidos.Trim()));
                    command.Parameters.Add(new SqlParameter("@email", usuariosRequest.email.Trim()));
                    command.Parameters.Add(new SqlParameter("@usuario", usuariosRequest.usuario.Trim()));
                    command.Parameters.Add(new SqlParameter("@estado", usuariosRequest.estado.Trim()));


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

        private MensajeResponse validacion(UsuariosRequest usuariosRequest)
        {
            MensajeResponse mensajeResponse = new MensajeResponse();

            if (Validador.usuario(usuariosRequest.usuario))
            {
                mensajeResponse.mensaje = stringHandlers.mensajeUsuario;
                mensajeResponse.statusCode = stringHandlers.statusMensaje;
            }

            if (Validador.usuario(usuariosRequest.nombres))
            {
                mensajeResponse.mensaje = stringHandlers.mensajeNombres;
                mensajeResponse.statusCode = stringHandlers.statusMensaje;
            }

            if (Validador.usuario(usuariosRequest.apellidos))
            {
                mensajeResponse.mensaje = stringHandlers.mensajeApellidos;
                mensajeResponse.statusCode = stringHandlers.statusMensaje;
            }

            if (Validador.usuario(usuariosRequest.email))
            {
                mensajeResponse.mensaje = stringHandlers.mensajeEmail;
                mensajeResponse.statusCode = stringHandlers.statusMensaje;
            }

            if (Validador.usuario(usuariosRequest.password))
            {
                mensajeResponse.mensaje = stringHandlers.mensajePassword;
                mensajeResponse.statusCode = stringHandlers.statusMensaje;
            }

            if (Validador.usuario(usuariosRequest.confirmacionPassword))
            {
                mensajeResponse.mensaje = stringHandlers.mensajeConfirmacion;
                mensajeResponse.statusCode = stringHandlers.statusMensaje;
            }
            
            return mensajeResponse;
        }
    }
}
