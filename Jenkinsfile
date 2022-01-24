pipeline{
    agent any
    tools{
        jdk 'myjava'
        maven 'mymaven'
          }
    environment{
        NEW_VERSION='1.4.0'
        IMAGE = 'devopstrainer/java-mvn-privaterepos'
    }
    stages{
        stage("COMPILE"){
        steps{
                script{
                     echo "Compiling the code"
                     sh 'mvn compile'
                }
            }
                    }
        stage("UnitTest"){
          steps{
                script{
             echo "Run the unit test"
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
              echo "Building the app"
              echo "building version ${NEW_VERSION}"
              sh 'mvn package'
        }
              }
        }
    stage("Builddockerimage"){      
        steps{
            script{
                echo "Containerising the app"
               sh 'sudo yum install docker -y'
                sh 'sudo systemctl start docker'
               withCredentials([usernamePassword(credentialsId: 'docker-hub', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
                sh 'sudo docker build -t ${IMAGE}:$BUILD_NUMBER .'
                  sh 'sudo docker login -u $USERNAME -p $PASSWORD'
                 sh 'sudo docker push $IMAGE:$BUILD_NUMBER'
                }
            }
        }
    }
    stage("eks"){
         steps{
                script{
            echo "deploying the app"
            sh 'envsubst < java-mvn-app.yml | sudo /usr/local/bin/kubectl apply -f -'                  }
            }
    }
}

    }