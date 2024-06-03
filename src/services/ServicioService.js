import ServicioRepository from "../repositories/ServiciosRepository.js";

export default class ServicioService {
    async obtenerServicios(limit, offset) {
        try {
            return await ServicioRepository.getAllServicios(limit, offset);
        } catch (error) {
            throw new Error('Error al obtener los servicios');
        }
    }

    async borrarServicio(id, id_creator_user) {
        try {
            await ServicioRepository.BorrarServicio(id, id_creator_user);
        } catch (error) {
            throw new Error('Error al borrar el servicio');
        }
    }

    async editarServicio(servicio) {
        try {
            await ServicioRepository.EditarServicio(servicio);
        } catch (error) {
            throw new Error('Error al actualizar el servicio');
        }
    }

    async crearServicio(servicio) {
        try {
            await ServicioRepository.CrearServicio(servicio);
        } catch (error) {
            throw new Error('Error al crear el servicio');
        }
    }
}