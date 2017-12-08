#!/bin/bash

# Launches CLion inside a Docker container
IMAGE=${1:-clion_clion}

DOCKER_GROUP_ID=$(cut -d: -f3 < <(getent group docker))
USER_ID=$(id -u $(whoami))
GROUP_ID=$(id -g $(whoami))

# Need to give the container access to your windowing system
xhost +

CMD="docker run --group-add ${DOCKER_GROUP_ID} \
                --env HOME=/home/developer \
                --env DISPLAY=unix${DISPLAY} \
                --interactive \
                --name clion \
                --net "host" \
                --tty \
                --user=${USER_ID}:${GROUP_ID} \
                --volume $HOME:/home/powerless \
                --volume /tmp/.X11-unix:/tmp/.X11-unix \
                --volume /var/run/docker.sock:/var/run/docker.sock \
                --workdir /tmp \
                --volume $HOME/workspace/:/space \
                ${IMAGE}"

echo $CMD
$CMD
