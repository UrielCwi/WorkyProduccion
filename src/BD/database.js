import config from "./BD.js";
import sql from "mssql"

async function getConnection(){
    try {
        const pool = await sql.connect(config)
        return pool;
    } catch(error){
        console.log(error)
    }   
}