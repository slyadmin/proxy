clear
Set-ExecutionPolicy -Scope CurrentUser  -ExecutionPolicy Bypass -Force

 
$regKey="HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" 
$proxyServerToDefine = "" 
$region= "disabled"



Set-ItemProperty -path $regKey ProxyEnable -value 0
Set-ItemProperty -path $regKey ProxyServer -value $proxyServerToDefine
Set-ItemProperty -Path $regKey Region -Value $region
Write-Host -ForegroundColor Green "Proxy отключен, для всех браузеров" 
Start-Sleep -s 3


$endTime = (get-date).addSeconds(5)
while ( (get-date) -lt $endTime )
{
   Write-Host -ForegroundColor Yellow "Автоматически закроется через : $("{0}" -f ([int](new-timespan $(get-date) $endTime).totalseconds))" 'сек'
   Start-Sleep -Seconds 1
}
