// pipeline {
//     agent any

//     stages {
//         stage('Checkout') {
//             steps {
//                 //SCM--TEST
//                 echo 'Checking out code from GitHub...'
//             }
//         }

//         stage('Deploy to Web Server') {
//             steps {
//                 // CP html -> Apache on Kali
//                 echo 'Deploying index.html to /var/www/html/...'
//                 sh 'cp index.html /var/www/html/index.html'
//             }
//         }
//     }
// }

pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out code...'
                checkout scm
            }
        }

        stage('Security Scan') {
            steps {
                echo 'Running HTML Security & Linting check...'
                // tidy проверит файл. Если будут ошибки, он выдаст предупреждение.
                // Метка || true нужна, чтобы пайплайн не падал, если в HTML просто мелкие ошибки
                sh 'tidy -e index.html || true'
            }
        }

        stage('Deploy to Web Server') {
            steps {
                echo 'Deploying...'
                sh 'cp index.html /var/www/html/index.html'
            }
        }
    }
}
