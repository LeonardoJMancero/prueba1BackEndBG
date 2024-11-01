using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace pruebaLeonardoMancero.Models
{
    #pragma warning disable // Desactiva todos los warnings
    public class MensajeResponse
    {
        public string mensaje {  get; set; }
        public int statusCode {  get; set; }
    }

    public class UsuariosResponse()
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

        [JsonPropertyName("estado")]
        public string estado { get; set; }

        [JsonPropertyName("fechaRegistro")]
        public DateTime fechaRegistro { get; set; }

    }

    public class ClienteResponse
    {
        [JsonPropertyName("nombre")]
        public string nombre { get; set; }

        [JsonPropertyName("identificacion")]
        [Key]
        public string identificacion { get; set; }

        [JsonPropertyName("direccion")]
        public string direccion { get; set; }

        [JsonPropertyName("telefono")]
        public string telefono { get; set; }

        [JsonPropertyName("email")]
        public string email { get; set; }

        [JsonPropertyName("estado")]
        public string estado { get; set; }

        [JsonPropertyName("fechaRegistro")]
        public DateTime fechaRegistro { get; set; }
    }

    public class ProductosResponse
    {
        [JsonPropertyName("codigo")]       
        public string codigo { get; set; }

        [JsonPropertyName("nombreProducto")]
        public string nombreProducto { get; set; }

        [JsonPropertyName("precio")]
        public decimal precio { get; set; }

        [JsonPropertyName("costo")]
        public decimal costo { get; set; }

        [JsonPropertyName("estado")]
        public string estado { get; set; }

        [JsonPropertyName("fechaRegistro")]
        public DateTime fechaRegistro { get; set; }
    }
}
