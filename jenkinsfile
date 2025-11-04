pipeline {
  agent any

  environment {
    IMAGE = "kushall1845/wisecow"
    AWS_REGION = "us-east-2"
    CLUSTER_NAME = "kushal_01-cluster"
    AWS_PROFILE = "eks-profile"
  }

  stages {
    stage('Checkout') {
      steps {
        git 'https://github.com/kushall1845/Accuknox-wisecow-project.git'
      }
    }

    stage('Set Dynamic Tag') {
      steps {
        script {
          def timestamp = new Date().format('yyyyMMdd-HHmm')
          env.TAG = "v${env.BUILD_ID}-${timestamp}"
        }
      }
    }

    stage('Build Docker Image') {
      steps {
        sh "docker build -t $IMAGE:$TAG ."            
      }
    }

    stage('Push to Docker Hub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
          sh '''
            echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
            docker tag $IMAGE:$TAG $DOCKER_USER/wisecow:$TAG
            docker push $DOCKER_USER/wisecow:$TAG
          '''
        }
      }
    }

    stage('Update Deployment YAML') {
      steps {
        sh "sed -i 's|image:.*|image: $IMAGE:$TAG|' k8s_files/01-deployment.yaml"
      }
    }

    stage('Configure EKS Access') {
      steps {
        withCredentials([[
          $class: 'AmazonWebServicesCredentialsBinding',
          credentialsId: 'aws-creds'
        ]]) {
          sh '''
            aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID --profile $AWS_PROFILE
            aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY --profile $AWS_PROFILE
            aws configure set region $AWS_REGION --profile $AWS_PROFILE

            aws eks --region $AWS_REGION update-kubeconfig --name $CLUSTER_NAME --profile $AWS_PROFILE
          '''
        }
      }
    }

    stage('Run Deployment Script') {
  steps {
    script {
      def setupFile = "${env.WORKSPACE}/.setup_done"
      if (!fileExists(setupFile)) {
        sh '''
          
          chmod +x script.sh
          ./script.sh
        '''
        writeFile file: '.setup_done', text: 'true'
      } else {
        sh '''
          
          kubectl apply -f k8s_files/01-deployment.yaml
        '''
      }
    }
  }
}

    
  }
}