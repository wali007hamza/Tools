$currentDir = (Get-Item -Path ".\" -Verbose).FullName
$regex = [regex]".*Repo."
$directory = $regex.Match($currentDir).Captures[0].Value
$gitRepo = (Get-ChildItem $directory *.git* -Recurse -Directory -Hidden -Verbose).FullName
$dir = $gitRepo.Substring(0, $gitRepo.Length-4)
$cmdPath = $dir + "tools\path1st\myenv.cmd"
cmd /c "$cmdPath"