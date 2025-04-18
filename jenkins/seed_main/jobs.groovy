// job.groovy - Job DSL script
pipelineJob('ci-pipeline') {
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url('https://github.com/maifujalam/k8s_aws_lite.git')
                    }
                    branch('main')
                }
                scriptPath('jenkins/ci/Jenkinsfile') // Path to your pipeline script
            }
        }
    }
}
