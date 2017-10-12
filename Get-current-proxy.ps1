clear
Set-ExecutionPolicy -Scope CurrentUser  -ExecutionPolicy Bypass -Force

$regKey="HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" 

$current=Get-ItemProperty -Path $regKey | select Region | Format-Wide

Write-Host -ForegroundColor Green 'Текущий Proxy сервер:' 
$current 

Start-Sleep -s 2


$endTime = (get-date).addSeconds(5)
while ( (get-date) -lt $endTime )
{
   Write-Host -ForegroundColor Yellow "Автоматически закроется через : $("{0}" -f ([int](new-timespan $(get-date) $endTime).totalseconds))" 'сек'
   Start-Sleep -Seconds 1
}
