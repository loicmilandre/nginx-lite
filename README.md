cicd-toolbox created from python-alpine3.17
Podman must be installed and the current user must be authorized for using Podman service.
Execute build.sh to build the images from internet sources and store new cicd-toolbox image in local repository.
Use export.sh & import.sh to push this image on another podman repository.
Execute the script ./run.sh
Note : The current local directory is mapped with /etc/cicd-toolbox volume of container.
