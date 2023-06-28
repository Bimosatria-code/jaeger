pipeline {
    agent any


    parameters {
       choice(name: 'cluster', choices: ["prod", "nonprod"], description: 'Choice build to')
    }

    stages {
        stage('whitelist ip to bastion prod') {
            when {
                expression {
                    params.cluster == "prod"
                }
            }
            steps {      
                withAWS(credentials:'aws-credentials', region: 'ap-southeast-1') {
                    wrap([$class: 'BuildUser']) {
                        script{
                            sh '''
                            aws ec2 describe-security-groups \
                            --filters Name=ip-permission.from-port,Values=22 Name=group-name,Values=*bastion* \
                            --query "SecurityGroups[*].{Name:GroupName,ID:GroupId}" \
                            --output text
                            aws ec2 authorize-security-group-ingress --group-id <group id> --ip-permissions IpProtocol=tcp,FromPort=22,ToPort=22,IpRanges='[{CidrIp='${CIDR}/32',Description='${BUILD_USER_ID}'}]'
                            '''
                        }
                    }
                }
            }
        }

        stage('whitelist ip to bastion nonprod') {
            when {
                expression {
                    params.cluster == "nonprod"
                }
            }
            steps {      
                withAWS(credentials:'aws-credentials', region: 'ap-southeast-1') {
                    wrap([$class: 'BuildUser']) {
                        script{
                            sh '''
                            aws ec2 describe-security-groups \
                            --filters Name=ip-permission.from-port,Values=22 Name=group-name,Values=*bastion* \
                            --query "SecurityGroups[*].{Name:GroupName,ID:GroupId}" \
                            --output text
                            aws ec2 authorize-security-group-ingress --group-id <group id> --ip-permissions IpProtocol=tcp,FromPort=22,ToPort=22,IpRanges='[{CidrIp='${CIDR}/32',Description='${BUILD_USER_ID}'}]'
                            '''
                        }
                    }
                }
            }
        }
    }
}

