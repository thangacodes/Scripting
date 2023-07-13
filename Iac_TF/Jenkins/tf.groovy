def tfinit() {
    echo 'terraform init in progress...'
    sh '''
         pwd
         cd ../ami_data/
         pwd
         ls -lrt
         terraform init
       '''      
} 
def tffmt() {
    echo 'terraform format in progress...'
    sh '''
         cd ../ami_data/
         pwd
         terraform fmt
      '''
    
} 
def tfvalidate() {
    echo 'terraform validate in progress...'
    sh '''
          cd ../ami_data/
          pwd
          terraform validate
      '''
       
} 
def tfplan() {
    echo 'terraform plan in progress...'
    sh '''
         cd ../ami_data/
         pwd
         terraform plan
      '''
} 
return this
