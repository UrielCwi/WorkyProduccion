import 'dotenv/config'

const config = {
    user : process.env.BD_USER,
    password : process.env.BD_PASSWORD,
    database : process.env.BD_DATABASE,
}
// https://www.youtube.com/watch?v=HMKVnwlhJO0
export default config;