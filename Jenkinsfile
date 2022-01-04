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
            agent any
            steps {
                script{
                    echo "Running the test cases"
                    git 'https://github.com/preethid/addressbook-1.git'
                    sh 'mvn test'
                }
            }
            post{
                always{
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('PACKAGE N BUild DOCKER IMAGE') {
            agent any
           steps {
                script{                   
                    sshagent(['build-server-key']) {
withCredentials([usernamePassword(credentialsId: 'docker-hub', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
    
echo "Packaging the code"
sh "scp -o StrictHostKeyChecking=no server-script.sh ec2-user@172.31.47.225:/home/ec2-user"
sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.47.225 'bash ~/server-script.sh'"
sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.47.225 sudo docker build -t devopstrainer/java-mvn-privaterepos:$BUILD_NUMBER /home/ec2-user/addressbook-1"
sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.47.225 sudo docker login -u $USERNAME -p $PASSWORD"
sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.47.225 sudo docker push devopstrainer/java-mvn-privaterepos:$BUILD_NUMBER"
  }
                  }
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