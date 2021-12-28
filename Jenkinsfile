pipeline {
    agent any
    tools{
        jdk 'myjava'
        maven 'mymaven'
    }
    stages {
        stage('Compile') {
            steps {
                script{
                    echo "Compiling the code"
                    git 'https://github.com/preethid/addressbook-1.git'
                    sh 'mvn compile'
                  }
            }
        }
        stage('UnitTest') {
            steps {
                script{
                    echo "Running the test cases"
                    sh 'mvn test'
                }
            }
        }
        stage('Package') {
            steps {
                script{
                    echo "Packaging the code"
                    sh 'mvn package'
                    }
            }
        }
        stage('Deploy') {
           steps {
                script{
                    echo "Deploying the app"
                  }
            }
        }
    }
}