IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Cliente]') AND type in (N'P', N'PC'))
	EXEC('CREATE PROCEDURE sp_Cliente AS')
GO
ALTER PROCEDURE sp_Cliente
@accion					char(5) ,
@nombre					varchar(200)	= NULL,
@identificacion			char(20)		= NULL,
@direccion				varchar(200)	= NULL,
@telefono				varchar(10)		= NULL,
@email					varchar(200)	= NULL,
@estado					varchar(10)		= NULL

as
BEGIN

DECLARE @mensaje varchar(max),
		@statusCode int,
		@statusOk int=200,
		@statusError int=500

IF @accion ='I'
	BEGIN

	BEGIN TRY
	BEGIN TRANSACTION insertCliente

	IF @identificacion IS NOT NULL
	BEGIN

		IF (SELECT count(1) FROM Cliente WHERE identificacion = @identificacion) = 0
		BEGIN
				INSERT INTO Cliente(nombre,identificacion,direccion,telefono,email)
							Values(@nombre,@identificacion,@direccion,@telefono,@email)

				SET @mensaje ='La Información fue Almacenada Correctamente'
				SET @statusCode= @statusOk
		END
		ELSE
		BEGIN
				SET @mensaje ='Ya existe un Cliente con ese Número de Identificación'
				SET @statusCode= @statusError
		END
	END
	ELSE
	BEGIN
		SET @mensaje ='Error Debe de Ingresar el Número de Identificación'
		SET @statusCode= @statusError
	END

	COMMIT TRANSACTION insertCliente
	END TRY
	BEGIN CATCH
		IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION insertProductos	
		  SET @mensaje = ERROR_MESSAGE()
		  SET @statusCode= @statusError
	   END 
	END CATCH
	END
END

IF @accion ='AC'
BEGIN

	SELECT idCliente,nombre,LTRIM(RTRIM(identificacion)) AS identificacion,direccion,telefono,email,fechaRegistro,LTRIM(RTRIM(estado)) AS estado
	FROM Cliente
END

IF @accion ='C'
BEGIN

	SELECT idCliente,nombre,LTRIM(RTRIM(identificacion)) AS identificacion,direccion,telefono,email,fechaRegistro,LTRIM(RTRIM(estado)) AS estado
	FROM Cliente 
	WHERE identificacion = @identificacion
END

IF @accion = 'U'
BEGIN
	IF @identificacion is not null
	BEGIN

		UPDATE Cliente SET nombre=@nombre,identificacion=@identificacion,direccion=@direccion,telefono=@telefono,email=@email,estado=@estado
		WHERE identificacion=@identificacion
		
		SET @mensaje='La Información del Cliente ha sido Actualizada Correctamente'
		SET @statusCode= @statusOk
	END
	ELSE
	BEGIN
		SET @mensaje='El Número de Identificación es Nulo'
		SET @statusCode= @statusError
	END

END

IF @accion = 'D'
BEGIN
	IF @identificacion is not null
	begin
		UPDATE Cliente 
		SET estado=@estado
		WHERE identificacion = @identificacion

		SET @mensaje='La Información del Cliente ha sido Eliminada Correctamente'
		SET @statusCode= @statusOk
	END
	ELSE
	BEGIN
		SET @mensaje='El Numero de Identificacion es Nulo y No te permite Eliminar'
	END

END

SELECT @mensaje,@statusCode