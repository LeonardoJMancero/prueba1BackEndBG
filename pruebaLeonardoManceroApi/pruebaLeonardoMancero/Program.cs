using Microsoft.EntityFrameworkCore;
using pruebaLeonardoMancero.Context;
using pruebaLeonardoMancero.Datos;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll",
        builder => builder
            .AllowAnyOrigin() // Permitir cualquier origen
            .AllowAnyMethod() // Permitir cualquier método (GET, POST, etc.)
            .AllowAnyHeader()); // Permitir cualquier encabezado
});

// Add services to the container.

//Conexion
var connectionString = builder.Configuration.GetConnectionString("Connection");
builder.Services.AddDbContext<AppDbContext>(
    options => options.UseSqlServer(connectionString)
);

builder.Services.AddScoped<DatosUsuarios>();
builder.Services.AddScoped<DatosClientes>();
builder.Services.AddScoped<MapeoDatosProductos>();
builder.Services.AddScoped<MapeoDatosFacturas>();


builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddSingleton<IDatosUsuarios, DatosUsuarios>();
builder.Services.AddSingleton<IMapeoDatos, DatosClientes>();
builder.Services.AddSingleton<IMapeoDatosProductos, MapeoDatosProductos>();
builder.Services.AddSingleton<IMapeoDatosFacturas, MapeoDatosFacturas>();
var app = builder.Build();

// Habilitar CORS
app.UseCors("AllowAll");

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
