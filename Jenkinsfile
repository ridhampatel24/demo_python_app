pipeline {
    agent any

    environment {
        EC2_HOST = readFile('/var/lib/jenkins/output.txt').trim().replaceAll('"', '')
        EC2_USER = 'ubuntu'
        PRIVATE_KEY = '/var/lib/jenkins/ridham.pem'
    }

    stages {

        stage('Fetch Changes and Deploy to Server') {
            steps {
                script {
                    def commands = """
                        cd /home/ubuntu/demo_python_app
                        sudo netstat -tulnp | grep :5000
                        cd ~
                        sudo rm -rf demo_python_app
                        git clone https://github.com/ridhampatel24/demo_python_app.git
                        cd /home/ubuntu/demo_python_app
                        pip3 install -r requirements.txt --break-system-packages
                        setsid python3 -u app.py &
                        sleep 5
                    """
                    
                    sshagent(['ec2-python']) {
                        sh "ssh -o StrictHostKeyChecking=no -i ${PRIVATE_KEY} ${EC2_USER}@${EC2_HOST} '${commands}'"
                    }
                }
            }
        }

    }
}