$dirs = Get-childitem -Path C:\Users\ | Out-GridView
$dirs | Select-Object LastWriteTime


$dirs = Get-childitem -Path C:\Users\ | Out-GridView -PassThru
$dirs | Select-Object LastWriteTime


##########################################
Out-GridView is only used to show the output on a different window.
However, when we aadd -PassThru it give us option to make our choice and then it performs the action that is given in code block.

If we notice, after running first set of command $dirs has nothing in it because Out-GridView only used to show output and demonstrate
After execution our secind set of commands we do see the "LastWriteTime" of the particular directory that we have selected.

So as a conclusion we use -PassThru when we need to perform any further action. And Out-GridView only used to display the output in a window where we can apply somme filters and all.
