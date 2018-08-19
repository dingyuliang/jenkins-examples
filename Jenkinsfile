pipeline 
{
	agent 
	{
		node 
		{
			label 'win'
                        //  solve the long file path in windows environment
			customWorkspace "ws\\${JOB_NAME.replace("%2F", "_")}\\${BUILD_NUMBER}"
	    	}
	}
	stages 
	{
		stage("Checkout")
        	{
			steps
            		{
				checkout scm
			}
		}
		stage("Build")
        	{
			steps
            		{
				bat 'dotnet restore src/DotNetCore/DotNetCore.Jenkins.sln'
				bat 'dotnet build  src/DotNetCore/DotNetCore.Jenkins.sln /p:Configuration=Release /p:Platform="Any CPU" '
			}
		}
		stage("UnitTesting")
		{
			steps
			{
				bat 'dotnet test src/DotNetCore/DotNetCore.Jenkins.Tests/DotNetCore.Jenkins.Tests.csproj --logger "trx;LogFileName=dotnetcore.trx"'
			}
		}
		stage("deploy")
		{
			steps
			{
			      bat 'dotnet publish src/DotNetCore/DotNetCore.Jenkins/DotNetCore.Jenkins.csproj -o src/DotNetCore/DotNetCore.Jenkins/bin/publish'
			      bat 'rmdir /s /q "E:/websites/deployed/dotnetcore"'
			      bat 'mkdir "E:/websites/deployed/dotnetcore"'
			      bat 'xcopy "src/DotNetCore/DotNetCore.Jenkins/bin/publish/" "E:/websites/deployed/dotnetcore/" /s /e'
            		}
		}
	}
}
