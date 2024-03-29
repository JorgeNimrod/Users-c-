USE [NimrodHernandez]
GO
/****** Object:  Table [dbo].[Ciudades]    Script Date: 27/06/2019 16:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ciudades](
	[id_ciudad] [int] NOT NULL,
	[id_estado] [int] NOT NULL,
	[ciudad] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CIUDAD] PRIMARY KEY CLUSTERED 
(
	[id_ciudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ciudadesss]    Script Date: 27/06/2019 16:17:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ciudadesss](
	[id_ciudad] [int] IDENTITY(1,1) NOT NULL,
	[ciudad] [nvarchar](50) NULL,
	[id_estado] [nvarchar](50) NULL,
 CONSTRAINT [PK_ciudadesss] PRIMARY KEY CLUSTERED 
(
	[id_ciudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Estados]    Script Date: 27/06/2019 16:17:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estados](
	[id_estado] [int] NOT NULL,
	[estado] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ESTADO] PRIMARY KEY CLUSTERED 
(
	[id_estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 27/06/2019 16:17:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[IdUsu] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Direccion] [nvarchar](50) NULL,
	[Telefono] [nvarchar](50) NULL,
	[CodigoPostal] [nvarchar](50) NULL,
	[TipoUsuario] [nvarchar](50) NULL,
	[Estado] [nvarchar](50) NULL,
	[Ciudad] [nvarchar](50) NULL,
	[Usuario] [nvarchar](50) NULL,
	[Contrasena] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 27/06/2019 16:17:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[direccion] [nvarchar](50) NOT NULL,
	[telefono] [nvarchar](50) NOT NULL,
	[codigo_postal] [nvarchar](50) NOT NULL,
	[tipo_usuario] [nvarchar](50) NOT NULL,
	[contrasena] [nvarchar](50) NOT NULL,
	[estadofk] [int] NOT NULL,
	[ciudadfk] [int] NOT NULL,
 CONSTRAINT [PK_USUARIO] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Ciudades]  WITH CHECK ADD FOREIGN KEY([id_estado])
REFERENCES [dbo].[Estados] ([id_estado])
GO
/****** Object:  StoredProcedure [dbo].[AddNewUser]    Script Date: 27/06/2019 16:17:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddNewUser]  
(  
   @nombre nvarchar (50),  
   @direccion nvarchar (50),  
    @telefono nvarchar (50),  
	 @codigo_postal nvarchar (50),  
	  @tipo_usuario nvarchar (50),  
	   @contrasena nvarchar (100),  
   @estadofk int,  
   @ciudadfk int
)  
as  
begin  
   Insert into Usuarios values(@nombre,@direccion,@telefono,@codigo_postal,@tipo_usuario,@contrasena,@estadofk,@ciudadfk)  
End
GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 27/06/2019 16:17:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[DeleteUser]  
(  
   @id_usuario int  
)  
as   
begin  
   Delete from Usuarios where id_usuario=@id_usuario  
End

GO
/****** Object:  StoredProcedure [dbo].[getuser]    Script Date: 27/06/2019 16:17:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getuser]
    @nombre nvarchar(50),
    @direccion nvarchar(50),
	@telefono nvarchar(50),
	@codigo_postal nvarchar(50),
	@tipo_usuario nvarchar(50),
    @contrasena nvarchar(100),
	@estadofk int,
	@ciudadfk int
AS
BEGIN
    SELECT 
	   * 
    FROM 
	   dbo.Usuarios 
	   INNER JOIN dbo.Estados ON dbo.Usuarios.estadofk = dbo.Estados.estado 
 
END














--Create Procedure [dbo].[GetUserDetails]   
--as  
--begin  
--   select * from Usuarios
--End
GO
/****** Object:  StoredProcedure [dbo].[GetUserDetails]    Script Date: 27/06/2019 16:17:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[GetUserDetails]   
as  
begin  
   select * from Usuarios
End

GO
/****** Object:  StoredProcedure [dbo].[LoginUser]    Script Date: 27/06/2019 16:17:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE
procedure [dbo].[LoginUser]

@nombre varchar(50),

@contrasena varchar(50)

AS

SELECT
count(*) FROM Usuarios WHERE


nombre= @nombre AND contrasena = @contrasena

GO
/****** Object:  StoredProcedure [dbo].[Procedure]    Script Date: 27/06/2019 16:17:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Procedure]
	@param1 int = 0,
	@param2 int
AS
	SELECT @param1, @param2
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 27/06/2019 16:17:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateUser]   
(  
   @id_usuario int,  
   @nombre nvarchar (50),  
   @direccion nvarchar (50),  
    @telefono nvarchar (50), 
 @codigo_postal nvarchar (50), 
  @tipo_usuario nvarchar (50), 
	@contrasena nvarchar (100),  
    @estadofk int, 
	  @ciudadfk int
)  
as  
begin  
   Update Usuarios   
   set nombre=@nombre,  
   direccion =@direccion,  
   telefono =@telefono,
    codigo_postal=@codigo_postal,
	 tipo_usuario=@tipo_usuario,
	  contrasena=@contrasena,
	   estadofk=@estadofk,
	    ciudadfk=@ciudadfk
   where id_usuario=@id_usuario
End
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserDetails]    Script Date: 27/06/2019 16:17:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateUserDetails]   
(  
   @id_usuario int,  
   @nombre nvarchar (50),  
   @direccion nvarchar (50),  
    @telefono nvarchar (50), 
 @codigo_postal nvarchar (50), 
  @tipo_usuario nvarchar (50), 
	@contrasena nvarchar (100),  
    @estadofk int, 
	  @ciudadfk int
)  
as  
begin  
   Update Usuarios   
   set nombre=@nombre,  
   direccion =@direccion,  
   telefono =@telefono,
    codigo_postal=@codigo_postal,
	 tipo_usuario=@tipo_usuario,
	  contrasena=@contrasena,
	   estadofk=@estadofk,
	    @ciudadfk=@ciudadfk
   where id_usuario=@id_usuario
End
GO
