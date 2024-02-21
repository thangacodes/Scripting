def tfinit() {
    echo 'terraform init in progress...'
    sh '''
         pwd
         cd Iac_TF/ami_data/
         pwd
         ls -lrt
         terraform init
       '''      
} 
def tffmt() {
    echo 'terraform format in progress...'
    sh '''
         cd Iac_TF/ami_data/
         pwd
         terraform fmt
      '''
    
} 
def tfvalidate() {
    echo 'terraform validate in progress...'
    sh '''
          cd Iac_TF/ami_data/
          pwd
          terraform validate
      '''
       
} 
def tfplan() {
    echo 'terraform plan in progress...'
    sh '''
         cd Iac_TF/ami_data/
         pwd
         terraform plan
      '''
}
def tfapply() {
    echo 'terraform apply in progress...'
    sh '''
         cd Iac_TF/ami_data/
         pwd
         terraform apply --auto-approve
      '''
}
def tfdestroy() {
    echo 'terraform destroy in progress...'
    sh '''
         cd Iac_TF/ami_data/
         pwd
         terraform destroy --auto-approve
      '''
}

return this
