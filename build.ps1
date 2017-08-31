choco install visualstudio2017buildtools -y
choco install visualstudio2017-workload-webbuildtools --package-parameters "--includeOptional" -y
choco install nuget.commandline -y

$msbuildPath = "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\MSBuild\15.0\bin"
$buildProperties = "/p:Configuration=Release;DeployOnBuild=true;PublishProfile=FolderProfile"


if (Test-Path -Path $msbuildPath -IsValid) {
 $msbuild = Get-Item "$msbuildPath\MSBuild.exe"

 # Publish Project
 nuget restore
 cd "$PSScriptRoot\FuncAppDemo"
 &$msbuild $publishProfile
 cd $PSScriptRoot

}
else {
 Write-Error -Message "MSBuild not found at location $msbuildPath"
}