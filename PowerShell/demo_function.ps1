function Get-greetings {
    $greet = "Thangadurai"
    Write-Host $greet -ForegroundColor Green -BackgroundColor Black
    $family_name = Read-Host "Please enter your family name please"
    $age = Read-Host "What is your age, please tell us"
    Write-Host "Your age is:" $age -ForegroundColor Green -BackgroundColor Black
    Write-Host "Your family name is:" $family_name -f Green -BackgroundColor Black
    Write-Host "Hello, $greet and your age is $age and family_name is: $family_name" -ForegroundColor Green -BackgroundColor Black
}
Get-greetings
