dotnet publish src/DotNetCore/DotNetCore.Jenkins/DotNetCore.Jenkins.csproj -o bin/publish -c Release

("C:\\Windows\\System32\\inetsrv\\appcmd.exe" list apppool /apppool.name:"%2") | find /i "state:Started"
if not errorlevel 1 ("C:\\Windows\\System32\\inetsrv\\appcmd.exe" stop apppool /apppool.name:"%2")

if exist %1 (rmdir /s /q %1)

echo d | xcopy "src/DotNetCore/DotNetCore.Jenkins/bin/publish" %1 /s /e

"C:\\Windows\\System32\\inetsrv\\appcmd.exe" start apppool /apppool.name:"%2"
