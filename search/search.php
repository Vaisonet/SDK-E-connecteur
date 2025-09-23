<?php

// Fonction pour parcourir les dossiers et sous-dossiers
function searchFiles($dir, $searchString) {
    $rii = new RecursiveIteratorIterator(new RecursiveDirectoryIterator($dir));

    foreach ($rii as $file) {
        // Ignorer les dossiers
        if ($file->isDir()){ 
            continue;
        }

        // Extensions à vérifier
        $validExtensions = ['php', 'html', 'txt', 'json', 'js', 'vaidll'];
        $fileExtension = pathinfo($file->getFilename(), PATHINFO_EXTENSION);

        // Vérifier si l'extension du fichier est dans la liste des extensions valides
        if (in_array($fileExtension, $validExtensions)) {
            // Lire le contenu du fichier
            $content = file_get_contents($file->getPathname());

            // Recherche de la chaîne exacte dans le contenu du fichier
            if (strpos($content, $searchString) !== false) {
                // Afficher le chemin du fichier si la chaîne est trouvée
                echo "Chaîne trouvée dans : " . $file->getPathname() . PHP_EOL;
            }
        }
    }
}

// Chemin du répertoire à parcourir
$dir = './';

// Chaîne à rechercher
$searchString = 'efface_image';

// Appel de la fonction de recherche
searchFiles($dir, $searchString);

?>
