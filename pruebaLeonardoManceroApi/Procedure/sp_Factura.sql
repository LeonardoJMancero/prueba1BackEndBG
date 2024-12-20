IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Cliente]') AND type in (N'P', N'PC'))
	EXEC('CREATE PROCEDURE sp_Cliente AS')
GO
ALTER  PROCEDURE [dbo].[sp_Factura]
@accion char(5),
@username varchar(200)			= NULL,
@identificacion varchar(20)		= NULL,
@idCabecera int					= NULL,
@codigo varchar(20)				= NULL,
@subtotal decimal(18,2)			= NULL,
@cantidad int					= NULL
AS
BEGIN

	Declare @idCab int, @tot decimal(18,4),@idDet int

	IF @accion = 'I'
	BEGIN
		BEGIN TRY
		BEGIN TRANSACTION insertCabecera

		INSERT INTO Factura(usernameVendedor,identificacion)
			VALUES(@username,@identificacion)

		SET @idCab = SCOPE_IDENTITY()

		SELECT @idCab

		COMMIT TRANSACTION insertCliente
	END TRY
	BEGIN CATCH
		IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION insertCabecera	
	   END 
	END CATCH
	END

	IF @accion = 'ID'
	BEGIN
		BEGIN TRY
		BEGIN TRANSACTION insertDetalle
 
		select 1
		INSERT INTO FacturaDet(idfacturaCab,codigo,subtotal,cantidad)
			VALUES(@idCabecera,@codigo,@subtotal,@cantidad)

		SELECT @tot = SUM(subtotal) FROM FacturaDet WHERE idfacturaCab = @idCabecera

		update Factura set total = @tot where idfactura=@idCabecera

		set @idDet=SCOPE_IDENTITY()

		select @idDet

		COMMIT TRANSACTION insertDetalle
	END TRY
	BEGIN CATCH
		IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION insertCabecera		  
		  DELETE FROM Factura WHERE idfactura=@idCabecera
	   END 
	END CATCH
	END

	IF @accion ='C'
	BEGIN
		Select a.idfactura,usernameVendedor as username,a.identificacion,b.nombre,a.fechaRegistro,a.total 
		from Factura a 
		inner join Cliente b on a.identificacion=b.identificacion
	END
END
