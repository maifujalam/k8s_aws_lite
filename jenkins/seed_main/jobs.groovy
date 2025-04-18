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
pipelineJob('cd-pipeline') {
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url('https://github.com/maifujalam/k8s_aws_lite.git')
                    }
                    branch('main')
                }
                scriptPath('jenkins/cd/Jenkinsfile') // Path to your pipeline script
            }
        }
    }
}
pipelineJob('evicted-pod-cleaner.build') {
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url('https://github.com/maifujalam/k8s_aws_lite.git')
                    }
                    branch('main')
                }
                scriptPath('app-build-pipeline/evicted-pod-cleaner/Jenkinsfile') // Path to your pipeline script
            }
        }
    }
}
pipelineJob('jnlp-agent.build') {
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url('https://github.com/maifujalam/k8s_aws_lite.git')
                    }
                    branch('main')
                }
                scriptPath('app-build-pipeline/jnlp-agent/Jenkinsfile') // Path to your pipeline script
            }
        }
    }
}
