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
		stage("Test")
		{
			steps
			{
				bat 'dotnet test src/DotNetCore/DotNetCore.Jenkins.Tests/DotNetCore.Jenkins.Tests.csproj  --no-build --logger "trx;LogFileName=dotnetcore.trx"'
			}
		}
		stage("deploy")
		{
			steps
			{
			    echo "Good Job, Done!"
            }
		}
	}
}
