import 'dotenv/config'

const config = {
    user : process.env.BD_USER,
    password : process.env.BD_PASSWORD,
    database : process.env.BD_DATABASE,
}

export default config;