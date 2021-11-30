pipeline {
    agent any


    stages {
        stage('Checkout') {
	    steps {
	        echo 'Checkout Code..'
		checkout scm
	    }
	}
	stage('C# Build + Test') {
            steps {
                echo 'Building dotnet'
		sh 'dotnet build'
		echo 'Testing dotnet'
		sh 'dotnet test'

            }
        }
        stage('TypeScript Build + Test') {
	    dir { ./DotnetTemplate.Web }
            steps {
                echo 'Install NPM'
		sh 'npm ci'
		echo 'NPM Build TypeScript'
                sh 'npm run build'
		echo 'Run Linter'
		sh 'npm run lint'
		echo 'Run TypeScript Tests'
		sh ' npm t'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
