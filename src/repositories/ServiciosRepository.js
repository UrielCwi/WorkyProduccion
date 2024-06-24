import {getConnection} from '../BD/database.js'
import sql from "mssql";


export default class ServicioRepository{

async getAllServicios() {
    var query = `SELECT Servicios.Nombre, Descripcion, Foto, Precio, Categorias.Nombre AS CategoriaNombre, Usuarios.Nombre AS UsuarioNombre,
    (SELECT [id]
          ,[Dia]
          ,[HoraDesde]
          ,[HoraHasta]
          ,[idServicio]
      FROM [dbo].[Disponibilidad]
      WHERE Disponibilidad.idServicio = Servicios.id FOR JSON PATH) AS Disponibilidad
      FROM Servicios INNER JOIN Categorias ON Servicios.idCategoria = Categorias.id INNER JOIN Usuarios ON Servicios.idCreador = Usuarios.id`;
    const pool = await getConnection()
    const {recordset} = await pool.request().query(query);
    return recordset;
}
async BorrarServicio(id, id_creator_user){
    var query = `DELETE FROM Servicios WHERE id = ${id} AND idCreador = ${id_creator_user}`;
    try {
        const pool = await getConnection()
        await pool.request().query(query);
        console.log('Servicio borrado');
    } catch (error) {
        console.error('Error al borrar el servicio', error.stack);
        throw error;
    }
}
async EditarServicio(Servicio){
    //id, idCreador, idCategoria, Nombre, Descripcion, Foto, Precio
    var query = `UPDATE Servicios SET Nombre = ${Servicio.Nombre}, Descripcion = ${Servicio.Descripcion}, Foto = ${Servicio.Foto}, Precio = ${Servicio.Precio}`
    try {
        const db = await getConnection()
        await db.result().query(query);
        console.log('Servicio actualizado');
    } catch (error) {
        console.error('Error al actualizar el servicio', error.stack);
        throw error;
    }
}
async CrearServicio(servicio){
    const query = "INSERT INTO Servicios (idCreador, idCategoria, Nombre, Descripcion, Foto, Precio) VALUES (@idCreador, @idCategoria, @Nombre, @Descripcion, @Foto, @Precio)";
    const pool = await getConnection()
    const request = pool.request();
    request.input('idCreador', sql.Int, servicio.idCreador);
    request.input('idCategoria', sql.Int, servicio.idCategoria);
    request.input('Nombre', sql.VarChar, servicio.Nombre);
    request.input('Descripcion', sql.Text, servicio.Descripcion);
    request.input('Foto', sql.VarBinary, servicio.Foto);
    request.input('Precio', sql.Money, servicio.Precio);
    console.log(request)
    try {
        await request.query(query);
        console.log('Servicio agregado');
    } catch (error) {
        console.error('Error al inscribir al servicio', error.stack);
        throw error;
    }
}
}
