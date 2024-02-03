## region Modules
Import-Module -Name Terminal-Icons

# region Functions

function .. {
  Set-Location ..
}

function c {
  Clear-Host
  pwd
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

function dir {
  Get-ChildItem -Directory
}
function file {
  Get-ChildItem -File
}
function hidden {
  Get-ChildItem -Hidden
}

# endregion

#region aliases
################################################################################
# Set common aliases                                                           #
################################################################################
Set-Alias -Name ls -Value dir
Set-Alias -Name ll -Value file
Set-Alias -Name lla -Value hidden
Set-Alias -Name vim -Value nvim
Set-Alias -Name vi -Value nvim
# endregion

