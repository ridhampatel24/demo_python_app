pipeline {
    agent any

    environment {
        EC2_HOST = readFile('/var/lib/jenkins/output.txt').trim().replaceAll('"', '')
        EC2_USER = 'ubuntu'
        PRIVATE_KEY = '/var/lib/jenkins/ridham.pem'
    }

    stages {

        stage('Checkout') {
            steps {
                script {
                    git branch: 'main', url: 'https://github.com/ridhampatel24/demo_python_app.git'//, credentialsId: 'github-id' 
                }
            }
        }

        stage('Install Python Requirements') {
            steps {
               script {
                   pip3 install -r requirements.txt --break-system-packages
                }
            }
        }

        // stage('Transfer Frotend to EC2') {
        //     steps {
        //         script {
        //             sh "rsync -avrx -e 'ssh -i ${PRIVATE_KEY} -o StrictHostKeyChecking=no' --delete /var/lib/jenkins/workspace/ridham-ec2.prod/public/build/ ${EC2_USER}@${EC2_HOST}:/var/www/html/chatapp"                  
        //         }
        //     }
        // }

        // stage('Read IP Address') {
        //     steps {
        //         script {
        //             // Print the IP address to the console
        //             echo "IP Address: ${ipAddress}"
        //             //echo "${EC2_HOST}"
                    
        //             // Optionally, set it as an environment variable if needed later
        //             env.TARGET_IP = ipAddress
        //         }
        //     }
        // }
    }
}