pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                //SCM--TEST
                echo 'Checking out code from GitHub...'
            }
        }

        stage('Deploy to Web Server') {
            steps {
                // CP html -> Apache on Kali
                echo 'Deploying index.html to /var/www/html/...'
                sh 'cp index.html /var/www/html/index.html'
            }
        }
    }
}
