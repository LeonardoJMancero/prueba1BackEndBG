IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_usuarios]') AND type in (N'P', N'PC'))
	EXEC('CREATE PROCEDURE sp_usuarios AS')
GO
ALTER procedure sp_usuarios
@accion					char(2),
@nombre					varchar(200)	= NULL,
@apellidos				varchar(200)	= NULL,
@email					varchar(200)	= NULL,
@password				varchar(50)		= NULL,
@confirmacionPassword	varchar(50)		= NULL,
@idUsuario				int				= NULL,
@estado					char(15)		= NULL,
@usuario				varchar(50)		= NULL
as
BEGIN

DECLARE @mensaje varchar(max),
		@statusCode int,
		@statusOK int = 200,
		@statusError int = 500
		
		

IF @accion ='I'
	BEGIN

	BEGIN TRY
	BEGIN TRANSACTION insertUsuarios

		IF(SELECT count(1) FROM Usuario where Usuario=@usuario) = 0
		BEGIN
			IF(@password = @confirmacionPassword)
			BEGIN
					INSERT INTO Usuario(nombres,apellidos,email,[password],confirmacionPassword,estado,usuario)
							Values(@nombre,@apellidos,@email,@password,@confirmacionPassword,@estado,@usuario)

					SET @mensaje ='La Informacion fue Insertada Correctamente'
					SET @statusCode = @statusOK
			END
			ELSE
			BEGIN
				SET @mensaje ='El Password y la Confirmacion Password No Coinciden'
				SET @statusCode = @statusError
			END			
		END
		ELSE
		BEGIN
				set @mensaje ='Ya existe un Usuario con ese UserName Registrado'
				set @statusCode = @statusError
		END


	COMMIT TRANSACTION insertUsuarios
	END TRY
	BEGIN CATCH
		IF (@@TRANCOUNT > 0)
		BEGIN
		  ROLLBACK TRANSACTION insertUsuarios	
		  SET @mensaje = ERROR_MESSAGE()	
		  set @statusCode = @statusError
	   END 
	END CATCH
	END
END

IF @accion ='C'
BEGIN

	SELECT nombres,apellidos,email,usuario,[password],confirmacionPassword,RTRIM(LTRIM(estado)) AS estado,fechaRegistro 
	FROM Usuario
	WHERE usuario =@usuario
END

IF @accion ='CL'
BEGIN
		IF(SELECT count(1) FROM usuario WHERE usuario=@usuario and [password] = @password) = 0
		BEGIN
			SET @mensaje ='Favor Validar el UserName y Password sean los Correctos.'
			set @statusCode=@statusError
		END
		ELSE
		BEGIN
			SET @mensaje ='login Correcto.'
			set @statusCode=@statusOK
		END 
END

IF @accion = 'UP'
BEGIN
		IF(@password = @confirmacionPassword)
		BEGIN
			UPDATE Usuario SET password=@password,confirmacionPassword=@confirmacionPassword
			WHERE usuario=@usuario

			set @mensaje ='La Informacion fue Actualizada correctamente del Usuario: ' + UPPER(@usuario)
			set @statusCode=@statusOK
		END
		ELSE
		BEGIN
			SET @mensaje ='El Password y la Confirmacion Password No Coinciden'
			SET @statusCode = @statusError
		END
END

IF @accion = 'D'
BEGIN
	IF @usuario is not null
	begin
		UPDATE Usuario 
		SET estado=@estado
		WHERE usuario = @usuario

		SET @mensaje='El Usuario: ' + LTRIM(RTRIM(UPPER(@usuario))) +', se encuentra ' + LTRIM(RTRIM(UPPER(@estado)))
		SET @statusCode=@statusError

	END
	ELSE
	BEGIN
		SET @mensaje='El Codigo de Usuario es Nulo y No te permite Eliminar'
		set @statusCode=@statusError
	END

END


IF @accion = 'U'
BEGIN
	IF (SELECT COUNT(1) FROM Usuario WHERE usuario = RTRIM(LTRIM(@usuario))) > 0
	BEGIN
	IF @email is not null
	BEGIN
		IF (SELECT COUNT(1) FROM Usuario WHERE email = @email AND usuario=@usuario) = 0
		BEGIN		
				UPDATE Usuario SET nombres=@nombre, apellidos = @apellidos,email=@email
				WHERE usuario=@usuario

				set @mensaje ='La Informacion fue Actualizada correctamente del Usuario: ' + UPPER(@usuario)
				set @statusCode=@statusOK		
								
		END
		ELSE
		BEGIN
			SET @mensaje='Ya existe una Cuenta Asociada con ese Email.'
			set @statusCode=@statusError
		END
	END
	ELSE
	BEGIN
		SET @mensaje='El Email es Nulo1 y No te permite Actualizar'
		set @statusCode=@statusError
	END
	END
	ELSE
	BEGIN
		SET @mensaje='No existe ese Usuario: ' + UPPER(@usuario)
		set @statusCode=@statusError
	END

END



select @mensaje AS mensaje,@statusCode AS statusCode

