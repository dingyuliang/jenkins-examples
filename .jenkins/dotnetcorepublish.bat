dotnet publish src/DotNetCore/DotNetCore.Jenkins/DotNetCore.Jenkins.csproj -o bin/publish -c Release
"C:\\Windows\\System32\\inetsrv\\appcmd.exe" stop apppool /apppool.name:"Services"
rmdir /s /q %1
xcopy "src/DotNetCore/DotNetCore.Jenkins/bin/publish" %1 /s /e
"C:\\Windows\\System32\\inetsrv\\appcmd.exe" start apppool /apppool.name:"Services"
