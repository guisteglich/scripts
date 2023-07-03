#!/bin/sh

# Execute o comando `aws sts assume-role` e armazene a saída em variáveis
credentials=$(aws sts assume-role \
--role-arn arn:aws:iam::007741297163:role/systemTeamNprd \
--role-session-name TestSessionName \
--output json)

# Extraia as credenciais do JSON de saída e atribua aos valores correspondentes
AWS_ACCESS_KEY_ID=$(echo "$credentials" | jq -r '.Credentials.AccessKeyId')
AWS_SECRET_ACCESS_KEY=$(echo "$credentials" | jq -r '.Credentials.SecretAccessKey')
AWS_SESSION_TOKEN=$(echo "$credentials" | jq -r '.Credentials.SessionToken')

# Exporte as credenciais
export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY
export AWS_SESSION_TOKEN

# Solicitar valor para a variável task
read -p "Informe a task id do container que deseja acessar: " task

# Execute o comando desejado usando o valor da variável task
aws ecs execute-command --cluster vddb-ecs --task "$task" --container vddbweb --interactive --command "/bin/bash" --region sa-east-1
