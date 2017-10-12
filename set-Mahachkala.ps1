clear
Set-ExecutionPolicy -Scope CurrentUser  -ExecutionPolicy Bypass -Force

 
$regKey="HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" 
$proxyServerToDefine = "46.16.226.222"
$proxyServertoDefinePort = "53281"
$override="*.4slovo.ru;4slovo.ru;*.local;<local>"
$region= "Махачкала"

Write-Host -ForegroundColor Yellow "Проверка доступности...:" -NoNewline
$status = Test-NetConnection $proxyServerToDefine -Port $proxyServertoDefinePort -InformationLevel Quiet 

If ($status -eq "True")
{Write-Host -ForegroundColor Green Порт доступен 



Set-ItemProperty -path $regKey ProxyEnable -value 1
Set-ItemProperty -path $regKey ProxyOverride -value $override
Set-ItemProperty -path $regKey ProxyServer -value ${proxyServerToDefine}:${proxyServerToDefinePort}
Set-ItemProperty -Path $regKey Region -Value $region
Write-Host -ForegroundColor Green Proxy $region включен. Перезапустите браузер для немедленного вступления в силу настроек 
Start-Sleep -s 1
}

Else
{Write-Host -ForegroundColor Red "Сервер недоступен попробуйте позже. Прокси не установлен" }


$endTime = (get-date).addSeconds(11)
while ( (get-date) -lt $endTime )
{
   Write-Host -ForegroundColor Yellow "Автоматически закроется через : $("{0}" -f ([int](new-timespan $(get-date) $endTime).totalseconds))" 'сек'
   Start-Sleep -Seconds 1
}