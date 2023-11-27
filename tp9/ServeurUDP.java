import java.io.*;
import java.net.*;

public class ServeurUDP {
    public static void main(String[] args) { // Ajout des arguments de la méthode main
        try {
            DatagramSocket sock = new DatagramSocket(1234);
            while (true) {
                System.out.println("-waiting data");
                DatagramPacket packet = new DatagramPacket(new byte[1024], 1024);
                sock.receive(packet);
                String str = new String(packet.getData() );
                System.out.println("str=" + str);
            }
        } catch (Exception ex) {
            System.out.println("erreur !");
            ex.printStackTrace();
        }
    }
}

