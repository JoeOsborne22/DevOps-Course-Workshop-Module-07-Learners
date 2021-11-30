pipeline {
    agent none

    stages {
	stage('C# Build + Test') {
            agent { 
	        docker {image 'mcr.microsoft.com/dotnet/sdk:5.0' }
	    }
	    steps {
                echo 'Building dotnet'
		sh 'dotnet build'
		echo 'Testing dotnet'
		sh 'dotnet test'

            }
        }
        stage('TypeScript Build + Test') {
	    agent {
                docker {image 'node:17-alpine' }
	    }
	    environment {
	        DOTNET_CLI_HOME = "/tmp/DOTNET_CLI_HOME"
	   }
            steps {
	        dir ('DotnetTemplate.Web'){
                    echo 'Install NPM'
		    sh 'npm ci'
	 	    echo 'NPM Build TypeScript'
                    sh 'npm run build'
		    echo 'Run Linter'
		    sh 'npm run lint'
		    echo 'Run TypeScript Tests'
		    sh 'npm t'
		}
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
