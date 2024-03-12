function Get-greetings {
    $greet = Read-Host "Please enter your name"
    Write-Host "Your name is $greet" -f Green -BackgroundColor Black
    $family_name = Read-Host "Please enter your family name please"
    Write-Host "Your family name is:" $family_name -f Green -BackgroundColor Black
    $age = Read-Host "What is your age, please tell us"
    Write-Host "Your age is:" $age -ForegroundColor Green -BackgroundColor Black
    Write-Host "Hello, $greet and your age is $age and family_name is: $family_name" -ForegroundColor Green -BackgroundColor Black
}
Get-greetings
