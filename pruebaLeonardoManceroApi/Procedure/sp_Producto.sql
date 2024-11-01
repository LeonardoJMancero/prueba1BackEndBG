IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Producto]') AND type in (N'P', N'PC'))
	EXEC('CREATE PROCEDURE sp_Producto AS')
GO
ALTER PROCEDURE sp_Producto
@accion					char(2),
@codigo					varchar(50)			=NULL,
@nombreProducto			varchar(200)		=NULL,
@estado					char(10)			=NULL,
@precio					decimal(18,4)		=NULL,
@costo					decimal(18,4)		=NULL

as
BEGIN

DECLARE @mensaje varchar(max),
		@statusCode int,
		@statusOK int = 200,
		@statusError int = 500

IF @accion ='I'
	BEGIN

	BEGIN TRY
	BEGIN TRANSACTION insertProductos

	IF @precio > @costo
	BEGIN
		IF (SELECT COUNT(1) FROM Producto WHERE codigo = @codigo) = 0
		BEGIN
				INSERT INTO Producto(codigo, nombreProducto,estado,precio,costo)
						Values(@codigo,@nombreProducto,@estado,@precio,@costo)

				SET @mensaje ='La Información fue Almacenada Correctamente'
				SET @statusCode =@statusOK
		END
		ELSE
		BEGIN
				SET @mensaje ='Ya existe un Producto registrado con ese Código'
				SET @statusCode = @statusError
		END
	END
	ELSE
	BEGIN
		SET @mensaje ='Error el Costo es Mayor al Precio.'
		SET @statusCode =@statusError
	END

	COMMIT TRANSACTION insertProductos
	END TRY
	BEGIN CATCH
		IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION insertProductos	
		  SET @mensaje = ERROR_MESSAGE()
	   END 
	END CATCH
	END
END

IF @accion ='C'
BEGIN

	SELECT idproducto,codigo,nombreProducto,RTRIM(LTRIM(estado)) as estado,precio,costo,fechaRegistro
	FROM Producto
	WHERE codigo = @codigo
END

IF @accion ='AC'
BEGIN

	SELECT idproducto,codigo,nombreProducto,RTRIM(LTRIM(estado)) as estado,precio,costo,fechaRegistro
	FROM Producto
	
END

IF @accion = 'U'
BEGIN
	IF @codigo is not null
	BEGIN
		IF (SELECT COUNT(1) FROM Producto WHERE codigo=@codigo) > 0
		BEGIN
			IF @precio > @costo
			BEGIN
				UPDATE Producto SET nombreProducto = @nombreProducto,estado=@estado,precio=@precio,costo = @costo
				WHERE codigo=@codigo

				SET @mensaje ='El Producto fue Actualizado Correctamente.'
				SET @statusCode=@statusOK
			END
			ELSE
			BEGIN
				SET @mensaje ='Error al Actualizar el Costo es Mayor al Precio.'
				SET @statusCode=@statusError
			END
		END
		ELSE
		BEGIN
			SET @mensaje='No exite Producto con ese Código'
			SET @statusCode=@statusOK
		END
	END
	ELSE
	BEGIN
		SET @mensaje='El Codigo del Producto es Nulo y No te permite Actualizar'
		SET @statusCode=@statusError
	END

END

IF @accion = 'D'
BEGIN
	IF @codigo is not null
	BEGIN
		IF (SELECT COUNT(1) FROM Producto WHERE codigo=@codigo) > 0
		BEGIN
			UPDATE Producto 
			SET estado=@estado
			WHERE codigo = @codigo

			SET @mensaje='El Producto ha sido Desactivado Correctamente'
			SET @statusCode=@statusOK
		END
		ELSE
		BEGIN
			SET @mensaje='No exite Producto con ese Código'
			SET @statusCode=@statusOK
		END
	END
	ELSE
	BEGIN
		SET @mensaje='El Codigo de Usuario es Nulo y No te permite Eliminar'
		SET @statusCode=@statusError
	END

END

SELECT @mensaje,@statusCode