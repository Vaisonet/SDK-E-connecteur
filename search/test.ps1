# Récupère le chemin du dossier racine où le script est exécuté
$rootFolder = Get-Location

# Affiche un message de confirmation
Write-Host "Recherche de tous les fichiers .vaidll dans le dossier $rootFolder et ses sous-dossiers..."

# Recherche de tous les fichiers .vaidll dans le dossier et ses sous-dossiers
Get-ChildItem -Path $rootFolder -Recurse -Filter *.vaidll -File | ForEach-Object {
    # Récupère le chemin complet du fichier actuel
    $oldFilePath = $_.FullName

    # Change l'extension en .php
    $newFilePath = [System.IO.Path]::ChangeExtension($oldFilePath, ".php")

    # Renomme le fichier avec la nouvelle extension
    try {
        Rename-Item -Path $oldFilePath -NewName $newFilePath -ErrorAction Stop
        Write-Host "Renommé : $oldFilePath -> $newFilePath"

        # Lire le contenu du fichier renommé
        $fileContent = Get-Content -Path $newFilePath

        # Remplacer toutes les occurrences de "vaidll" par "php" dans le contenu
        $updatedContent = $fileContent -replace "vaidll", "php"

        # Écrire les modifications dans le fichier
        Set-Content -Path $newFilePath -Value $updatedContent

        Write-Host "Contenu modifié dans : $newFilePath"

    } catch {
        Write-Host "Erreur lors du renommage ou modification de : $oldFilePath"
    }
}

Write-Host "Tous les fichiers .vaidll ont été renommés et modifiés avec succès."

# Ajoute une pause à la fin
Write-Host "Appuyez sur une touche pour continuer..." -ForegroundColor Yellow
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
