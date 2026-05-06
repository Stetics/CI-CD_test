//STAGE 1: INITIAL TEST
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

//STAGE 2: linter test
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



//STAGE 3: DOCKER TEST
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Скачиваем код...'
                checkout scm
            }
        }

        stage('Security Scan') {
            steps {
                echo 'Проверяем HTML...'
                sh 'tidy -e index.html || true'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Собираем Docker-образ...'
                // Флаг -t задает имя образа
                sh 'docker build -t my-docker-website:latest .'
            }
        }

        stage('Deploy Container') {
            steps {
                echo 'Запускаем контейнер...'
                // Сначала удаляем старый контейнер, если он есть (чтобы не было конфликта имен)
                sh 'docker rm -f my-running-site || true'
                
                // Запускаем новый контейнер. 
                // -p 8081:80 означает "пробрось порт 8081 с Kali на порт 80 внутри контейнера"
                sh 'docker run -d -p 8081:80 --name my-running-site my-docker-website:latest'
            }
        }
    }
}
