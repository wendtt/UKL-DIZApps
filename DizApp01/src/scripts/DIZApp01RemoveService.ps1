$services = Get-Service -Name "DIZApp01"
if ($services.length -eq 0) {
	Write-Output("No service named DIZApp01 found.")
} else {
	foreach ($service in $services) {
		Stop-Service -InputObject $service
		$service = Get-WmiObject -Class Win32_Service -Filter "Name='DIZApp01'"
		$service.delete()
	}
	Write-Output("Service removal finished. Check if service is removed properly.")
}
Start-Sleep -Seconds 5