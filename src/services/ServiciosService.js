import eventRepository from "../repositories/ServiciosRepository";
import pg from "pg";
import { BDConfig } from "../BD/BD"
import Servicio from "../entities/Servicio";

export const getAllServicios = async (limit, offset) => {
    try {
        const servicios = await eventRepository.getAllServicios(limit, offset);
        return servicios;
    } catch (error) {
        console.error('Error al obtener los servicios:', error.stack);
        throw error;
    }
};

export const BorrarServicio = async (id, id_creator_user) => {
    try {
        await eventRepository.BorrarServicio(id, id_creator_user);
        console.log('Servicio borrado');
    } catch (error) {
        console.error('Error al borrar el servicio:', error.stack);
        throw error;
    }
};

export const EditarServicio = async (servicio) => {
    try {
        await eventRepository.EditarServicio(servicio);
        console.log('Servicio actualizado');
    } catch (error) {
        console.error('Error al actualizar el servicio:', error.stack);
        throw error;
    }
};

export const CrearServicio = async (servicio) => {
    try {
        await eventRepository.CrearServicio(servicio);
        console.log('Servicio creado');
    } catch (error) {
        console.error('Error al crear el servicio:', error.stack);
        throw error;
    }
};