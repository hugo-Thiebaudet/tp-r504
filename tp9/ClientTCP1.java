import java.io.*;
import java.net.*;

public class ClientTCP1 {
    public static void main(String[] args) { 
        try {
            Socket socket = new Socket("localhost", 2016);    
            DataOutputStream dOut = new DataOutputStream(socket.getOutputStream());      
            dOut.writeUTF("bip bip");
            
            socket.close();
        } catch (Exception ex) {
            System.out.println("Erreur !");
            ex.printStackTrace();
        }
    }
}

