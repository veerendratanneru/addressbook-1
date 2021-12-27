pipeline {
    agent any
    stages {
        stage('Compile') {
            steps {
                script{
                    echo "Compiling the code"
                    echo "compileing the slave"
                    }
            }
        }
        stage('UnitTest') {
            steps {
                script{
                    echo "Running the test cases"
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
