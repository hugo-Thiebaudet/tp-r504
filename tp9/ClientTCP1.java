import java.io.*;
import java.net.*;

public class ClientTCP1
{
	public static void main()
	{
		Socket socket = new Socket( "localhost", 2016 );
		DataOutputStream dOut = new DataoutputStream( socket.getOutputStream() );
		dOut.writeUTF( "message test" );
		socket.close();
	}
}
