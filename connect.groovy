#!/bin/bash +x
node{
    def remote = [:]
    remote.name = ''
    remote.host = ''
    remote.port = 2200
    remote.user = ''
    remote.password = ''
    remote.allowAnyHosts = true
    def logFileName = 'testAKB.log'
    
    stage('Remote SSH') {
        echo "============= checking network logs - start ================================"
        sshCommand remote: remote, command: "ls > $logFileName"
        echo "============= checking network logs - end =================================="
    }
}
