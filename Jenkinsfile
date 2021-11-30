pipeline{
    agent any
    tools{
        jdk 'myjava'
        maven 'mymaven'
    }
    environment{
        APP_NAME='java-mvn-app'
        ANSIBLE_SERVER="ec2-user@3.6.89.82"
    }
    parameters{
        choice(name:'VERSION',choices:['1.1.0','1.2.0','1.3.0'],description:'version of the code')
        booleanParam(name: 'executeTests',defaultValue: true,description:'tc validity')
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
        stage("UNITTEST"){           
            when{
                expression{
                    params.executeTests == true
                }
            }
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
         stage("PACKAGE"){
                     steps{
                script{
                    echo "Packaging the code"
                    sh 'mvn package'
                }
            }
        }
         stage("BUILD THE DOCKER IMAGE"){       
            steps{
                script{
                    echo "BUILDING THE DOCKER IMAGE"
                   sh 'sudo systemctl start docker'
                    withCredentials([usernamePassword(credentialsId: 'docker-hub', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                        
                        sh 'sudo docker build -t devopstrainer/java-mvn-privaterepos:$BUILD_NUMBER .'
                        sh 'sudo docker login -u $USER -p $PASS'
                        sh 'sudo docker push devopstrainer/java-mvn-privaterepos:$BUILD_NUMBER'
                }
            }
        }
         }
         stage("copy ansible files from jenkins server to ACM"){
             steps{
                 script{
                     echo "Copying ansible files from Jenkins server to ACM"

                     sshagent(['ansible-server-key']) {
                sh "scp ansible/* ${ANSIBLE_SERVER}:/home/ec2-user"
    withCredentials([sshUserPrivateKey(credentialsId: 'ansible-target-key',keyFileVariable: 'keyfile',usernameVariable: 'user')]){
                       sh 'scp $keyfile $ANSIBLE_SERVER:/home/ec2-user/.ssh/id_rsa'
                       }
}
                 }
             }
         }
    }
}