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

function OlsEnvironmentsDir{
    cd $Env:targetroot\x64\debug\olssetup\en-us\setup\deployment\environments
}
set-alias olsenv_dir OlsEnvironmentsDir

function EnvironmentsDir($project){
    cd $Env:targetroot\x64\debug\"osiedgen_$($project)"\x-none\EnvironmentDescriptionFiles
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

