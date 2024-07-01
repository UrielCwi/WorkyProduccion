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
async EditarServicio(servicio){
    var query = `UPDATE Servicios SET `
    if (servicio.Nombre != null){
        query += `Nombre = @Nombre, `
    }
    if (servicio.Descripcion != null){
        query += `Descripcion = @Descripcion, `
    }
    if (servicio.Foto != null){
        query += `Foto = @Foto, `
    }
    if (servicio.Precio != null){
        query += `Precio = @Precio`
    }
    if (query.endsWith(', '))
    query = query.slice(0, -1)
    query += ` WHERE id = @Id`
    const pool = await getConnection()
    const request = pool.request();
    request.input('Id', sql.Int, servicio.id)
    request.input('Nombre', sql.VarChar, servicio.Nombre);
    request.input('Descripcion', sql.Text, servicio.Descripcion);
    request.input('Foto', sql.VarBinary, servicio.Foto);
    request.input('Precio', sql.Money, servicio.Precio);
    console.log(query)
    try {
        await request.query(query);
        console.log('Servicio actualizado');
    } catch (error) {
        console.error('Error al actualizar el servicio (Repository', error.stack);
        throw error;
    }
}
async CrearServicio(servicio, disponibilidades){
    const pool = await getConnection();
    const transaction = new sql.Transaction(pool);

    try {
        await transaction.begin();
        const serviceResult = await transaction.request()
            .input('idCreador', sql.Int, servicio.idCreador)
            .input('idCategoria', sql.Int, servicio.idCategoria)
            .input('Nombre', sql.VarChar(50), servicio.Nombre)
            .input('Descripcion', sql.Text, servicio.Descripcion)
            .input('Foto', sql.Image, servicio.Foto)
            .input('Precio', sql.Money, servicio.Precio)
            .query(`
                INSERT INTO Servicios (idCreador, idCategoria, Nombre, Descripcion, Foto, Precio)
                VALUES (@idCreador, @idCategoria, @Nombre, @Descripcion, @Foto, @Precio);
                SELECT SCOPE_IDENTITY() AS idServicio;
            `);

        const idServicio = serviceResult.recordset[0].idServicio;
        for (var disponibilidad of disponibilidades) {
            await transaction.request()
                .input('Dia', sql.SmallInt, disponibilidad.Dia)
                .input('idServicio', sql.Int, idServicio)
                .query(`
                    INSERT INTO Disponibilidad (Dia, HoraDesde, HoraHasta, idServicio)
                    VALUES (@Dia, '${disponibilidad.HoraDesde}', '${disponibilidad.HoraHasta}', @idServicio);
                `);
        }
        await transaction.commit();
        console.log('Servicio y disponibilidades insertados correctamente.');
    } catch (err) {
        await transaction.rollback();
        console.error('Error al insertar servicio y disponibilidades:', err);
    } finally {
        pool.close();
    }
}
}
