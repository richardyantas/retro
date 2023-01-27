pipeline {
    agent any
    options {disableConcurrentBuilds()}
    environment {
        GOOGLE_PROJECT = "tenpo"
        GOOGLE_PROJECT_ID = "jovial-atlas-375801" 
        GOOGLE_PROJECT_NAME = "tenpo"
        GOOGLE_APPLICATION_CREDENTIALS = credentials('sc_jenkins_terraform_test2')
        GOOGLE_CLOUD_KEYFILE_JSON = credentials('sc_jenkins_terraform_test2')
    }
    parameters { 
      choice(name: 'ENTORNOS', choices: ['dev', 'pre', 'pro'], description: 'Seleccione el entorno a utilizar')
      choice(name: 'ACCION', choices: ['', 'plan-apply', 'destroy'], description: 'Seleccione el entorno a utilizar')
    }
    stages{
        
        stage('clean workspaces -----------') { 
            steps {
              cleanWs()
              sh 'env'
            } //steps
        }  //stage

        //${params.Acción}
        stage("git clone code terraform"){
            steps {
                cleanWs()
                    checkout([$class: 'GitSCM', 
                    branches: [[name: '*/main']], 
                    doGenerateSubmoduleConfigurations: false, 
                    extensions: [[$class: 'CleanCheckout']], 
                    submoduleCfg: [], 
                    userRemoteConfigs: [
                        [url: 'https://github.com/richardyantas/tenpo.git', credentialsId: '']
                        ]])
                sh 'pwd' 
                sh 'ls -l'
            } //steps
        }  //stage
    
        stage('Terraform init----') {
         steps {
            sh 'terraform --version'            
            sh 'terraform init '
            } //steps
        }  //stage

        stage('Terraform plan----') {
            steps {               
               sh 'terraform plan  -refresh=true -lock=false'
            } //steps
        }  //stage
        
        stage('Confirmación de accion') {
            steps {
                script {
                    def userInput = input(id: 'confirm', message: params.ACCION + '?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
                }
            }
        }
        
        stage('Terraform apply or destroy ----------------') {
            steps {
               sh 'echo "comienza"'
            script{  
                if (params.ACCION == "destroy"){
                         sh ' echo "llego" + params.ACCION'   
                         sh 'terraform destroy -auto-approve'
                } else {
                         sh ' echo  "llego" + params.ACCION'                 
                         sh 'terraform apply -refresh=true  -auto-approve'  
                }  // if

            }
            } //steps
        }  //stage


        // stage('Deploy') {
        //     // Connect to the VM and clone repository and run app.py
        // }

   }  // stages
} //pipeline