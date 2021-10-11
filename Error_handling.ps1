$webs = @("www.google.com", "www.bing.com", "www.pstrycatch.com")
$output = @()

foreach ($web in $webs) {
    try {
        $result = Test-connection $web -Count 1 -ErrorAction Stop
        $property = @{
            Source      = $result.PSComputerName
            Destination = $result.ProtocolAddress
        }
        $output += new-object psobject -property $property
    }
    catch {
        $hostname = $env:COMPUTERNAME 
        $result = $_.exception.message
        $property = @{
            Source      = $hostname
            Destination = $result
        }
        $output += new-object psobject -property $property
    }
}

$output



##########################################

Here in this code we are looking the error handling on powershell

Try/Catch block in PowerShell is to handle the errors which are produced in the script. 
To be specific, the errors should be terminating errors.
The Finally block in the PowerShell is not mandatory to write each time along with Try/Catch but it will be executed regardless the error occurs or not.
So when you use the Try block, the Catch block is mandatory but not Finally block.
Try/Catch block with Terminating error − Below is the example of Terminating error without finally block.
The catch block only runs when we have terminating error otherwise it wouldn't run as due to that I have used -EA in above script as Stop.
If I shouldn't have done that then catch would have no use in the script.

In other language,
A Try Catch block in Powershell always exists of one Try block and atleast one Catch block.
The Finally block is optional, the code in this block will always run, no matter the outcome of the Try block.