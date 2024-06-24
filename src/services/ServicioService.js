import ServicioRepository from "../repositories/ServiciosRepository.js";
const servicioRepository = new ServicioRepository();
export default class ServicioService {
    async obtenerServicios() {
        try {
            return await servicioRepository.getAllServicios();
        } catch (error) {
            throw new Error('Error al obtener los servicios');
        }
    }

    async borrarServicio(id, id_creator_user) {
        try {
            await servicioRepository.BorrarServicio(id, id_creator_user);
        } catch (error) {
            throw new Error('Error al borrar el servicio');
        }
    }

    async editarServicio(servicio) {
        console.log(servicio)
        await servicioRepository.EditarServicio(servicio);
        // try {
        //     await servicioRepository.EditarServicio(id, servicio);
        // } catch (error) {
        //     throw new Error('Error al actualizar el servicio (Service)');
        // }
    }

    async crearServicio(servicio) {
        await servicioRepository.CrearServicio(servicio);
        // try {
        //     await servicioRepository.CrearServicio(servicio);
        // } catch (error) {
        //     throw new Error('Error al crear el servicio');
        // }
    }
}