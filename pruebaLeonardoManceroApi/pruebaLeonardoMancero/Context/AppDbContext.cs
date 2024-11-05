using Microsoft.EntityFrameworkCore;
using pruebaLeonardoMancero.Models;

namespace pruebaLeonardoMancero.Context
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
            
        }

        public DbSet<UsuariosRequest> usuriosRequest { get; set; }
        public DbSet<ClienteRequest> ClienteRequest { get; set; } = default!;
        public DbSet<pruebaLeonardoMancero.Models.ClienteResponse> ClienteResponse { get; set; } = default!;
        public DbSet<pruebaLeonardoMancero.Models.ProductosRequest> ProductosRequest { get; set; } = default!;
        public DbSet<pruebaLeonardoMancero.Models.Pedido> FacturaRequest { get; set; } = default!;

    }
}
