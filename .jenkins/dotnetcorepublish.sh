dotnet publish ../src/DotNetCore/DotNetCore.Jenkins/DotNetCore.Jenkins.csproj -o bin/publish
rmdir /s /q "E:/websites/deployed/dotnetcore"
mkdir "E:/websites/deployed/dotnetcore"
xcopy "../src/DotNetCore/DotNetCore.Jenkins/bin/publish" "E:/websites/deployed/dotnetcore" /s /e
