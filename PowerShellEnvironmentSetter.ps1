$currentDir = (Get-Item -Path ".\" -Verbose).FullName

#$regex = [regex]".*Repo."
#$directory = $regex.Match($currentDir).Captures[0].Value
#$gitRepo = (Get-ChildItem $directory *.git* -Recurse -Directory -Hidden -Verbose).FullName
#$dir = $gitRepo.Substring(0, $gitRepo.Length-4)
#$cmdPath = $dir + "tools\path1st\myenv.cmd"

# When shell start at the correct path.
$cmdPath = $currentDir + "\tools\path1st\myenv.cmd"

$tempFile = [IO.Path]::GetTempFileName()
cmd /c "$cmdPath && set > $tempFile"

Get-Content $tempFile | Foreach-Object{
	if($_ -match "^(.*?)=(.*)$")
	{
		Set-Content "env:\$($matches[1])" $matches[2]
	}
}

Remove-Item $tempFile