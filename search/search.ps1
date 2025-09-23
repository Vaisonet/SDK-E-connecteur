# Définir le chemin du dossier racine où la recherche doit commencer
$rootFolder = "D:\E-connecteur-Core-master"

# Mot-clé ou chaîne partielle à rechercher
$searchString = "noreply@vaisonet.com"

# Extensions à vérifier
$extensions = "*.php", "*.html", "*.txt", "*.json", "*.js", "*.vaidll"

# Parcourir les fichiers avec les extensions spécifiées
ForEach ($ext in $extensions) {
    Get-ChildItem -Path $rootFolder -Recurse -Filter $ext -File | ForEach-Object {
        try {
            # Lire le contenu du fichier en une seule chaîne et ignorer les erreurs d'encodage
            $content = Get-Content -Path $_.FullName -Raw -Encoding UTF8 -ErrorAction Stop

            # Vérifier si le mot clé est présent dans le fichier (insensible à la casse)
            if ($content -imatch "$searchString") {
                Write-Host "Mot-clé trouvé dans le fichier : $($_.FullName)"
            }
        } catch {
            Write-Host "Erreur lors de la lecture du fichier : $($_.FullName)"
        }
    }
}

# Pause à la fin
Write-Host "Appuyez sur une touche pour continuer..." -ForegroundColor Yellow
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

