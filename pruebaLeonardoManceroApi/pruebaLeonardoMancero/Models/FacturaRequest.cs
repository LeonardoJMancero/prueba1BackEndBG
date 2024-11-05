using System.ComponentModel.DataAnnotations;

namespace pruebaLeonardoMancero.Models
{
    public class Pedido
    {
        public required string username { get; set; }
        [Key]
        public required string identificacion { get; set; }
        public List<Producto>? Productos { get; set; }
    }
    public class Producto
    {
        [Key]
        public required string Codigo { get; set; }
        public required string NombreProducto { get; set; }
        public required string Estado { get; set; }
        public required string FechaRegistro { get; set; }
        public required decimal Precio { get; set; }
        public required decimal Costo { get; set; }
        public required decimal Cantidad { get; set; }
    }
}
