### How to swap two variables in Powershell 


##### Script starts here ######

## Swap two variables in PowerShell

Write-Host "How to swap two variables in Powershell" -ForegroundColor Red -BackgroundColor Black

$a = Read-Host "Enter the value of a, you would like to pass" 
$a
$b = Read-Host "Enter the value of b, you would like to pass"
$b
Start-Sleep -Seconds 1

# swapping two variables

$a, $b = $b, $a

Start-Sleep -Seconds 1

Write-Host "The value of a is:" $a -ForegroundColor Red -BackgroundColor Black

Start-Sleep -Seconds 1

Write-Host "The value of b is:" $b -ForegroundColor Red -BackgroundColor Black

###### Note: This is PowerShell Script, which works on Windows Based OS
