using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace pruebaLeonardoMancero.Models
{
#pragma warning disable // Desactiva todos los warnings
    public class ProductosRequest
    {
        [JsonPropertyName("codigo")]
        [Key]
        public string codigo {  get; set; }

        [JsonPropertyName("nombreProducto")]
        public string nombreProducto {  get; set; }

        [JsonPropertyName("precio")]
        public decimal precio { get; set; }

        [JsonPropertyName("costo")]
        public decimal costo {  get; set; }

        [JsonPropertyName("estado")]
        public string estado {  get; set; }

    }

    public class EliminarProductoRequest
    {
        [JsonPropertyName("codigo")]        
        public string codigo { get; set; }
    }

    public class ConsultarProductoRequest
    {
        [JsonPropertyName("codigo")]
        public string codigo { get; set; }
    }
}
