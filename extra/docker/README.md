How to use this Docker file
---------------------------------

the main requirement that you have docker installed on your machine.

Run the container
-----------------------
Making plugins persist between sessions
================================

Eclipse plugins are kept on $HOME/.eclipse inside the container, so if you want to keep them around after you close it, you'll need to share it with your host.

For example:

``mkdir -p .eclipse-docker``

Run the container
===============
To run the container, just use this command line to download and run the factory. Adjust the workspace directory in order to share your workspace beetween the host and the container

``docker run -ti --rm \
           -e DISPLAY=$DISPLAY \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           -v `pwd`/.eclipse-docker:/home/developer \
           -v `pwd`:/workspace \
     fiware/docker-trustworthyfactory``

When the factory is launch, select the workspace path "/home/developer/workspace" 
