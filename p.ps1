function Test-OpenPort {
    param (
        [Parameter(Mandatory=$true)]
        [string]$IPAddress,

        [Parameter(Mandatory=$true)]
        [int]$Port,

        [int]$TimeoutSeconds = 1
    )

    try {
        $tcpClient = New-Object System.Net.Sockets.TcpClient
        $connectAsync = $tcpClient.BeginConnect($IPAddress, $Port, $null, $null)
        $waitHandle = $connectAsync.AsyncWaitHandle
        $waitResult = $waitHandle.WaitOne($TimeoutSeconds * 1000, $false)

        if ($waitResult) {
            $tcpClient.EndConnect($connectAsync)
            if ($tcpClient.Connected) {
                Write-Host "$IPAddress:$Port - OPEN" -ForegroundColor Green
                return $true
            } else {
                Write-Host "$IPAddress:$Port - CLOSED" -ForegroundColor Red
                return $false
            }
        } else {
            Write-Host "$IPAddress:$Port - TIMEOUT" -ForegroundColor Yellow
            return $false
        }
    } catch {
        Write-Host "$IPAddress:$Port - ERROR: $($_.Exception.Message)" -ForegroundColor Red
        return $false
    } finally {
        if ($tcpClient) {
            $tcpClient.Close()
            $tcpClient.Dispose()
        }
    }
}

# Get IP addresses from a file
$IPFile = Read-Host "Enter the path to the IP address file (e.g., C:\ips.txt)"
if (-not (Test-Path $IPFile)) {
    Write-Error "IP address file not found: $IPFile"
    exit
}
$IPs = Get-Content $IPFile | Where-Object { $_ -match '^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$' }

# Get ports from user input
$PortsInput = Read-Host "Enter ports to scan (comma-separated, e.g., 80,443,22)"
$Ports = $PortsInput.Split(',') | ForEach-Object { [int]$_.Trim() }

# Loop through each IP and port
foreach ($IP in $IPs) {
    foreach ($Port in $Ports) {
        Test-OpenPort -IPAddress $IP -Port $Port
    }
}
