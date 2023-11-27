import java.io.*;
import java.net.*;

public class ClientTCP1 {
    public static void main(String[] args) { // Ajout des arguments de la méthode main
        try {
            Socket socket = new Socket("localhost", 2016);
            
            // Correction de la casse de la classe DataOutputStream
            DataOutputStream dOut = new DataOutputStream(socket.getOutputStream());
            
            dOut.writeUTF("message test");
            
            socket.close();
        } catch (Exception ex) {
            System.out.println("Erreur !");
            ex.printStackTrace();
        }
    }
}

