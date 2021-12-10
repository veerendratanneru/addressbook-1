pipeline{
    agent any
    tools{
        maven 'mymaven'
        jdk 'myjava'
    }
    stages{
        stage("Compile"){
            steps{
              script{
                 echo "Compiling the code"
                 sh 'mvn compile'
              }
            }
        }
        stage("test"){
             steps{
                script{
                  echo "Testing the code"
                  sh 'mvn test'
                  }
             }
             post{
                 always{
                     junit 'target/surefire-reports/*.xml'
                 }
             }
        }
        stage("Package"){
             steps{
                script{
                  echo "Packaging the code"
                  sh 'mvn package'
              }
             }
        }
        stage("Build the docker image"){
            steps{
                script{
                    echo "Building the docker image"
                    withCredentials([usernamePassword(credentialsId: 'docker-hub', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
            sh 'sudo docker build -t devopstrainer/java-mvn-privaterepos:$BUILD_NUMBER .'
            sh 'sudo docker login -u $USER -p $PASS'
            sh 'sudo docker push devopstrainer/java-mvn-privaterepos:$BUILD_NUMBER'

} 
                }
            }
        }
        stage("Deploy the docker container"){
            echo "deploying the app"
            sh 'sudo docker run -itd -P devopstrainer/java-mvn-privaterepos:$BUILD_NUMBER'
        }
    }
}