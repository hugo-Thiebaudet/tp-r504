import java.io.*;
import org.apache.http.HttpEntity;
import org.apache.http.client.*;
import org.apache.http.client.methods.*;
import org.apache.http.impl.client.*;

public class Client {
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

			BufferedReader rd = new BufferedReader( new InputStreamReader( resp.getEntity().getContent()) );

			StringBuffer result = new StringBuffer();
			String line = "";
			while ((line = rd.readLine()) !=null)
			{
				result.append(line);
				result.append("\n"); //saut de ligne
			}

			String page = result.toString();
			System.out.println( page );
			
        } catch (IOException ex) {
            System.out.println("Erreur !");
            ex.printStackTrace();
        }
    }
}

