<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Lettura dati ThingSpeak</title>
</head>
<body>
    <div class="card"><h1>Dati da ThingSpeak</h1>
        <?php
            // === Parametri ===
            $channelID = "2964228"; // ID del canale
            $readAPIKey = ""; // Lascia "" se il canale è pubblico
            $results = 1; // Quanti risultati vuoi

            // === Costruisci URL API ===
            $url = "https://api.thingspeak.com/channels/2964228/feeds.json?results=1";
            if (!empty($readAPIKey)) {
                $url .= "&api_key=$readAPIKey";
            }

            // === Richiesta GET ===
            $response = file_get_contents($url);
            if ($response === FALSE) {
                echo "<p>Errore nella richiesta a ThingSpeak.</p>";
                exit;
            }

            // === Decodifica JSON ===
            $data = json_decode($response, true);

            // === Visualizza dati ===
            if (!empty($data["feeds"])) {
                echo "<div class='table-container'>";
                echo "<table class='responsive-table' border='1' cellpadding='5'>";
                echo "<tr><th>Timestamp</th><th>T(°C)Sensore1</th><th>T(°C)Sensore2</th></tr>";
    
                foreach ($data["feeds"] as $feed) {
                    echo "<tr>";
                    echo "<td>" . htmlspecialchars($feed["created_at"]) . "</td>";
                    echo "<td>" . htmlspecialchars($feed["field2"]) . "</td>";
                    echo "<td>" . htmlspecialchars($feed["field4"]) . "</td>";
                    echo "</tr>";
             }
            echo "</div>";
            echo "</table>";
            } else {
                echo "<p>Nessun dato disponibile.</p>";
            }
        ?>
    </div>
    <script>
// Funzione per aggiornare la tabella via AJAX, DA PROVAREEEE!!!!!!
function aggiornaTabella() {
    fetch("?ajax=1")
        .then(response => response.text())
        .then(html => {
            document.getElementById("tabella-dati").innerHTML = html;
        })
        .catch(err => {
            console.error("Errore nel caricamento dati:", err);
        });
}

// Caricamento iniziale + refresh ogni 15 secondi
setInterval(aggiornaTabella, 5000);
</script>
</body>
</html>
