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
    public class FacturaController : ControllerBase
    {
        private readonly AppDbContext _context;
        private readonly MapeoDatosFacturas _datosFacturas;

        public FacturaController(AppDbContext context, MapeoDatosFacturas datosfacturas)
        {
            _context = context;
            _datosFacturas = datosfacturas;
        }


        [HttpPost("RegistrarFacturas")]

        public async Task<ActionResult> RegistrarFacturas(Pedido facturaRequest)
        {
            try
            {
                var idcab = _datosFacturas.PostFacturasRequest(facturaRequest, _context);
                if (idcab!=0)
                {
                    foreach (var item in facturaRequest.Productos)
                    {
                        _datosFacturas.Detalle(item, _context, idcab);
                    }             
                }
                return Ok(idcab);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message.ToString());
            }

        }


        [HttpPost("ConsultarAllFacturas")]
        public List<facturasResponse> GetClienteAllResponse()
        {
            try
            {
               
                List<facturasResponse> clienteResponses = new List<facturasResponse>();
                clienteResponses = _datosFacturas.Consultar( _context, stringHandlers.ConsultarFacturas);

                return clienteResponses;
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message.ToString());
            }
        }

    }
}
