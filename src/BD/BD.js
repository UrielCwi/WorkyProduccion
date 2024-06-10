import 'dotenv/config'

const config = {
    user : process.env.BD_USER,
    password : process.env.BD_PASSWORD,
    server : process.env.BD_SERVER,
    database : process.env.BD_DATABASE,
    options : {
        encrypt: true,
        trustServerCertificate: true
    }
}
// https://www.youtube.com/watch?v=HMKVnwlhJO0
export default config;