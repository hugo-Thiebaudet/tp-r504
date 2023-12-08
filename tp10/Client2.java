import java.io.*;
import org.apache.http.HttpEntity;
import org.apache.http.client.*;
import org.apache.http.client.methods.*;
import org.apache.http.impl.client.*;
import javax.json.*;

public class Client2 {
    public static void main(String[] args) {

        System.out.println(":)");

        CloseableHttpClient client = HttpClients.createDefault();
        String url = "http://" + args[0];

        HttpGet request = new HttpGet(url);

        System.out.println("Executing request " + request.getRequestLine());

        try {
            CloseableHttpResponse resp = client.execute(request);

            System.out.println("Response Line: " + resp.getStatusLine());
            System.out.println("Response Code: " + resp.getStatusLine().getStatusCode());

            // Lire le contenu brut de la réponse HTTP
            InputStreamReader isr = new InputStreamReader(resp.getEntity().getContent());

            // Utiliser JsonReader pour lire le contenu JSON directement
            JsonReader reader = Json.createReader(isr);
            JsonObject jsonObject = reader.readObject();
            reader.close();
            isr.close();

			System.out.println( "duree=" + jsonObject.getString("Runtime") );

        } catch (Exception ex) {
            System.out.println("Erreur !");
            ex.printStackTrace();
        }
    }
}

