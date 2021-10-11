Here I am going to demonstrate the difference between for, foreach, and foreach-object. (We also do have foreach-object -parallel now in the market with new PS versions 7 and more).

##########################################
$value = 1000000
$time = Measure-Command {
  for ($i = 0; $i -lt $value; $i++) {}
} | Select-Object -ExpandProperty Totalseconds
Write-Host "for i loop took $time"

Output that I have received,
for i loop took 1.4552234

##########################################
$value = 1000000
$time = Measure-Command {
  foreach ($i in $value) {}
} | Select-Object -ExpandProperty Totalseconds
Write-Host "foreach i loop took $time"
  
Output that I have received,
foreach i loop took 0.0008824

##########################################
$value = 1000000
$time = Measure-Command {
  $value | ForEach-Object {}
} | Select-Object -ExpandProperty Totalseconds
Write-Host "foreach i loop took $time"
  
Output that I have received,
foreach i loop took 0.0012595


After running all loops,
The for loop is not very memory intensive and we generally use when we haave limited amount of memory and want to run scipt faster.
On the other hand, foreach is faster among all but it took lot of memory as it stores the var and run one by one. Hence this will create lot of load on memory.
Last loop, foreach-object we have to use when we have small number of data as well as limited number of memory. It takes generally the most time among all and it is also not reccomended to use when we 10000 or more than object.
