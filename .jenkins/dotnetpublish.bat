"C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\MSBuild\15.0\Bin\msbuild.exe" src/DotNet/DotNet.Jenkins/DotNet.Jenkins.csproj /p:DeployOnBuild=true /p:Configuration=Release /p:PublishProfile=FolderProfile
"C:\\Windows\\System32\\inetsrv\\appcmd.exe" stop apppool /apppool.name:"%2"
rmdir /s /q %1
xcopy "src/DotNet/DotNet.Jenkins/bin/release/publish/" %1 /s /e
"C:\\Windows\\System32\\inetsrv\\appcmd.exe" start apppool /apppool.name:"%2"
