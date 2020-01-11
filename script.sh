#!/bin/sh

USER='akira'
USERNAME='daniel-gonzalez-cedre'
REPO='/Users/'${USER}'/repos/'${USERNAME}'.github.io'
IMAGES=${REPO}'/images'
TIMESTAMP=`date +'%Y-%m-%d %H:%M:%S %Z'`

GIT=`which git`
GITHUBCHART=`which githubchart`

# only proceed if we have a valid repo
if [ ! -d ${REPO}/.git ]; then
    echo "failed"
    exit 0
else
    echo "success"
fi

cd ${REPO}
${GITHUBCHART} -u ${USERNAME} ${IMAGES}/contributions.svg
${GIT} add ${IMAGES}/contributions.svg
${GIT} commit -m "Automated githubchart commit on ${TIMESTAMP}"
${GIT} push -u origin master
