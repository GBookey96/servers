import { OkPacket } from "mysql"
import dal from "../2-utils/dal"
import ServerModel from "../4-models/server-model"
import { ResourceNotFoundErrorModel } from "../4-models/error-model"

    async function getAllServers(): Promise<ServerModel[]> {
        const sql = `SELECT S.*, H.serverHostName 
        FROM allservers AS S JOIN serverhost AS H
        WHERE S.serverHostId = H.serverHostId`
        const servers = await dal.execute(sql)
        return servers
    }

    async function updateServerStatus(server: ServerModel): Promise<ServerModel> {
        const changeStatus = server.serverStatus === 0 ? 1 : 0
        const sql = `
        UPDATE allservers SET
        serverStatus = ?
        WHERE serverId = ?
        `
        const info: OkPacket = await dal.execute(sql, [changeStatus, server.serverId])
        if(info.affectedRows === 0) throw new ResourceNotFoundErrorModel(server.serverId)
        // console.log(server)        
        return server
    }

export default {
    getAllServers,
    updateServerStatus
}