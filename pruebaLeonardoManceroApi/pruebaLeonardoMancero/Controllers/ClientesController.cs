using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using pruebaLeonardoMancero.Context;
using pruebaLeonardoMancero.Datos;
using pruebaLeonardoMancero.Models;
using pruebaLeonardoMancero.Utils;

namespace pruebaLeonardoMancero.Controllers
{
#pragma warning disable // Desactiva todos los warnings

    [Route("api/[controller]")]
    [ApiController]
    public class ClientesController : ControllerBase
    {
        private readonly AppDbContext _context;
        private readonly DatosClientes _datosClientes;

        public ClientesController(AppDbContext context,DatosClientes datosClientes)
        {
            _context = context;
            _datosClientes = datosClientes;
        }

        [HttpPost("ConsultarAllClientes")]        
        public List<ClienteResponse> GetClienteAllResponse()
        {
            try
            {
                ConsultarCliente consultaCliente = new ConsultarCliente();
                List<ClienteResponse> clienteResponses = new List<ClienteResponse>();
                clienteResponses = _datosClientes.Consultar(consultaCliente, _context,stringHandlers.consultarAllClientes);

                return clienteResponses;
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message.ToString());
            }
        }

        [HttpPost("ConsultarClientes")]
        public List<ClienteResponse> GetClienteResponse(ConsultarCliente consultarCliente)
        {
            try
            {
                List<ClienteResponse> clienteResponses = new List<ClienteResponse>();
                clienteResponses = _datosClientes.Consultar(consultarCliente, _context, stringHandlers.consultarClientes);

                return clienteResponses;
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message.ToString());
            }
        }


        [HttpPost("RegistrarClientes")]
        
        public async Task<ActionResult<MensajeResponse>> RegistrarClientesRequest(ClienteRequest clienteRequest)
        {
            try
            {
                var crearCliente = _datosClientes.PostClientesRequest(clienteRequest, _context);
                return Ok(crearCliente);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message.ToString());
            }

        }

        [HttpPost("ModificarClientes")]
        
        public async Task<ActionResult<MensajeResponse>> PutClientesRequest(ModificarClienteRequest ClientesRequest)
        {
            try
            {
                var modificar = _datosClientes.PutClientesRequest(ClientesRequest, _context);
                return modificar;
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message.ToString());
            }
        }


        [HttpPost("EliminarClientes")]
        
        public async Task<ActionResult<MensajeResponse>> DeleteClientesRequest(EliminarCliente ClientesRequest)
        {
            try
            {
                var eliminar = _datosClientes.DeleteClientesRequest(ClientesRequest, _context);
                return eliminar;
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message.ToString());
            }
        }

    }
}
