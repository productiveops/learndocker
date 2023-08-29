# LearnDocker

LearnDocker can be used to provide practical training on Linux, Docker and Kubernetes. It creates a Docker in Docker (DIND) container
and provides a shell to the container in the browser. The container has Docker and K3S installed.

*Note*: The project is in active development.

![Screenshot](https://raw.githubusercontent.com/ProductiveOps/learndocker/main/images/screenshot.gif)

## How to build and run

    docker build . -t productiveops/learndocker
    docker run --privileged -p 8080:8080 -v learndocker-overlay:/var/lib/docker/overlay2 -v learndocker-images:/var/lib/docker/image --name learndocker productiveops/learndocker

*Note*: This is meant to be run on your local system for education purpose. The container is run with --privileged flag so avoid running it on servers.

## Accessing the UI

After you run the container open http://localhost:8080 in your browser.

## License 

The MIT License