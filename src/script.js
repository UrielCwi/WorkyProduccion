import express from "express";
import ServiciosController from "./controllers/ServiciosController.js"

const app = express();
app.use(express.json());
const port = 3000;

app.use("/Servicio", ServiciosController);

app.listen(port, ()  => 
{console.log("Loaded")}
)