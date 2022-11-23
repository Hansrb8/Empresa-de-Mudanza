
/*==============================================================*/
/* Table: ARTICULO_MUDANZA                                      */
/*==============================================================*/
create table ARTICULO_MUDANZA (
   ARTMUD_ID            SERIAL               not null,
   MUDANZA_ID           INT4                 not null,
   ARTMUD_DESCRIPCION   VARCHAR(256)         not null,
   ARTMUD_MARCA         VARCHAR(256)         not null,
   ARTMUD_PESO          FLOAT8               not null,
   ARTMUD_CANTIDAD      INT4                 not null,
   ARTMUD_AVALUO        FLOAT8               not null,
   constraint PK_ARTICULO_MUDANZA primary key (ARTMUD_ID)
);

/*==============================================================*/
/* Table: CIUDAD                                                */
/*==============================================================*/
create table CIUDAD (
   CIUDAD_ID            SERIAL               not null,
   CIUDAD_NOMBRE        VARCHAR(256)         not null,
   CIUDAD_PROVINCIA     VARCHAR(256)         not null,
   constraint PK_CIUDAD primary key (CIUDAD_ID)
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   CLIENTE_CEDULA       VARCHAR(10)          not null,
   CLIENTE_NOMBRES      VARCHAR(256)         not null,
   CLIENTE_APELLIDOS    VARCHAR(256)         not null,
   CLIENTE_DIRECCION    VARCHAR(256)         not null,
   CLIENTE_TELEFONO     VARCHAR(10)          not null,
   CLIENTE_NUMERO_MUDANZAS INT4                 not null,
   constraint PK_CLIENTE primary key (CLIENTE_CEDULA)
);

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO (
   EMPLEADO_CEDULA      VARCHAR(10)          not null,
   SUCURSAL_ID          INT4                 not null,
   TIPO_EMPLEADO_ID     INT4                 not null,
   EMPLEADO_NOMBRES     VARCHAR(256)         not null,
   EMPLEADO_APELLIDOS   VARCHAR(256)         not null,
   EMPLEADO_FECHA_NACIMIENTO DATE                 not null,
   EMPLEADO_FECHA_INGRESO DATE                 not null,
   EMPLEADO_TELEFONO    VARCHAR(10)          not null,
   EMPLEADO_DIRECCION   VARCHAR(256)         not null,
   constraint PK_EMPLEADO primary key (EMPLEADO_CEDULA)
);

/*==============================================================*/
/* Table: EMPLEADO_ASIGNADO                                     */
/*==============================================================*/
create table EMPLEADO_ASIGNADO (
   EMPLEADO_ASIGNADO_ID SERIAL               not null,
   MUDANZA_ID           INT4                 not null,
   VEHICULO_MUDANZA_ID  INT4                 not null,
   EMPLEADO_CEDULA      VARCHAR(10)          not null,
   constraint PK_EMPLEADO_ASIGNADO primary key (EMPLEADO_ASIGNADO_ID)
);

/*==============================================================*/
/* Table: EMPRESA                                               */
/*==============================================================*/
create table EMPRESA (
   EMPRESA_ID           SERIAL               not null,
   EMPRESA_NOMBRE       VARCHAR(256)         not null,
   EMPRESA_RUC          VARCHAR(256)         not null,
   constraint PK_EMPRESA primary key (EMPRESA_ID)
);

/*==============================================================*/
/* Table: INCIDENCIA                                            */
/*==============================================================*/
create table INCIDENCIA (
   INCIDENCIA_ID        SERIAL               not null,
   INCIDENCIA_DESCRIPCION VARCHAR(256)         not null,
   constraint PK_INCIDENCIA primary key (INCIDENCIA_ID)
);

/*==============================================================*/
/* Table: MUDANZA                                               */
/*==============================================================*/
create table MUDANZA (
   MUDANZA_ID           SERIAL               not null,
   SOLICITUD_ID         INT4                 not null,
   SUCURSAL_ID          INT4                 null,
   MUDANZA_DESCUENTO    FLOAT8               not null,
   MUDANZA_COSTO        FLOAT8               not null,
   MUDANZA_FECHA_INICIO DATE                 not null,
   MUDANZA_FECHA_FIN    DATE                 not null,
   constraint PK_MUDANZA primary key (MUDANZA_ID)
);

