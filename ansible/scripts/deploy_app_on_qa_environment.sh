PATH="$PATH:/usr/local/bin"
APP_NAME="petclinic"
envsubst < k8s/qa/kustomization-template.yml > k8s/qa/kustomization.yml
envsubst < ansible/playbooks/qa-petclinic-deploy-template > ansible/playbooks/qa-petclinic-deploy.yaml
ansible-playbook -i ${WORKSPACE}/ansible/inventory/qa_stack_dynamic_inventory_aws_ec2.yaml ${WORKSPACE}/ansible/playbooks/qa-petclinic-deploy.yaml