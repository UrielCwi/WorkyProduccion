import { getAllServicios, BorrarServicio, EditarServicio, CrearServicio } from "../services/EventService";
import Servicio from "../entities/Servicio";

export const obtenerServicios = async (req, res) => {
    try {
        const { limit, offset } = req.query;
        const servicios = await getAllServicios(limit, offset);
        res.status(200).json(servicios);
    } catch (error) {
        res.status(500).json({ error: 'Error al obtener los servicios' });
    }
};

export const borrarServicio = async (req, res) => {
    try {
        const { id, id_creator_user } = req.params;
        await BorrarServicio(id, id_creator_user);
        res.status(200).json({ message: 'Servicio borrado exitosamente' });
    } catch (error) {
        res.status(500).json({ error: 'Error al borrar el servicio' });
    }
};

export const editarServicio = async (req, res) => {
    try {
        const { id } = req.params;
        const { Nombre, Descripcion, Foto, Precio } = req.body;
        const servicio = new Servicio(id, Nombre, Descripcion, Foto, Precio);
        await EditarServicio(servicio);
        res.status(200).json({ message: 'Servicio actualizado exitosamente' });
    } catch (error) {
        res.status(500).json({ error: 'Error al actualizar el servicio' });
    }
};

export const crearServicio = async (req, res) => {
    try {
        const { idCreador, idCategoria, Nombre, Descripcion, Foto, Precio } = req.body;
        const servicio = new Servicio(null, idCreador, idCategoria, Nombre, Descripcion, Foto, Precio);
        await CrearServicio(servicio);
        res.status(201).json({ message: 'Servicio creado exitosamente' });
    } catch (error) {
        res.status(500).json({ error: 'Error al crear el servicio' });
    }
};