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

function EnvironmentsDir{
	cd $Env:targetroot\x64\debug\olssetup\en-us\setup\deployment\environments
}
set-alias env_dir EnvironmentsDir

function ToRoot{
	cd $env:srcroot
}
set-alias root ToRoot

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

function ToMyTools{
	cd C:\MyRepo\Tools
}
set-alias mytools ToMyTools