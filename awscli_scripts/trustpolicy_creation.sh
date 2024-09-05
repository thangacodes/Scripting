#!/bin/bash
USERNAME="thangacodes"
REPO_NAME="GitHubActions-repo"
ACCOUNT_NUMBER="282526997315"
AUDIENCE="sts.amazonaws.com"
GIT_TOKEN="token.actions.githubusercontent.com"

cat <<EOF > trustpolicy.json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Federated": "arn:aws:iam::${ACCOUNT_NUMBER}:oidc-provider/${GIT_TOKEN}"
            },
            "Action": "sts:AssumeRoleWithWebIdentity",
            "Condition": {
                "StringEquals": {
                    "${GIT_TOKEN}:aud": "${AUDIENCE}",
                    "${GIT_TOKEN}:sub": "repo:${USERNAME}/${REPO_NAME}:ref:refs/heads/main"
                }
            }
        }
    ]
}
EOF
