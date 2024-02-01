import java.io.*;
import org.apache.http.HttpEntity;
import org.apache.http.client.*;
import org.apache.http.client.methods.*;
import org.apache.http.impl.client.*;
import javax.json.*;

public class Client3 {
    public static void main(String[] args) {
        try (CloseableHttpClient client = HttpClients.createDefault()) {
            BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

            while (true) {
                System.out.print("Entrez le titre d'un film : ");
                String filmTitle = reader.readLine();

                if ("stop".equalsIgnoreCase(filmTitle)) {
                    System.out.println("Fin du programme");
                    break;
                }

                String apiUrl = "http://www.omdbapi.com/?apikey=751ea6aa&t=" + filmTitle;

                HttpGet request = new HttpGet(apiUrl);

                try (CloseableHttpResponse response = client.execute(request)) {
                    if (response.getStatusLine().getStatusCode() == 200) {
                        InputStreamReader isr = new InputStreamReader(response.getEntity().getContent());

                        JsonReader jsonReader = Json.createReader(isr);
                        JsonObject jsonObject = jsonReader.readObject();
                        jsonReader.close();
                        isr.close();

                        // Vérifier si le film a été trouvé
                        if (jsonObject.containsKey("Error")) {
                            System.out.println("Film non trouvé.");
                        } else {
                            // Afficher les informations essentielles
                            System.out.println("Date de sortie : " + jsonObject.getString("Released"));
                            System.out.println("Acteurs principaux : " + jsonObject.getString("Actors"));
                            System.out.println("Durée : " + jsonObject.getString("Runtime"));
                            System.out.println("Genre : " + jsonObject.getString("Genre"));

                            // Récupérer le tableau des critiques
                            JsonArray ratingsArray = jsonObject.getJsonArray("Ratings");

                            // Chercher le score de "Rotten Tomatoes"
                            String rottenTomatoesScore = null;
                            for (JsonValue rating : ratingsArray) {
                                JsonObject ratingObject = (JsonObject) rating;
                                if ("Rotten Tomatoes".equals(ratingObject.getString("Source"))) {
                                    rottenTomatoesScore = ratingObject.getString("Value");
                                    break;
                                }
                            }

							// Ajouter la mention en fonction du score
						if (rottenTomatoesScore != null) {
    					int score = Integer.parseInt(rottenTomatoesScore.replaceAll("[^\\d]", ""));
    					String mention = "";

    					if (score < 20) {
        					mention = "Nul";
    					}

    					if (score >= 20 && score < 50) {
       						 mention = "Bof";
    					}

    					if (score >= 50 && score < 70) {
        					mention = "Bien";
    					}

    					if (score >= 70) {
        					mention = "Très bien";
    					}

    						System.out.println("Score Rotten Tomatoes : " + rottenTomatoesScore);
    						System.out.println("Mention : " + mention);
						} else {
    							System.out.println("Score Rotten Tomatoes non trouvé.");
						}
                        }
                    } else {
                        System.out.println("Erreur HTTP : " + response.getStatusLine().getStatusCode());
                    }
                } catch (IOException ex) {
                    System.out.println("Erreur lors de l'exécution de la requête HTTP.");
                    ex.printStackTrace();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

