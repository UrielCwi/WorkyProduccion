import 'dotenv/config'

export const config = {
    server: process.env.BD_SERVER, // Nombre del servidor SQL Server
    database: process.env.BD_DATABASE, // Nombre de la base de datos
    options: {
        encrypt: false, // Cambia a true si usas Azure
        trustServerCertificate: true // Utiliza true para conexiones locales
    },
    authentication: {
        type: 'ntlm', // Tipo de autenticación para Windows
        options: {
            domain: 'ALMAGRO', // Dominio de Windows
            trustedConnection: true       
         }
    }
};
// https://www.youtube.com/watch?v=HMKVnwlhJO0
