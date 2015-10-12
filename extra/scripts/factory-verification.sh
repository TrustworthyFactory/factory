# open SSH connection with export display on the VM
ssh -X 

# run the eclipse using the workspace /home/developer/workspace
mkdir -p .eclipse-docker
docker run -ti --rm \
           -e DISPLAY=$DISPLAY \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           -v `pwd`/.eclipse-docker:/home/developer \
           -v `pwd`:/workspace \
     fiware/docker-trustworthyfactory