<!-- vi .bashrc
source .bashrc -->

<!-- k8s command -->
alias kb='kubectl'
alias kbd='kubectl describe'

function __kbset {                                                                
   kubectl config set-context --current  --namespace="$1"                                                                
} 
alias kbset='__kbset' 