import express, {Request, Response, NextFunction} from "express"
import logic from "../5-logic/logic"
import ServerModel from "../4-models/server-model"

const router = express.Router()

router.get("/servers", async(request: Request, response: Response, next: NextFunction)=> {
    try {
        const servers = await logic.getAllServers()
        response.json(servers)
    }
    catch(err:any) {
        next(err)
    }
})

router.put("/servers/:id", async(request: Request, response: Response, next: NextFunction)=> {
    try {
        // request.body.serverId = +request.params.id;
        const allServers = await logic.getAllServers()
        const server = new ServerModel(allServers.find(s => s.serverId === +request.params.id))
        const updatedServer = await logic.updateServerStatus(server)
        response.json(updatedServer)
    }
    catch(err:any) {
        next(err)
    }
})

export default router