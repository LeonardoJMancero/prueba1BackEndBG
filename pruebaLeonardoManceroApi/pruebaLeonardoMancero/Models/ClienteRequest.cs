using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace pruebaLeonardoMancero.Models
{
#pragma warning disable // Desactiva todos los warnings
    public class ClienteRequest
    {

        [JsonPropertyName("nombres")]
        public required string nombres { get; set; }

        [Key]
        [JsonPropertyName("identificacion")]
        public required string identificacion { get; set; }

        [JsonPropertyName("direccion")]
       
        public required string direccion { get; set; }

        [JsonPropertyName("telefono")]
       
        public required string telefono { get; set; }

        [JsonPropertyName("email")]

        public required string email { get; set; }

    }

    public class ModificarClienteRequest
    {

        [JsonPropertyName("nombres")]
        public required string nombres { get; set; }

        [JsonPropertyName("direccion")]

        public required string direccion { get; set; }

        [JsonPropertyName("telefono")]

        public required string telefono { get; set; }

        [JsonPropertyName("email")]

        public required string email { get; set; }

        [JsonPropertyName("estado")]
        public string estado { get; set; }

        [JsonPropertyName("identificacion")]
        public required string identificacion { get; set; }

    }

    public class ConsultarCliente
    {
        [JsonPropertyName("identificacion")]
        public string identificacion { get; set; }
    }

    public class EliminarCliente
    {
        [JsonPropertyName("identificacion")]
        public required string identificacion { get; set; }

        //[JsonPropertyName("estado")]
        //public required string estado { get; set; }
    }
}
