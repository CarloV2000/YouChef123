<main class="main">
    <?php
    error_reporting(0);
    ini_set('display_errors', 0);
    ?>

    <?php
    include 'db.php';

    $recipes = [];
    $passaggi = [];
    $currentStep = 0;

    // Gestione selezione categoria
    if (isset($_POST['category'])) {
        $categoria = $_POST['category'];
        $query = "SELECT * FROM recipes WHERE categoria = ?";
        $stmt = $pdo->prepare($query);
        $stmt->execute([$categoria]);
        $recipes = $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    // Gestione selezione ricetta
if (isset($_POST['nome'])) {
    // Recupera l'ID della ricetta
    $queryRicetta = "SELECT id FROM recipes WHERE nome = ?";
    $stmtRicetta = $pdo->prepare($queryRicetta);
    $stmtRicetta->execute([$_POST['nome']]);
    $ricetta = $stmtRicetta->fetch(PDO::FETCH_ASSOC);

    if ($ricetta) {
        $ricetta_id = $ricetta['id'];

        // Recupera i passaggi della ricetta ordinati
        $queryPassaggi = "SELECT * FROM steps WHERE ricetta_id = ? ORDER BY ordine ASC";
        $stmtPassaggi = $pdo->prepare($queryPassaggi);
        $stmtPassaggi->execute([$ricetta_id]);
        $passaggi = $stmtPassaggi->fetchAll(PDO::FETCH_ASSOC);

        $currentStep = $_POST['step'] ?? 0;
    }
}
    ?>

    <h2>Selezionare la categoria di ricetta</h2>

    <!-- MOSTRA I BOTTONI SOLO SE NON CI SONO PASSAGGI DA MOSTRARE -->
    <?php if (empty($passaggi)): ?>
    <form method="post">
        <div class="buttons">
            <button name="category" value="primo">Primo</button>
            <button name="category" value="secondo">Secondo</button>
      
            <button name="category" value="dolce">Dolce</button>
        </div>
    </form>
    <?php endif; ?>

    <?php if (!empty($recipes) && empty($passaggi)): ?>
        <h3>Ricette:  <?php echo ucfirst(htmlspecialchars($categoria)); ?>.</h3>
        <ul>
            <?php foreach ($recipes as $recipe): ?>
                <li>
                    <form method="post">
                        <input type="hidden" name="nome" value="<?php echo htmlspecialchars($recipe['nome']); ?>">
                        <button type="submit">
                            <?php echo htmlspecialchars($recipe['nome']) . " (" . htmlspecialchars($recipe['tempoStimato']) . " minuti)"; ?>
                        </button>
                    </form>
                </li>
            <?php endforeach; ?>
        </ul>
    <?php elseif (!empty($passaggi)): ?>
        <?php
        //Gestione della lettura dei passaggi dalla stringa avente per separatori
       if ($currentStep < count($passaggi)) {
            $stepData = $passaggi[$currentStep];
            $descrizione = $stepData['passaggio'];
            $timer = $stepData['tempo'];
            $tempMin = $stepData['temperaturamin'];
            $tempMax = $stepData['temperaturamax'];
        ?>
        <h3>Passaggio <?php echo $currentStep + 1; ?> di <?php echo count($passaggi); ?></h3>
        <p><?php echo htmlspecialchars($descrizione); ?></p>
        <p>Timer: <?php echo $timer; ?> secondi</p>
        <p>Temperatura: <?php echo $tempMin; ?> - <?php echo $tempMax; ?> °C</p>

        <form method="post">
            <input type="hidden" name="nome" value="<?php echo htmlspecialchars($_POST['nome']); ?>">
            <input type="hidden" name="step" value="<?php echo $currentStep + 1; ?>">
            <button type="submit">Procedi</button>

        </form>
        <?php if($currentStep > 0){
            ?>
            <form method="post">
                <input type="hidden" name="nome" value="<?php echo htmlspecialchars($_POST['nome']); ?>">
                <input type="hidden" name="step" value="<?php echo $currentStep - 1; ?>">
                <button type="submit">Indietro</button>
            </form>
        <?php } 
        } else { ?>
            <h3>Ricetta completata!</h3>
            <form method="post">
                <button type="submit">Torna alla selezione</button>
            </form>
        <?php } ?>
    <?php endif; ?>
</main>
