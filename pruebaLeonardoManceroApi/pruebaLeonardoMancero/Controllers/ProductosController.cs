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
    [Route("api/[controller]")]
    [ApiController]
    public class ProductosController : ControllerBase
    {
        private readonly AppDbContext _context;
        private readonly MapeoDatosProductos _mapeoDatosProductos;

        public ProductosController(AppDbContext context, MapeoDatosProductos mapeoDatosProductos)
        {
            _context = context;
            _mapeoDatosProductos = mapeoDatosProductos;
        }       

        [HttpPost("ActualizarProductos")]
        public async Task<ActionResult<MensajeResponse>> PutProductosRequest(ProductosRequest productosRequest)
        {

            try
            {
                var update = _mapeoDatosProductos.PutProductosRequest(productosRequest, _context);
                return Ok(update);
            }
            catch (DbUpdateException ex)
            {
                return BadRequest(ex.Message.ToString());
            }
        }


        [HttpPost("RegistrarProductos")]
        public async Task<ActionResult<MensajeResponse>> PostProductosRequest(ProductosRequest productosRequest)
        {
        
            try
            {
                var insert = _mapeoDatosProductos.PostProductosRequest(productosRequest, _context);
                return Ok(insert);
            }
            catch (DbUpdateException ex)
            {
                return BadRequest(ex.Message.ToString());
            }            
        }

        
        [HttpPost("EliminarProductos")]
        public async Task<IActionResult> DeleteProductosRequest(EliminarProductoRequest eliminarProductoRequest)
        {
            try
            {
                var delete = _mapeoDatosProductos.DeleteProductosRequest(eliminarProductoRequest, _context);
                return Ok(delete);
            }
            catch (DbUpdateException ex)
            {
                return BadRequest(ex.Message.ToString());
            }
        }


        [HttpPost("ConsultarAllProductos")]
        public List<ProductosResponse> GetProductoAllResponse()
        {
            try
            {
                ConsultarProductoRequest consultaProducto = new ConsultarProductoRequest();
                List<ProductosResponse> ProductoResponses = new List<ProductosResponse>();
                ProductoResponses = _mapeoDatosProductos.Consultar(consultaProducto, _context, stringHandlers.consultarAllProductos);

                return ProductoResponses;
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message.ToString());
            }
        }

        [HttpPost("ConsultarProductos")]
        public List<ProductosResponse> GetProductoResponse(ConsultarProductoRequest consultarProducto)
        {
            try
            {
                List<ProductosResponse> ProductoResponses = new List<ProductosResponse>();
                ProductoResponses = _mapeoDatosProductos.Consultar(consultarProducto, _context, stringHandlers.consultarProductos);

                return ProductoResponses;
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message.ToString());
            }
        }
    }
}
