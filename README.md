# devops-netologyfirst line
**/.terraform/* - будут проигнорированы все файлы в папке .terraform вне зависимости от родительских каталогов.
*.tfstate - будут проигнорированы все файлы с расширением tfstate 
*.tfstate.* - будут проигнорированы все файлы расширения которых содержат .tfstate.
crash.log - файл crash.log будет проигнорирован
*.tfvars - будут проигнорированы все файлы с расширением .tfvars
override.tf - файл override.tf будет проигнорирован
override.tf.json - файл override.tf.json будет проигнорирован
*_override.tf - будут проигнорированы все файлы заканчивающиеся на _override.tf
*_override.tf.json - будут проигнорированы все файлы заканчивающиеся на _override.tf.json
.terraformrc - будут проигнорированы все файлы с расширением .terraformrc
terraform.rc - файл terraform.rc будет проигнорирован
