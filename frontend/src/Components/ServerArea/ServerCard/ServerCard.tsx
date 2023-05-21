import { Switch } from "@mui/material";
import ServerModel from "../../../Models/server-model";
import "./ServerCard.css";
import { useEffect, useState } from "react";
import serverService from "../../../Services/ServerService";

interface ServerCardProps {
    server: ServerModel
}

function ServerCard(props: ServerCardProps): JSX.Element {
    const [thisServerStatus, setThisServerStatus] = useState<boolean>()
    
    useEffect(()=>{
        serverService.checkServerStatus(props.server.serverId)
            .then(s => setThisServerStatus(+s === 1 ? true : false))
            .catch(err => alert(err.message))
    },[])
    
    async function updateServer(id: number) {
        try {
            await serverService.updateServerStatus(id)
        }
        catch(err) {
            alert(err)
        }
    }

    return (
        <div className="ServerCard">
			<div className="Container">
                <h2>{props.server.serverName}</h2>
                <br />
                <span>Hosted by {props.server.serverHostName}</span>
                <br />
                <span>Created on {props.server.serverCreatedOn.substring(0,10)}</span>
                <br />
                <span>Offline</span>
                <span>
                {thisServerStatus &&
                <>
                <Switch defaultChecked onClick={()=>{updateServer(props.server.serverId)}}/>
                </>}
                {!thisServerStatus && 
                <>
                <Switch onClick={()=>{updateServer(props.server.serverId)}}/>
                </>}
                </span>
                
                <span>Online</span>
            </div>
        </div>
    );
}

export default ServerCard;
