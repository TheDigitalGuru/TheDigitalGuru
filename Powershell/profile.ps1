#Import-Module -Name Terminal-Icons
#Import-Module oh-my-posh
#Import-Module PSColors
Import-Module PSReadLine

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json" | Invoke-Expression

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

#Default_Posh_Git
#function Set-PoshGitStatus {
#    $global:GitStatus = Get-GitStatus
#    $env:POSH_GIT_STRING = Write-GitStatus -Status $global:GitStatus
#}
#New-Alias -Name 'Set-PoshContext' -Value 'Set-PoshGitStatus' -Scope Global -Force

#Not Default Posh-Git
#$env:POSH_GIT_ENABLED = $true 

#https://ohmyposh.dev/docs/installation/windows
#https://gist.github.com/shanselman/1f69b28bfcc4f7716e49eb5bb34d7b2c?WT.mc_id=-blog-scottha
