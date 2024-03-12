function Get-awscred {
    $subjec = "This is to connect AWS login via API"
    Write-Host $subjec -ForegroundColor Green -BackgroundColor Black
    $access_key = Read-Host "Please enter AWS ACCESS_KEY please"
    $secret_key = Read-Host "Please enter AWS SECRET_ACCESS_KEY"
    Write-Host "Your access_key is:" $access_key -ForegroundColor Green -BackgroundColor Black
    Write-Host "Your secret_key is:" $secret_key -f Green -BackgroundColor Black
    $region = Read-Host "Please enter region name"
    Write-Host "You chosen region is $region" -ForegroundColor Green -BackgroundColor Black
    
}
Get-awscred
