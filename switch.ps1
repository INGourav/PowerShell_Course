$servers = @("dc01", "dc02", "dc03", "localhost")

foreach ($server in $servers) {
    $os = Get-WmiObject -Class win32_operatingsystem -ComputerName $server -ErrorAction SilentlyContinue
    switch ($os.Caption) {
        "Microsoft Windows 10 Enterprise"
        { Write-Output "This is Client OS, Windows10" }
        "Microsoft Server 2012 R2 Standard"
        { Write-Output "This is Server OS, 2012 R2" }
        Default { "The OS is neither 2012R2 nor Windows10" }
    }
}

##########################################
The switch stament generally used to select condition based on the output of certain code.