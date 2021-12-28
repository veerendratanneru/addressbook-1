pipeline {
    agent none
    tools{
        jdk 'myjava'
        maven 'mymaven'
    }
    stages {
        stage('Compile') {
            agent any
            steps {
                script{
                    echo "Compiling the code"
                    git 'https://github.com/preethid/addressbook-1.git'
                    sh 'mvn compile'
                  }
            }
        }
        stage('UnitTest') {
            agent {label 'linux_slave'}
            steps {
                script{
                    echo "Running the test cases"
                    sh 'mvn test'
                }
            }
        }
        stage('Package') {
            agent any
            steps {
                script{
                    echo "Packaging the code"
                    sh 'mvn package'
                    }
            }
        }
        stage('Deploy') {
            agent any
           steps {
                script{
                    echo "Deploying the app"
                  }
            }
        }
    }
}