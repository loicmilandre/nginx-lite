## nginx-lite created from Oracle Linux (9-slim) official image ##

1. Podman must be installed and the current user must be authorized for using Podman service.
2. Execute build.sh to build the images from internet sources and store new nginx-lite image in local repository.
3. Use export.sh & import.sh to push this image on another podman repository.
4. Execute the script ./run.sh

Note : The current local directory is mapped with /usr/share/nginx/html volume of container.
