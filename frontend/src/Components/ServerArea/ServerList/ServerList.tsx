import { useEffect, useState } from "react";
import "./ServerList.css";
import serverService from "../../../Services/ServerService";
import ServerModel from "../../../Models/server-model";
import ServerCard from "../ServerCard/ServerCard";

function ServerList(): JSX.Element {
    const [allServers, setAllServers] = useState<ServerModel[]>([])
    // const [filteredServers, setFilteredServers] = useState<ServerModel[]>([])
    const [sortedServers, setSortedServers] = useState<ServerModel[]>([])
    const [showServers, setShowServers] = useState<ServerModel[]>([])

    useEffect(()=>{
        serverService.getAllServers()
        .then(s => setDateAsDate(s))
        .catch(err => alert(err.message))
    },[])

    useEffect(()=>{
        const sortedServers = allServers.sort((a,b) => a.serverCreatedOn.localeCompare(b.serverCreatedOn)).reverse()
        setSortedServers(sortedServers)
    },[])

    function setDateAsDate(servers: ServerModel[]) {
        for(const server of servers) {
            server.serverCreatedOn = new Date(server.serverCreatedOn).toISOString().substring(0,10);
        }
        setAllServers(servers)
        setShowServers(servers)
    }

    function sortServers() {
        setShowServers(sortedServers)
    }

    function showFilteredServers() {
        if(document.getElementsByTagName("input")[0].checked === true) {
            const filteredServers = allServers.filter(s => s.serverStatus === 1)
            // setFilteredServers(filteredServers)
            setShowServers(filteredServers)
        }
        if(document.getElementsByTagName("input")[0].checked === false) {
            setShowServers(allServers)
        }
    }  

    return (
        <div className="ServerList">
			<h2>Servers we Service</h2>
            <div className="Box">
                <b>filters</b>
                <br />
                <button onClick={sortServers}>Show newest servers first</button>
                <br />
                <input type="checkbox" id="filterServers" onClick={showFilteredServers}/><label htmlFor="filterServers">Only show servers that are online</label>
            </div>
            <hr />
            {showServers.map(s => <ServerCard key={s.serverId} server={s}/>)}
        </div>
    );
}

export default ServerList;
