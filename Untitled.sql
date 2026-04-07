CREATE TABLE [Propietario] (
  [id_propietario] int PRIMARY KEY IDENTITY(1, 1),
  [nombre] nvarchar(255),
  [telefono] nvarchar(255),
  [direccion] nvarchar(255)
)
GO

CREATE TABLE [Embarcacion] (
  [id_embarcacion] int PRIMARY KEY IDENTITY(1, 1),
  [nombre] nvarchar(255),
  [longitud_pies] int,
  [estado] nvarchar(255),
  [id_propietario] int
)
GO

CREATE TABLE [Cliente] (
  [id_cliente] int PRIMARY KEY IDENTITY(1, 1),
  [nombre] nvarchar(255),
  [telefono] nvarchar(255),
  [direccion] nvarchar(255),
  [experiencia_nivel] nvarchar(255)
)
GO

CREATE TABLE [Viaje] (
  [id_viaje] int PRIMARY KEY IDENTITY(1, 1),
  [fecha_inicio] date,
  [fecha_fin] date,
  [destino] nvarchar(255),
  [nivel_peligro] nvarchar(255),
  [id_cliente] int,
  [id_embarcacion] int
)
GO

CREATE TABLE [Equipo] (
  [id_equipo] int PRIMARY KEY IDENTITY(1, 1),
  [nombre] nvarchar(255),
  [tipo] nvarchar(255),
  [descripcion] nvarchar(255)
)
GO

CREATE TABLE [Equipo_Embarcacion] (
  [id_equipo_embarcacion] int PRIMARY KEY IDENTITY(1, 1),
  [id_embarcacion] int,
  [id_equipo] int,
  [cantidad] int
)
GO

CREATE TABLE [Tripulacion] (
  [id_tripulacion] int PRIMARY KEY IDENTITY(1, 1),
  [nombre] nvarchar(255),
  [especialidad] nvarchar(255),
  [tarifa_hora] decimal
)
GO

CREATE TABLE [Viaje_Tripulacion] (
  [id_viaje_tripulacion] int PRIMARY KEY IDENTITY(1, 1),
  [id_viaje] int,
  [id_tripulacion] int,
  [horas_trabajadas] int
)
GO

CREATE TABLE [Mantenimiento] (
  [id_mantenimiento] int PRIMARY KEY IDENTITY(1, 1),
  [id_embarcacion] int,
  [fecha] date,
  [tipo_servicio] nvarchar(255),
  [costo] decimal,
  [descripcion] nvarchar(255)
)
GO

CREATE TABLE [Reparacion] (
  [id_reparacion] int PRIMARY KEY IDENTITY(1, 1),
  [id_embarcacion] int,
  [fecha] date,
  [descripcion] nvarchar(255),
  [costo] decimal,
  [calidad] nvarchar(255)
)
GO

CREATE TABLE [Despachador] (
  [id_despachador] int PRIMARY KEY IDENTITY(1, 1),
  [nombre] nvarchar(255),
  [telefono] nvarchar(255)
)
GO

CREATE TABLE [Reparacion_Viaje] (
  [id_reparacion_viaje] int PRIMARY KEY IDENTITY(1, 1),
  [id_viaje] int,
  [id_reparacion] int,
  [id_despachador] int
)
GO

ALTER TABLE [Embarcacion] ADD FOREIGN KEY ([id_propietario]) REFERENCES [Propietario] ([id_propietario])
GO

ALTER TABLE [Viaje] ADD FOREIGN KEY ([id_cliente]) REFERENCES [Cliente] ([id_cliente])
GO

ALTER TABLE [Viaje] ADD FOREIGN KEY ([id_embarcacion]) REFERENCES [Embarcacion] ([id_embarcacion])
GO

ALTER TABLE [Equipo_Embarcacion] ADD FOREIGN KEY ([id_embarcacion]) REFERENCES [Embarcacion] ([id_embarcacion])
GO

ALTER TABLE [Equipo_Embarcacion] ADD FOREIGN KEY ([id_equipo]) REFERENCES [Equipo] ([id_equipo])
GO

ALTER TABLE [Viaje_Tripulacion] ADD FOREIGN KEY ([id_viaje]) REFERENCES [Viaje] ([id_viaje])
GO

ALTER TABLE [Viaje_Tripulacion] ADD FOREIGN KEY ([id_tripulacion]) REFERENCES [Tripulacion] ([id_tripulacion])
GO

ALTER TABLE [Mantenimiento] ADD FOREIGN KEY ([id_embarcacion]) REFERENCES [Embarcacion] ([id_embarcacion])
GO

ALTER TABLE [Reparacion] ADD FOREIGN KEY ([id_embarcacion]) REFERENCES [Embarcacion] ([id_embarcacion])
GO

ALTER TABLE [Reparacion_Viaje] ADD FOREIGN KEY ([id_viaje]) REFERENCES [Viaje] ([id_viaje])
GO

ALTER TABLE [Reparacion_Viaje] ADD FOREIGN KEY ([id_reparacion]) REFERENCES [Reparacion] ([id_reparacion])
GO

ALTER TABLE [Reparacion_Viaje] ADD FOREIGN KEY ([id_despachador]) REFERENCES [Despachador] ([id_despachador])
GO
