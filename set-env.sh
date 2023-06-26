#!/bin/bash

function set_sit_environment() {
  export EKS_CLUSTER=$AWS_EKS_NONPROD_SIT
  export NAMESPACE="sit"
  export TAG=$TAG_SIT
  export VALUES="values-sit.yaml"
  export REPOSITORY_URL="${REPOSITORY}/${REPOSITORY_NAME}"
  export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID_NONPROD
  export AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION_NONPROD
  export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY_NONPROD
}

function set_staging_environment() {
  export EKS_CLUSTER=$AWS_EKS_NONPROD
  export NAMESPACE="staging"
  export TAG=$TAG_STAGING
  export VALUES="values-stg.yaml"
  export REPOSITORY_URL="${REPOSITORY}/${REPOSITORY_NAME}"
  export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID_NONPROD
  export AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION_NONPROD
  export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY_NONPROD
}

function set_migrate_environment() {
  export EKS_CLUSTER=$AWS_EKS_NONPROD
  export NAMESPACE="migrate"
  export TAG=$TAG_MIGRATE
  export VALUES="values-migrate.yaml"
  export REPOSITORY_URL="${REPOSITORY}/${REPOSITORY_NAME}"
  export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID_NONPROD
  export AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION_NONPROD
  export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY_NONPROD
}

function set_uat_environment() {
  export EKS_CLUSTER=$AWS_EKS_NONPROD
  export NAMESPACE="uat"
  export TAG=$TAG_UAT
  export VALUES="values-uat.yaml"
  export REPOSITORY_URL="${REPOSITORY}/${REPOSITORY_NAME}"
  export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID_NONPROD
  export AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION_NONPROD
  export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY_NONPROD
}

function set_production_environment() {
  export EKS_CLUSTER=$AWS_EKS_PROD
  export NAMESPACE=$NAMESPACE_PROD
  export TAG=$TAG_PROD
  export VALUES="values-prd.yaml"
  export REPOSITORY_URL="${REPOSITORY}/${REPOSITORY_NAME}"
  export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID_PROD
  export AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION_PROD
  export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY_PROD
}

function set_environment() {  
  case ${env} in
  sit)
    set_sit_environment
    ;;
  staging)
    set_staging_environment
    ;;
  migrate)
    set_migrate_environment
    ;;
  uat)
    set_uat_environment
    ;;
  prod)
    set_production_environment
    ;;
  *)
    echo "Environment ${env} not configured, please contact 0817-738-033"
    exit 1
    ;;
  esac
  echo "Configuring to ${NAMESPACE} environment"
}