/*==============================================================*/
/* Table: MUDANZA_INCIDENCIA                                    */
/*==============================================================*/
create table MUDANZA_INCIDENCIA (
   MUDANZA_INCIDENCIA   SERIAL               not null,
   MUDANZA_ID           INT4                 null,
   INCIDENCIA_ID        INT4                 null,
   constraint PK_MUDANZA_INCIDENCIA primary key (MUDANZA_INCIDENCIA)
);

/*==============================================================*/
/* Table: SOLICITUD                                             */
/*==============================================================*/
create table SOLICITUD (
   SOLICITUD_ID         SERIAL               not null,
   CIUDAD_ID_ORIGEN     INT4                 null,
   CIUDAD_ID_DESTINO    INT4                 null,
   CLIENTE_CEDULA       VARCHAR(10)          not null,
   MUDANZA_ID           INT4                 null,
   SOLICITUD_ORIGEN     VARCHAR(256)         not null,
   SOLICITUD_DESTINO    VARCHAR(256)         not null,
   ATTRIBUTE_40         DATE                 not null,
   constraint PK_SOLICITUD primary key (SOLICITUD_ID)
);

/*==============================================================*/
/* Table: SUCURSAL                                              */
/*==============================================================*/
create table SUCURSAL (
   SUCURSAL_ID          SERIAL               not null,
   EMPRESA_ID           INT4                 not null,
   CIUDAD_ID            INT4                 not null,
   SUCURSAL_TELEFONO    VARCHAR(10)          not null,
   SUCURSAL_TIPO        VARCHAR(256)         not null,
   SUCURSAL_DIRECCION   VARCHAR(256)         not null,
   constraint PK_SUCURSAL primary key (SUCURSAL_ID)
);

/*==============================================================*/
/* Table: TIPO_EMPLEADO                                         */
/*==============================================================*/
create table TIPO_EMPLEADO (
   TIPO_EMPLEADO_ID     SERIAL               not null,
   TIPO_EMPLEADO_DESCRIPCION VARCHAR(256)         not null,
   constraint PK_TIPO_EMPLEADO primary key (TIPO_EMPLEADO_ID)
);

/*==============================================================*/
/* Table: VEHICULO                                              */
/*==============================================================*/
create table VEHICULO (
   VEHICULO_ID          SERIAL               not null,
   VEHICULO_PLACA       VARCHAR(256)         not null,
   VEHICULO_MARCA       VARCHAR(256)         not null,
   constraint PK_VEHICULO primary key (VEHICULO_ID)
);

/*==============================================================*/
/* Table: VEHICULO_MANTENIMIENTO                                */
/*==============================================================*/
create table VEHICULO_MANTENIMIENTO (
   MANTENIMIENTO_ID     SERIAL               not null,
   VEHICULO_ID          INT4                 not null,
   MANTENIMIENTO_FECHA  DATE                 not null,
   constraint PK_VEHICULO_MANTENIMIENTO primary key (MANTENIMIENTO_ID)
);

/*==============================================================*/
/* Table: VEHICULO_MUDANZA                                      */
/*==============================================================*/
create table VEHICULO_MUDANZA (
   VEHICULO_MUDANZA_ID  SERIAL               not null,
   MUDANZA_ID           INT4                 not null,
   VEHICULO_ID          INT4                 not null,
   constraint PK_VEHICULO_MUDANZA primary key (VEHICULO_MUDANZA_ID)
);

alter table ARTICULO_MUDANZA
   add constraint FK_ARTICULO_ARTICULO__MUDANZA foreign key (MUDANZA_ID)
      references MUDANZA (MUDANZA_ID)
      on delete restrict on update restrict;

alter table EMPLEADO
   add constraint FK_EMPLEADO_EMPLEADO__TIPO_EMP foreign key (TIPO_EMPLEADO_ID)
      references TIPO_EMPLEADO (TIPO_EMPLEADO_ID)
      on delete restrict on update restrict;

