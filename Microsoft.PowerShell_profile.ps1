# region Functions
function sudo {
  Start-Process @args -Verb RunAs -Wait
}

function .. {
  Set-Location ..
}

function ... {
  Set-Location ../..
}

function .... {
  Set-Location ../../..
}

function c {
  Clear-Host
  Get-ChildItemColorFormatWide
}

function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
  Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function Open ($param) {
  if ($param) {
    Invoke-Item $param
  }
  else {
    Invoke-Item .
  }
}

# endregion

#region aliases
################################################################################
# Set common aliases                                                           #
################################################################################
Set-Alias -Name ll -Value Get-ChildItemColor -Scope Global -Option AllScope
Set-Alias -Name ls -Value Get-ChildItemColorFormatWide -Scope Global -Option AllScope
Set-Alias -Name History -Value Open-HistoryFile -Scope Global -Option AllScope
Set-Alias -Name vim -Value nvim

# endregion

#region execution
################################################################################
# Update the console title with current PowerShell elevation and version       #
################################################################################
Import-Module -Name Terminal-Icons
# $Host.UI.RawUI.WindowTitle = "PowerS | $((Invoke-WebRequest wttr.in/kassel?format="%c%t" -UseBasicParsing).content)"


################################################################################
# Update Starship Env                                                          #
################################################################################
$ENV:STARSHIP_CONFIG = "$HOME\starship\starship.toml"

# endregion


Invoke-Expression (&starship init powershell)
