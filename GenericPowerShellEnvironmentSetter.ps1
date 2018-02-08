param(
    [string]$initPath
)

# When shell start at the correct path.
$cmdPath = $initPath

$tempFile = [IO.Path]::GetTempFileName()
cmd /c "$cmdPath && set > $tempFile"

Get-Content $tempFile | Foreach-Object {
    if ($_ -match "^(.*?)=(.*)$") {
        Set-Content "env:\$($matches[1])" $matches[2]
    }
}

Remove-Item $tempFile