pipeline{
    agent any
    stages{
        stage("Compile"){
            steps{
              script{
                 echo "Compiling the code"
              }
            }
        }
        stage("test"){
             steps{
                script{
                  echo "Testing the code"
              }
             }
        }
        stage("Package"){
             steps{
                script{
                  echo "Packaging the code"
              }
             }
        }
    }
}