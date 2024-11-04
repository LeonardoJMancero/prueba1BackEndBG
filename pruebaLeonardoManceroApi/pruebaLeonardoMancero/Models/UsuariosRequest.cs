using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace pruebaLeonardoMancero.Models
{
    public class UsuariosRequest
    {
        
        [JsonPropertyName("nombres")]
        public required string nombres { get; set; }

        [JsonPropertyName("apellidos")]
        public required string apellidos { get; set; }

        [JsonPropertyName("usuario")]
        [Key]
        public required string usuario { get; set; }

        [JsonPropertyName("email")]
      
        public required string email { get; set; }

        [JsonPropertyName("password")]
        public required string password { get; set; }
         
        [JsonPropertyName("confirmacionPassword")]
        public required string confirmacionPassword { get; set; }

    }

    public class ConsultarUsuario
    {
        [JsonPropertyName("usuario")]
        public required string usuario { get; set; }
    }

    public class ConsultarLogin
    {
        [JsonPropertyName("usuario")]
        public required string usuario { get; set; }

        [JsonPropertyName("password")]
        public required string password { get; set; }
    }

    public class ModificarUsuarios
    {
        [JsonPropertyName("nombres")]
        public required string nombres { get; set; }

        [JsonPropertyName("apellidos")]
        public required string apellidos { get; set; }

        [JsonPropertyName("email")]

        public required string email { get; set; }

        [JsonPropertyName("usuario")]       
        public required string usuario { get; set; }
        [JsonPropertyName("estado")]
        public required string estado { get; set; }
    }

    public class EliminarUsuarios()
    {
        [JsonPropertyName("usuario")]
        public required string usuario { get; set; }

        //[JsonPropertyName("estado")]
        //public required string estado { get; set; }
    }

    public class ModificarPasswordUsuarios()
    {
        [JsonPropertyName("usuario")]
        public required string usuario { get; set; }

        [JsonPropertyName("password")]
        public required string password { get; set; }

        [JsonPropertyName("confirmacionPassword")]
        public required string confirmacionPassword { get; set; }
    }
}
