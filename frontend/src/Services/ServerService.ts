import axios from "axios";
import ServerModel from "../Models/server-model";
import appConfig from "../Utils/config";

class ServerService {
    public async getAllServers(): Promise<ServerModel[]> {
        const response = await axios.get(appConfig.serverUrl)
        const servers = response.data
        return servers
    }
    public async updateServerStatus(id: number): Promise<ServerModel> {
        const response = await axios.put(appConfig.serverUrl + id)
        const updatedServer = response.data
        return updatedServer
    }

    public async onlyShowOnlineServers(servers: ServerModel[]): Promise<ServerModel[]> {
        const filteredServers = servers.filter(s => s.serverStatus === 1)
        return filteredServers
    }

    public async checkServerStatus(id: number): Promise<number> {
        const allServers = await this.getAllServers()
        const thisServer = allServers.find(s => s.serverId === id)
        return thisServer.serverStatus
    }

    public async sortServers(): Promise<ServerModel> {
        const allServers = await this.getAllServers()
        return
    }
}

const serverService = new ServerService()
export default serverService