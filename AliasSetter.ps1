# EnvironmentVariables

$env:PATH += ";C:\MyRepo\Tools"

#Development Aliases

function OpenOls{
    devenv $Env:srcroot\ols\ols.sln
}
set-alias dev_ols OpenOls

function OpenSvcDef{
    devenv $Env:srcroot\osisvcdef\ols\src\servicedefinitions\ols\ols.sln
}
set-alias dev_svcdef OpenSvcDef

function SvcDefDir{
    cd $Env:srcroot\osisvcdef\ols\src\servicedefinitions\ols\
}
set-alias svcdef_dir SvcDefDir

function SvcDefRoot{
    cd $Env:srcroot\osisvcdef\ols
}
set-alias svcdef_root SvcDefRoot

function OlsTarget{
    cd $Env:targetroot\x64\debug\ols\x-none
}

function TargetRoot($project){
    cd $Env:targetroot\x64\debug\$project\x-none
}

function OlsEnvironmentsDir{
    cd $Env:targetroot\x64\debug\olssetup\en-us\setup\deployment\environments
}
set-alias olsenv_dir OlsEnvironmentsDir

function EnvironmentsDir($project){
    cd $Env:targetroot\x64\debug\"osiedgen_$($project)"\x-none\EnvironmentDescriptionFiles
}

function ols_devmain(){
    cmd /c start C:\Users\syhamza\Desktop\Office.lnk
}

function ToRoot{
    cd $env:srcroot
}
set-alias root ToRoot

function ToRepo{
    cd $env:InetRoot
}
set-alias repo ToRepo

function OpenAliasSetter{
    subl C:\MyRepo\Tools\AliasSetter.ps1
}
set-alias open_aliasSetter OpenAliasSetter

set-alias run_aliasSetter C:\MyRepo\Tools\AliasSetter.ps1

function InitEnv{
    C:\MyRepo\Tools\PowerShellEnvironmentSetter.ps1
}
set-alias init_env InitEnv

function OpenEnvSetter{
    subl C:\MyRepo\Tools\PowerShellEnvironmentSetter.ps1
}
set-alias open_envsetter OpenEnvSetter

function SvcDef([string]$project){
    cd $Env:srcroot\osisvcdef\$project\src\servicedefinitions\$project\
}

set-alias dev devenv

function OpenResearch{
    . $Env:otools\bin\research
}
set-alias research OpenResearch

function OpenOtoolsBin{
    cd $Env:otools\bin
}
set-alias otools_dir OpenOtoolsBin

function sub_otools{
    subl $Env:SrcRoot\otools
}

function ToMyTools{
    cd C:\MyRepo\Tools
}
set-alias mytools ToMyTools

set-alias dev devenv

function omex_cmd{
    cmd /c start C:\Users\syhamza\Desktop\Omex.lnk
}

function ols1_cmd{
    cmd /c start C:\Users\syhamza\Desktop\ols.lnk
}

function ols2_cmd{
    cmd /c start 'C:\Users\syhamza\Desktop\ols(2).lnk'
}

function ols3_cmd{
    cmd /c start 'C:\Users\syhamza\Desktop\ols(3).lnk'
}

function ols4_cmd{
    cmd /c start 'C:\Users\syhamza\Desktop\ols(4).lnk'
}

function gitPull{
    $x = cmd /c git rev-parse --abbrev-ref HEAD 2>&1
    cmd /c git checkout develop | git pull | git checkout $x
}

function sub_ols{
    subl $Env:SrcRoot\ols
}

function ols_dir{
    cd $Env:SrcRoot\ols
}

function Copy_Subl_ToRepo([string]$username){
    copy "C:\Users\${username}\AppData\Roaming\Sublime Text 3\Packages\User\Preferences.sublime-settings" "C:\MyRepo\Tools\Sublime"
    copy "C:\Users\${username}\AppData\Roaming\Sublime Text 3\Packages\User\Default (Windows).sublime-keymap" "C:\MyRepo\Tools\Sublime"
}

function Copy_Subl_ToFolder([string]$username){
    copy "C:\MyRepo\Tools\Sublime\Preferences.sublime-settings" "C:\Users\${username}\AppData\Roaming\Sublime Text 3\Packages\User\"
    copy "C:\MyRepo\Tools\Sublime\Default (Windows).sublime-keymap" "C:\Users\${username}\AppData\Roaming\Sublime Text 3\Packages\"
}

function Copy_ConEmu_ToRepo([string]$username){
    copy "C:\Users\${username}\AppData\Roaming\ConEmu.xml" "C:\MyRepo\Tools\ConEmu"
}

function Copy_ConEmu_ToFolder([string]$username){
    copy "C:\MyRepo\Tools\ConEmu\ConEmu.xml" "C:\Users\${username}\AppData\Roaming\ConEmu.xml"
}

function osidef{
    cd $Env:SrcRoot\ols\OsiDefinitions
}

function Desktop{
    cd C:\Users\syhamza\desktop
}

function build_svcdef{
    $x = cmd /c cd
    cd $Env:srcroot\osisvcdef
    cmd /c quickbuild
    cd $Env:srcroot\osiedgen
    quickbuild
    cd $x
}

function open_ildasm{
    . "C:\Program Files (x86)\Microsoft SDKs\Windows\v7.0A\Bin\ildasm.exe"
}

function deploy_gallatinEdog([string]$buildNumber){
    cmd /c \\o\tenants\ols\${buildNumber}\shadow\store\x64\ship\olssetup\en-us\setup\Tools\WarmDeploy\WarmDeploy.cmd -SpecFilePath \\o\tenants\ols\${buildNumber}\releases\hosted\en-us\${buildNumber}_Osiolschina_none_ship_x64_en-us\WARM\Environments\OlsCn-ChinaEdog-Cloud\DeploymentSpec-AllRegions.xml -Notes "Triggered via Warm script"
}

function deploy_PREDog([string]$buildNumber){
    cmd /c \\ocentral\Build\VSTSCICDPrototype\staging\olsPR\${buildNumber}\target\x64\Ship\olssetup\en-us\setup\Tools\WarmDeploy\WarmDeploy.cmd \\ocentral\Build\VSTSCICDPrototype\staging\olsPR\${buildNumber}\target\x64\Ship\olssetup\en-us\setup\WARM\Environments\Ols-EDog-Cloud\DeploymentSpec-AllRegions.xml -Notes "Triggered via Warm script"
}