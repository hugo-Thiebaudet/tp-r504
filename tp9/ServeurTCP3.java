import java.io.*;
import java.net.*;

public class ServeurTCP2
{
	public static void main(String[] args)
	{
		try {
				ServerSocket socketserver = new ServerSocket( 2016 );
				System.out.println( "serveur en attente" );
			while (true) {
				Socket socket = socketserver.accept();
				System.out.println( "Connection d'un client" );
				DataInputStream dIn = new DataInputStream( socket.getInputStream() );
				System.out.println( "Message: " + dIn.readUTF());
				socket.close();
				socketserver.close();
						}
			}
			catch(Exception ex ) {
				System.out.println( "erreur !");
				ex.printStackTrace();
			}
	}
}
