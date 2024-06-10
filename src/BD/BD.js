import 'dotenv/config'

export const config = {
    server : process.env.BD_SERVER,
    database : process.env.BD_DATABASE,
    options : {
        encrypt: true,
        trustServerCertificate: true,
        trustedConnection: true
    }
}
// https://www.youtube.com/watch?v=HMKVnwlhJO0
