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
    exit 0
fi

cd ${REPO}
${GITHUBCHART} -u ${USERNAME} ${IMAGES}/temp.svg

if cmp -s ${IMAGES}/temp.svg ${IMAGES}/contributions.svg; then
    rm ${IMAGES}/temp.svg
    exit 0
else
    mv ${IMAGES}/temp.svg ${IMAGES}/contributions.svg
fi

${GIT} add ${IMAGES}/contributions.svg
${GIT} commit -m "Automated githubchart commit on ${TIMESTAMP}"
${GIT} push -u origin master
