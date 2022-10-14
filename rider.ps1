$v = Get-ChildItem -Path .\* -Include *.sln
if ($v.Length -eq 0) {
    $v = Get-ChildItem -Path .\* -Include *.csproj
}

if ($v.Length -ne 0) {
    Write-Host "Opening ${v}"    
    C:\Users\RafiqulIslam\AppData\Local\JetBrains\Installations\Rider213\bin\rider64.exe $v
} else {
    Write-Host "Unable to find .sln or .csproj file in the current directory."    
}