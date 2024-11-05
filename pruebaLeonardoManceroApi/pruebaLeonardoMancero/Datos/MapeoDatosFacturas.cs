using Azure;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using pruebaLeonardoMancero.Context;
using pruebaLeonardoMancero.Models;
using pruebaLeonardoMancero.Utils;
using System.Data;

namespace pruebaLeonardoMancero.Datos
{
    public interface IMapeoDatosFacturas
    {
        int PostFacturasRequest(Pedido facturasRequest, AppDbContext context);
        int Detalle(Producto productos, AppDbContext context, int idcabecera);
    }

    public class MapeoDatosFacturas : IMapeoDatosFacturas
    {

        public int PostFacturasRequest(Pedido facturasRequest, AppDbContext context)
        {

            using (var command = context.Database.GetDbConnection().CreateCommand())
            {
                int idcab = 0;
                try
                {
                    command.CommandText = stringHandlers.sp_facturas;
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add(new SqlParameter("@accion", stringHandlers.InsertarFacturas));
                    command.Parameters.Add(new SqlParameter("@identificacion", facturasRequest.identificacion?.Trim()));
                    command.Parameters.Add(new SqlParameter("@username", facturasRequest.username?.Trim()));

                    context.Database.OpenConnection();
                    using (var reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            idcab = int.Parse(reader[0].ToString());

                        }
                    }
                    context.Database.CloseConnection();
                    return idcab;

                }
                catch (DbUpdateException ex)
                {
                    context.Database.CloseConnection();
                    return idcab;
                }

            }

        }

        public int Detalle(Producto productos, AppDbContext _context, int idcabecera)
        {

            using (var command = _context.Database.GetDbConnection().CreateCommand())
            {
                int idDet = 0;
                decimal total = (productos.Cantidad * productos.Precio);
                try
                {
                        SqlDataAdapter ad = new SqlDataAdapter();
                        DataSet ds = new DataSet();

                        command.CommandText = stringHandlers.sp_facturas;
                        command.CommandType = CommandType.StoredProcedure;

                        command.Parameters.Add(new SqlParameter("@accion", stringHandlers.InsertarFacturasDetalle));
                        command.Parameters.Add(new SqlParameter("@idCabecera", idcabecera));
                        command.Parameters.Add(new SqlParameter("@codigo", productos.Codigo));
                        command.Parameters.Add(new SqlParameter("@subtotal", total));
                        command.Parameters.Add(new SqlParameter("@cantidad", productos.Cantidad));

                        _context.Database.OpenConnection();
                        using (var reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                idDet = int.Parse(reader[0].ToString());

                            }
                        }
                        _context.Database.CloseConnection();                                         
                    return idDet;
                }
                catch (DbUpdateException ex)
                {
                    return idDet;
                }

            }


        }

        public List<facturasResponse> Consultar( AppDbContext _context, string accion)
        {
            using (var command = _context.Database.GetDbConnection().CreateCommand())
            {
                SqlDataAdapter ad = new SqlDataAdapter();
                DataSet ds = new DataSet();
                List<facturasResponse> response = new List<facturasResponse>();
                try
                {
                   

                    command.CommandText = stringHandlers.sp_facturas.Trim();
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.Add(new SqlParameter("@accion", stringHandlers.ConsultarFacturas));
                    

                    _context.Database.OpenConnection();
                    ad = new SqlDataAdapter((SqlCommand)command);
                    ad.Fill(ds);
                    var json = JsonConvert.SerializeObject(ds.Tables[0]);
                    response = JsonConvert.DeserializeObject<List<facturasResponse>>(json);
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


        private MensajeResponse validacion(Pedido facturasRequest)
        {
            MensajeResponse mensajeResponse = new MensajeResponse();

            if (Validador.usuario(facturasRequest.identificacion))
            {
                mensajeResponse.mensaje = stringHandlers.mensajeUsuario;
                mensajeResponse.statusCode = stringHandlers.statusMensaje;
            }

            if (Validador.usuario(facturasRequest.username))
            {
                mensajeResponse.mensaje = stringHandlers.mensajeNombres;
                mensajeResponse.statusCode = stringHandlers.statusMensaje;
            }

            return mensajeResponse;
        }

    }
}
