dotnet publish src/DotNetCore/DotNetCore.Jenkins/DotNetCore.Jenkins.csproj -o bin/publish
rmdir /s /q "%1"
xcopy "src/DotNetCore/DotNetCore.Jenkins/bin/publish" "%1" /s /e
