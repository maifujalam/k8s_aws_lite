1. Update arogocd template
2. Push changes to git
3. Docs: https://kubedemy.io/jenkins-tutorial-part-10-work-with-git-in-pipeline
4. How to add jenkins credentials:-
    a. Create github personal access token with repo read,write on any branch
    b. Add jenkins credentials with type Username and password:-
       - ID: git-jenkins
       - username: ma**ja**m
       - password: <token_generated_above>
5. How to push to master:
   - checkout to master:
   - edit changes
   - add below code
           withCredentials([gitUsernamePassword(credentialsId: 'git-jenkins', gitToolName: 'Default')]) {
            sh '''
            git config --global user.email "sk.maifujalam@gmail.com"
            git config --global user.name "Jenkins"
            git add .
            git commit -m "Add testfile from Jenkins Pipeline"
            git push -u origin master
            '''
        }
6. 