# EnvironmentVariables

$env:PATH += ";C:\MyRepo\Tools"

$computerName = get-childitem env:computername
if ($computerName.Value -eq "SYHAMZA-MACHINE") {
    $env:NUGET_PACKAGES = "d:\nuget\packages"
}

function Work {
    if ($computerName.Value -eq "MININT-HFT2PFJ") {
        cd C:\Work
    }
}
#Development Aliases

function dev_17($fileName){
    cmd /c start "E:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\Common7\IDE" $fileName
}

function OpenOls{
    dev_17 $Env:srcroot\ols\ols.sln
}
set-alias dev_ols OpenOls

function host_dir {
    cd C:\Windows\System32\drivers\etc
}

function lumos_root {
    cd $Env:OloobeRoot
}

function lumos_dir {
    cd $Env:LumosSolutionDir
}

function dev_lumos {
    devenv $Env:LumosSolutionDir\Lumos.sln
}

function code_oloobe {
    code $Env:OloobeRoot
}
function scripts_dir{
    cd $Env:SrcRoot\ols\Tools\Scripts
}
function OpenSvcDef {
    dev_17 $Env:srcroot\osisvcdef\ols\src\servicedefinitions\ols\ols.sln
}
set-alias dev_svcdef OpenSvcDef

function SvcDefDir {
    cd $Env:srcroot\osisvcdef\ols\src\servicedefinitions\ols\
}
set-alias svcdef_dir SvcDefDir

function SvcDefRoot {
    cd $Env:srcroot\osisvcdef\ols
}
set-alias svcdef_root SvcDefRoot

function OlsTarget {
    cd $Env:targetroot\x64\debug\ols\x-none
}

function DeleteTarget {
    Remove-Item $Env:targetroot -Force -Recurse
}

function TargetRoot($project) {
    cd $Env:targetroot\x64\debug\$project\x-none
}

function OlsEnvironmentsDir {
    cd $Env:targetroot\x64\debug\olssetup\en-us\setup\deployment\environments
}
set-alias olsenv_dir OlsEnvironmentsDir

function EnvironmentsDir($project) {
    cd $Env:targetroot\x64\debug\"osiedgen_$($project)"\x-none\EnvironmentDescriptionFiles
}

function ols_devmain() {
    cmd /c start C:\Users\syhamza\Desktop\Office.lnk
}

function ToRoot {
    cd $env:srcroot
}
set-alias root ToRoot

function ToDebugger {
    cd "C:\Program Files (x86)\Windows Kits\10\Debuggers\x64"
}

function ToRepo {
    cd $env:InetRoot
}
set-alias repo ToRepo

function OpenAliasSetter {
    code C:\MyRepo\Tools\AliasSetter.ps1
}
set-alias open_aliasSetter OpenAliasSetter

function CodeOpenAliasSetter {
    code C:\MyRepo\Tools\AliasSetter.ps1
}

set-alias run_aliasSetter C:\MyRepo\Tools\AliasSetter.ps1

function InitEnv {
    C:\MyRepo\Tools\PowerShellEnvironmentSetter.ps1
}
set-alias init_env InitEnv

function OpenEnvSetter {
    code C:\MyRepo\Tools\PowerShellEnvironmentSetter.ps1
}
set-alias open_envsetter OpenEnvSetter

function SvcDef([string]$project) {
    cd $Env:srcroot\osisvcdef\$project\src\servicedefinitions\$project\
}

set-alias dev devenv

function OpenResearch {
    . $Env:otools\bin\research
}
set-alias research OpenResearch

function OpenOtoolsBin {
    cd $Env:otools\bin
}
set-alias otools_dir OpenOtoolsBin

function sub_otools {
    code $Env:SrcRoot\otools
}

function ToMyTools {
    cd C:\MyRepo\Tools
}
set-alias mytools ToMyTools

function myrepo {
    cd C:\MyRepo
}

set-alias dev devenv

function omex_cmd {
    cmd /c start C:\Users\syhamza\Desktop\Omex.lnk
}

function ols1_cmd {
    cmd /c start C:\Users\syhamza\Desktop\ols.lnk
}

function ols2_cmd {
    cmd /c start 'C:\Users\syhamza\Desktop\ols(2).lnk'
}

function ols3_cmd {
    cmd /c start 'C:\Users\syhamza\Desktop\ols(3).lnk'
}

function ols4_cmd {
    cmd /c start 'C:\Users\syhamza\Desktop\ols(4).lnk'
}

function gitPull {
    $x = cmd /c git rev-parse --abbrev-ref HEAD 2>&1
    cmd /c git checkout develop | git pull | git checkout $x
}

function DeleteBranch($prefix) {
    $branches = (git branch) -split "\n"
    foreach ($x in $branches) {
        if ($x.Contains($prefix)) {
            Write-Host $x
            git branch -D $x.Trim()
        }
    }
}

function sub_ols {
    code $Env:SrcRoot\ols
}

function ols_dir {
    cd $Env:SrcRoot\ols
}

function osidef {
    cd $Env:SrcRoot\ols\OsiDefinitions
}

function Desktop {
    cd C:\Users\syhamza\desktop
}

function build_svcdef {
    $x = cmd /c cd
    cd $Env:srcroot\osisvcdef
    cmd /c quickbuild
    cd $Env:srcroot\osiedgen
    quickbuild
    cd $x
}

$pathToIldasm = "C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.6.1 Tools\ildasm.exe";
$pathToIlasm = "C:\Windows\Microsoft.NET\Framework64\v4.0.30319\ilasm.exe";

function open_ildasm {
    cmd /c $pathToIldasm
}

function open_ilasm {
    cmd /c $pathToIlasm
}

function sign_assembly([string]$assemblyName, [string]$snkPath) {
    $assemblyIlName = "${assemblyName}.il";
    $assemblyDllName = "${assemblyName}.dll";

    cmd /c $pathToIldasm /all /typelist /out=$assemblyIlName $assemblyDllName
    cmd /c $pathToIlasm /dll /optimize /key=$snkPath $assemblyIlName
}

function deploy_gallatinEdog([string]$buildNumber) {
    cmd /c \\o\tenants\ols\${buildNumber}\shadow\store\x64\ship\olssetup\en-us\setup\Tools\WarmDeploy\WarmDeploy.cmd -SpecFilePath \\o\tenants\ols\${buildNumber}\releases\hosted\en-us\${buildNumber}_Osiolschina_none_ship_x64_en-us\WARM\Environments\OlsCn-ChinaEdog-Cloud\DeploymentSpec-AllRegions.xml -Notes "Triggered via Warm script"
}

function deploy_PREDog([string]$buildNumber) {
    cmd /c \\ocentral\Build\VSTSCICDPrototype\ols\official\${buildNumber}\target\x64\Ship\olssetup\en-us\setup\Tools\WarmDeploy\WarmDeploy.cmd \\ocentral\Build\VSTSCICDPrototype\ols\official\${buildNumber}\target\x64\Ship\olssetup\en-us\setup\WARM\Environments\Ols-EDog-Cloud\DeploymentSpec-AllRegions.xml -Notes "Triggered via Warm script"
}