    # Path to your IP addresses file
    $IPFile = "C:\temp\IPs.txt"

    # Ports to scan
    $PortsToScan = @(80, 443, 3389)

    # Read IP addresses from the file
    $IPAddresses = Get-Content -Path $IPFile

    Write-Host "Starting port scan..."

    foreach ($IP in $IPAddresses) {
        Write-Host "`nScanning IP: $IP" -ForegroundColor Cyan
        foreach ($Port in $PortsToScan) {
            try {
                $Result = Test-NetConnection -ComputerName $IP -Port $Port -InformationLevel Quiet -ErrorAction SilentlyContinue
                if ($Result.TcpTestSucceeded) {
                    Write-Host "  Port $Port is OPEN" -ForegroundColor Green
                } else {
                    Write-Host "  Port $Port is CLOSED or FILTERED" -ForegroundColor Red
                }
            } catch {
                Write-Host "  Error scanning port $Port on $IP: $($_.Exception.Message)" -ForegroundColor Yellow
            }
        }
    }

    Write-Host "`nPort scan complete."
