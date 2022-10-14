function Git-Pull-From-Folder {
    Param ([string]$folderPath)

    Get-ChildItem -Path $folderPath -Recurse -Directory -Depth 0 | ForEach-Object {

        $gitFolder = $_.FullName + "/.git"
        if (Test-Path $gitFolder) {
            cd $_.FullName
            $branch = git branch --show-current
            
            $branchColor = "DarkGreen"
            $branchColorBack = "Black"
    
            if ($branch -ne 'master'){
                $branchColor = "Black"
                $branchColorBack = "DarkGreen"
            } 
    
            Write-Host "Folder: " $_.FullName -ForegroundColor DarkYellow
            Write-Host "Branch: " $branch -ForegroundColor $branchColor -BackgroundColor $branchColorBack
            git status
            Write-Host ""
        }
    }

}

Git-Pull-From-Folder -folderPath C:\src\repos
Git-Pull-From-Folder -folderPath C:\src\repos 