alter table EMPLEADO
   add constraint FK_EMPLEADO_SUCURSAL__SUCURSAL foreign key (SUCURSAL_ID)
      references SUCURSAL (SUCURSAL_ID)
      on delete restrict on update restrict;

alter table EMPLEADO_ASIGNADO
   add constraint FK_EMPLEADO_EMPLEADOA_VEHICULO foreign key (VEHICULO_MUDANZA_ID)
      references VEHICULO_MUDANZA (VEHICULO_MUDANZA_ID)
      on delete restrict on update restrict;

alter table EMPLEADO_ASIGNADO
   add constraint FK_EMPLEADO_EMPLEADO__EMPLEADO foreign key (EMPLEADO_CEDULA)
      references EMPLEADO (EMPLEADO_CEDULA)
      on delete restrict on update restrict;

alter table EMPLEADO_ASIGNADO
   add constraint FK_EMPLEADO_RELATIONS_MUDANZA foreign key (MUDANZA_ID)
      references MUDANZA (MUDANZA_ID)
      on delete restrict on update restrict;

alter table MUDANZA
   add constraint FK_MUDANZA_SOLICITUD_SOLICITU foreign key (SOLICITUD_ID)
      references SOLICITUD (SOLICITUD_ID)
      on delete restrict on update restrict;

alter table MUDANZA
   add constraint FK_MUDANZA_SUCURSAL__SUCURSAL foreign key (SUCURSAL_ID)
      references SUCURSAL (SUCURSAL_ID)
      on delete restrict on update restrict;

alter table MUDANZA_INCIDENCIA
   add constraint FK_MUDANZA__MUDANZA_I_MUDANZA foreign key (MUDANZA_ID)
      references MUDANZA (MUDANZA_ID)
      on delete restrict on update restrict;

alter table MUDANZA_INCIDENCIA
   add constraint FK_MUDANZA__MUDANZA_I_INCIDENC foreign key (INCIDENCIA_ID)
      references INCIDENCIA (INCIDENCIA_ID)
      on delete restrict on update restrict;

alter table SOLICITUD
   add constraint FK_SOLICITU_CIUDAD_DEST foreign key (CIUDAD_ID_ORIGEN)
      references CIUDAD (CIUDAD_ID)
      on delete restrict on update restrict;

alter table SOLICITUD
   add constraint FK_SOLICITU_CIUDAD_ORIGEN foreign key (CIUDAD_ID_DESTINO)
      references CIUDAD (CIUDAD_ID)
      on delete restrict on update restrict;

alter table SOLICITUD
   add constraint FK_SOLICITU_CLIENTE_S_CLIENTE foreign key (CLIENTE_CEDULA)
      references CLIENTE (CLIENTE_CEDULA)
      on delete restrict on update restrict;

alter table SOLICITUD
   add constraint FK_SOLICITU_SOLICITUD_MUDANZA foreign key (MUDANZA_ID)
      references MUDANZA (MUDANZA_ID)
      on delete restrict on update restrict;

alter table SUCURSAL
   add constraint FK_SUCURSAL_CIUDAD_ES_CIUDAD foreign key (CIUDAD_ID)
      references CIUDAD (CIUDAD_ID)
      on delete restrict on update restrict;

alter table SUCURSAL
   add constraint FK_SUCURSAL_EMPRESA_S_EMPRESA foreign key (EMPRESA_ID)
      references EMPRESA (EMPRESA_ID)
      on delete restrict on update restrict;

alter table VEHICULO_MANTENIMIENTO
   add constraint FK_VEHICULO_VEHICULO__VEHICULO foreign key (VEHICULO_ID)
      references VEHICULO (VEHICULO_ID)
      on delete restrict on update restrict;

alter table VEHICULO_MUDANZA
   add constraint FK_VEHICULO_VEHICULO__MUDANZA foreign key (MUDANZA_ID)
      references MUDANZA (MUDANZA_ID)
      on delete restrict on update restrict;

alter table VEHICULO_MUDANZA
   add constraint FK_VEHICULO_VEHICULO__VEHICULO foreign key (VEHICULO_ID)
      references VEHICULO (VEHICULO_ID)
      on delete restrict on update restrict;

