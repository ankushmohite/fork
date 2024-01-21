pipeline {
    agent {
        node {
            label "built-in"
            customWorkspace "/mnt/ankush"
        }
    }
    
    stages {
        stage("Set up tools") {
            steps {
                script {
                    // Use the 'tool' step to define tools within a 'node' block
                    tool "maven-3.9.6"
                }
            }
        }

        stage("git") {
            steps {
                git credentialsId: 'git-token', url: 'https://github.com/ankushmohite/fork.git'
            }
        }
        stage("build") {
            steps {
                sh "mvn clean install"
            }
        }
        stage("build image") {
            steps {
                sh "docker build -t ankushmohite/loginapps ."
            }
        }
        stage('Push image to hub'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'dockerpwd', variable: 'dockerhubpwd')]) {
                    sh 'docker login -u ankushmohite -p ${dockerhubpwd}'
                        
                    }
                    sh 'docker push ankushmohite/loginapps'
                    
                }
            } 
            
        } 
        stage("deploy to K8S") {
            steps{
                withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'kubernetes-token', namespace: 'jenkins', restrictKubeConfigAccess: false, serverUrl: 'https://172.31.34.106:6443') {
                sh "kubectl apply -f /mnt/ankush/deploymentservice.yaml -n jenkins"
                
                

                }
                    
                
                
            }
        }
        
    }

}  
