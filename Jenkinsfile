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
				bat '"./.jenkins/nuget.exe" restore src/DotNet/DotNet.Jenkins.sln'
				bat '"C:\\Program Files (x86)\\Microsoft Visual Studio\\2017\\Enterprise\\MSBuild\\15.0\\Bin\\msbuild.exe"  src/DotNet/DotNet.Jenkins.sln /p:Configuration=Release /p:Platform="Any CPU" '
			}
		}
		stage("UnitTesting")
		{
			steps
			{
				bat '"C:\\Program Files (x86)\\Microsoft Visual Studio\\2017\\Enterprise\\Common7\\IDE\\MSTEST.exe"  /testcontainer:src/DotNet/DotNet.Jenkins.Tests/DotNet.Jenkins.Tests/bin/DotNet.Jenkins.Tests.dll /resultsfile:dotnet.trx'
			}
		}
		stage("deploy")
		{
			steps
			{
			      bat '.jenkins/dotnetpublish.bat "E:\\websites\\deployed\\dotnet" Services'
            		}
		}
	}
}
