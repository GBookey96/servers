class ServerModel {
    public serverId: number
    public serverName: string
    public serverIp: string
    public serverHostId: number
    public serverStatus: number
    public serverCreatedOn: string
    public serverHostName: string

    public constructor(server: ServerModel) {
        this.serverId = server.serverId
        this.serverName = server.serverName
        this.serverIp = server.serverIp
        this.serverHostId = server.serverHostId
        this.serverStatus = server.serverStatus
        this.serverCreatedOn = server.serverCreatedOn
        this.serverHostName = server.serverHostName
    }
}

export default ServerModel