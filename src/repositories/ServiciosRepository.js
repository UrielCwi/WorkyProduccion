import {getConnection} from '../BD/database.js'

export default class ServicioRepository{

async getAllServicios() {
    var query = `SELECT Servicios.Nombre, Descripcion, Foto, Precio, Categorias.Nombre AS CategoriaNombre, Usuarios.Nombre AS UsuarioNombre
    FROM Servicios INNER JOIN Categorias ON Servicios.idCategoria = Categorias.id INNER JOIN Usuarios ON Servicios.idCreador = Usuarios.id`;
    const pool = await getConnection()
    const values = await pool.request().query(query);
    return values;
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
async CrearServicio(Servicio){
    var query = `INSERT INTO Servicios (idCreador, idCategoria, Nombre, Descripcion, Foto, Precio) VALUES ($1, $2, $3, $4, $5, $6)`
    const values = [
        Servicio.idCreador,
        Servicio.idCategoria,
        Servicio.Nombre,
        Servicio.Descripcion,
        Servicio.Foto,
        Servicio.Precio
    ];
    try {
        const db = await getConnection()
        await db.result().query(query, values);
        console.log('Servicio agregado');
    } catch (error) {
        console.error('Error al inscribir al servicio', error.stack);
        throw error;
    }
}
}
