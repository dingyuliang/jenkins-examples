"C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\MSBuild\15.0\Bin\msbuild.exe" src/DotNet/DotNet.Jenkins/DotNet.Jenkins.csproj /p:DeployOnBuild=true /p:Configuration=Release /p:PublishProfile=FolderProfile

rem doesnt work
rem "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\MSBuild\15.0\Bin\msbuild.exe" src/DotNet/DotNet.Jenkins/DotNet.Jenkins.csproj /p:DeployOnBuild=true /p:Platform=AnyCPU /p:Configuration=Release /p:PublishDestination=E:/published /t:PublishToFileSystem

("C:\\Windows\\System32\\inetsrv\\appcmd.exe" list apppool /apppool.name:"%2") | find /i "state:Started"
if not errorlevel 1 ("C:\\Windows\\System32\\inetsrv\\appcmd.exe" stop apppool /apppool.name:"%2")

if exist %1 (rmdir /s /q %1)

echo d | xcopy "src/DotNet/DotNet.Jenkins/bin/release/publish" %1 /s /e

"C:\\Windows\\System32\\inetsrv\\appcmd.exe" start apppool /apppool.name:"%2"
