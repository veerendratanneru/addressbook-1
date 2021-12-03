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
    }
}