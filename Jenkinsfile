// pipeline {
//     agent any
    
//     stages{
//         stage("Code"){
//             steps{
//                 git url: "https://github.com/LondheShubham153/two-tier-flask-app.git", branch: "jenkins"
//             }
//         }
//         stage("Build & Test"){
//             steps{
//                 sh "docker build . -t flaskapp"
//             }
//         }
//         stage("Push to DockerHub"){
//             steps{
//                 withCredentials([usernamePassword(credentialsId:"dockerHub",passwordVariable:"dockerHubPass",usernameVariable:"dockerHubUser")]){
//                     sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
//                     sh "docker tag flaskapp ${env.dockerHubUser}/flaskapp:latest"
//                     sh "docker push ${env.dockerHubUser}/flaskapp:latest" 
//                 }
//             }
//         }
//         stage("Deploy"){
//             steps{
//                 sh "docker-compose down && docker-compose up -d"
//             }
//         }
//     }
// }


@Library("shared") _
pipeline{
    
    agent {label "client2"}
    stages{
        stage("Code"){
            steps{
            script
            {
                 gitclone('https://github.com/AsifKamalHm/two-tier-flask-app.git', 'master')

            }
            }
        }
         stage("Build"){
            steps{
                script{
                      docker_build("two-tier-flask-app","v2","asif21gm")           
                }
            }
        }

        stage("push on Dockerhub"){
            steps{
                echo "push on docker hub--------------------------------------------------------"
                // script{
                //     cred("two-tier-flask-app","v2","asif21gm")           

                // }
            }
        }
         stage("Deploy"){
            steps{
                echo "Deploy"
                // sh "docker run -d --name mysql -v mysql-data:/var/lib/mysql --network=twotier -e MYSQL_DATABASE=mydb -e MYSQL_ROOT_PASSWORD=admin -p 3306:3306 mysql:8.0"
                // sh "sleep 30"
                // sh "docker run -d --name flaskapp  --network=twotier  -e MYSQL_HOST=mysql  -e MYSQL_USER=root  -e MYSQL_PASSWORD=admin  -e MYSQL_DB=mydb  -p 5000:5000  asif21gm/two-tier-flask-app:latest"
                // sh "docker-compose up -d"
            }
            
        }
    }
}
