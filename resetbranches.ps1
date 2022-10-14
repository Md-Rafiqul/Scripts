function Loop-Through-Git-Folders {
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
            
                Write-Host "Switching branch to master: " $_.FullName -ForegroundColor "DarkYellow"
                Write-Host "Current branch: " $branch -ForegroundColor $branchColor -BackgroundColor $branchColorBack
                git switch master

                $branch = git branch --show-current
                Write-Host "Updated branch: " $branch -ForegroundColor $branchColor -BackgroundColor $branchColorBack
                Write-Host ""
            } 
    
            $branchList = git branch -l             
            
            if ($branchList.Count -gt 1) {
                Write-Host "Cleaning branches in " $_.FullName -ForegroundColor "DarkYellow"
            }

            $branchList | ForEach-Object {
                $currentBranch = $_.Trim()   
                if ( $currentBranch -ne "* master"){
                    Write-Host "Deleting branch: " $currentBranch -ForegroundColor "Red"
                    git branch -D $currentBranch
                }

            }
            
        }
    }
}

Loop-Through-Git-Folders -folderPath C:\src\repos
Loop-Through-Git-Folders -folderPath C:\src\repos

