BEGIN {
	TCPPacketsRec = 0;
	UDPPacketsRec = 0;
	TCPPacketsDrop = 0;
	UDPPacketsDrop = 0;
}

{
	event = $1;
	packetType = $5;
	if(event == "r") {
		if(packetType == "tcp") {
			TCPPacketsRec++;
		}
		else if(packetType == "cbr") {
			UDPPacketsRec++;
		}
	}
	else if(event == "d") {
		if(packetType == "tcp") {
			TCPPacketsDrop++;
		}
		else if(packetType == "cbr") {
			UDPPacketsDrop++;
		}
	}
}

END {
	printf("\nTCP:\tRecieved: %d\tDropped: %d",TCPPacketsRec,TCPPacketsDrop);
	printf("\nUDP:\tRecieved: %d\tDropped: %d",UDPPacketsRec,UDPPacketsDrop);
}
