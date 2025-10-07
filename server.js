import { WebSocketServer } from "ws";   

const PORT = process.env.PORT || 8080;
const wss = new WebSocketServer({port: PORT});

console.log(`Game Running on port ${PORT}`);

wss.on("connection", (ws) => {
    console.log("Player Connected")

    ws.on("message", (msg) => {
        console.log("Received:", msg.toString());
        //Broadcast to all other players
        wss.clients.forEach(client => {
            if (client !== ws && client.readyState === ws.OPEN) {
                client.send(msg.toString());
            }
        });
    });

    ws.on("close", () => {
        console.log("Player disconnected");
    });
});

// This creates a simple broadcast server where all clients share messages.