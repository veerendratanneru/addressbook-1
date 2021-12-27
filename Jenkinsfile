pipeline {
    agent any
    stages {
        stage('Compile') {
            steps {
                script{
                    echo "Compiling the code"
                    }
            }
        }
        stage('UnitTest') {
            steps {
                script{
                    echo "Runninh the test cases"
                }
            }
        }
        stage('Package') {
            steps {
                script{
                    echo "Packaging thr code"
                }
            }
        }
    }
}
