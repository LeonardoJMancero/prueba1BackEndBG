using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using pruebaLeonardoMancero.Context;
using pruebaLeonardoMancero.Models;
using Microsoft.Data.SqlClient;
using System.Data;
using Microsoft.AspNetCore.Http.HttpResults;
using Newtonsoft.Json;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using pruebaLeonardoMancero.Datos;
using Azure;

namespace pruebaLeonardoMancero.Controllers
{
    #pragma warning disable // Desactiva todos los warnings
    [Route("api/[controller]/[action]")]
    [ApiController]

    public class UsuariosController : ControllerBase
    {
        private readonly AppDbContext _context;

        private readonly DatosUsuarios _datosUsuarios;

        public UsuariosController(AppDbContext context, DatosUsuarios datosUsuarios)
        {
            _context = context;
            _datosUsuarios = datosUsuarios;
        }



        [HttpPost]
        [ActionName("RegistrarUsuarios")]
        public async Task<ActionResult<MensajeResponse>> PostUsuariosRequest(UsuariosRequest usuariosRequest)
        {
            try
            {
                var crearUsuario = _datosUsuarios.PostUsuariosRequest(usuariosRequest, _context);
                return Ok(crearUsuario);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message.ToString());
            }

        }


        [HttpPost]
        [ActionName("ConsultarUsuarios")]
        public List<UsuariosResponse> GetUsuariosRequest(ConsultarUsuario consultarUsuario)
        {
            try
            {
                var consultar = _datosUsuarios.GetUsuariosRequest(consultarUsuario, _context);
                
                return consultar;
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message.ToString());
            }
        }

        [HttpPost]
        [ActionName("ConsultarLogin")]
        public List<MensajeResponse> GetLoginRequest(ConsultarLogin consultarLogin)
        {
            try
            {
                var consultar = _datosUsuarios.GetLoginRequest(consultarLogin, _context);

                return consultar;
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message.ToString());
            }
        }

        [HttpPost]
        [ActionName("ModificarUsuarios")]
        public async Task<ActionResult<MensajeResponse>> PutUsuariosRequest(ModificarUsuarios usuariosRequest)
        {
            try
            {
                var modificar = _datosUsuarios.PutUsuariosRequest(usuariosRequest, _context);
                return modificar;
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message.ToString());
            }
        }


        [HttpPost]
        [ActionName("ModificarUsuariosPassword")]
        public async Task<ActionResult<MensajeResponse>> PutUsuariosPaswwordRequest(ModificarPasswordUsuarios usuariosRequest)
        {
            try
            {
                var modificarPassword = _datosUsuarios.PutUsuariosPaswwordRequest(usuariosRequest, _context);
                return modificarPassword;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message.ToString());
            }
        }


        [HttpPost]
        [ActionName("EliminarUsuarios")]
        public async Task<ActionResult<MensajeResponse>> DeleteUsuariosRequest(EliminarUsuarios usuariosRequest)
        {
            try
            {
                var eliminar = _datosUsuarios.DeleteUsuariosRequest(usuariosRequest, _context);
                return eliminar;
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message.ToString());
            }
        }
    }
}
