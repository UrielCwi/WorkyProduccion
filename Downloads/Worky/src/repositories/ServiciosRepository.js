import pg from "pg";
import { BDConfig } from "../BD/BD"
import Servicio from "../entities/Servicio";


export default class EventRepository{
constructor(){
    const { Client } = pg;
    this.DBClient = new Client(BDConfig)
    this.DBClient.connect()
}
async getAllServicios(limit, offset) {
    var query = `SELECT Nombre, Descripcion, Foto, Precio, Nombre.Categorias, Nombre.Usuarios FROM Servicios INNER JOIN Categorias ON Servicios.idCategoria = Categorias.id INNER JOIN Usuarios ON Servicios.idCreador = Usuarios.id limit ${limit} offset ${offset}`;
    const values = await client.query(query);
    return values;
}
async BorrarServicio(id, id_creator_user){
    var query = `DELETE FROM Servicios WHERE id = ${id} AND idCreador = ${id_creator_user}`;
    const values = await client.query(query);
    return values;
}
async EditarServicio(Servicio){
    var query = 'UPDATE Servicios SET '
}
}