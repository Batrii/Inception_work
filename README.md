*This project has been created as part of the 42 curriculum by bnafiai*

# Description:

Inception is a project that aims to deploy a web application using Docker and Docker Compose. The project consists of several services, including a MariaDB database, an Nginx web server, and a WordPress application. The Makefile provided in the project allows for easy management of these services, including starting, stopping, building, and cleaning up the Docker containers. The docker-compose.yml file defines the configuration for each service, specifying how they should be built and run.

# Instructions:

1. Clone the repository to your local machine.
2. Navigate to the project directory.
3. Use the Makefile commands to manage the services:
   - `make up`: Start the services.
   - `make down`: Stop the services.
   - `make restart`: Restart the services.
   - `make logs`: View the logs of the services.
   - `make build`: Build the Docker images for the services.
   - `make ps`: View the status of the running containers.
   - `make clean`: Remove all unused Docker data.
   - `make remove`: Remove all data stored in the volumes in my host machine.
   - `make fclean`: Stop the services and remove all associated Docker images and volumes.
   - `make re`: Rebuild the images and restart the services.
4. Access the WordPress application by navigating to `https://bnafiai.42.fr` in your web browser.

# Resources:

## Useful resources for understanding the technologies used in this project:
- Docker: https://docs.docker.com/  https://www.geeksforgeeks.org/docker-tutorial/
- Docker Compose: https://docs.docker.com/compose/  https://www.geeksforgeeks.org/docker-compose-tutorial/
- Nginx: https://tuto.grademe.fr/inception/nginx/ https://dev.to/alejiri/docker-nginx-wordpress-mariadb-tutorial-inception42-1eok
- MariaDB: https://tuto.grademe.fr/inception/mariadb/ https://dev.to/alejiri/docker-nginx-wordpress-mariadb-tutorial-inception42-1eok
- WordPress: https://tuto.grademe.fr/inception/wordpress/ https://dev.to/alejiri/docker-nginx-wordpress-mariadb-tutorial-inception42-1eok
## AI USAGE:
- I used AI to help me understand the concepts of Docker, Compose, nginx, mariadb, and wordpress. after doing a self research on mutliple resources, but i needed some clarification on some concepts.
- For configuration files, to know which modifications need to be done, also which part in file affects which part of the project, and to understand the best practices for writing these files.
- For scripting, lunching mysql and worpress, and to understand the best practices for writing these scripts.
- For writing the documentation, to understand how to write a clear and concise documentation, and to know which information need to be included in the documentation, and how to structure the documentation.


# Project description:
- Why docker: Docker allows for easy deployment and management of applications in a consistent environment. It eliminates the "it works on my machine" problem by providing a containerized environment that can be easily replicated across different machines and platforms.
- Why docker compose: Docker Compose simplifies the process of managing multi-container applications. It allows you to define and run multiple containers with a single command, making it easier to orchestrate the different services.
- Virtual Machines vs Docker: Virtual machines run a full operating system and require more resources, while Docker containers share the host OS and are more lightweight. Docker provides faster startup times and better resource utilization compared to virtual machines.
- Secrets vs ENV variables: Secrets are used to store sensitive information such as passwords and API keys, while ENV variables are used to store configuration values that can be accessed by the application. Secrets are typically encrypted and stored securely, while ENV variables are stored in plain text and can be accessed by anyone with access to the container.
- Docker Network vs Host Network: Docker Network allows containers to communicate with each other using a virtual network, while Host Network allows containers to use the host's network stack directly. Docker Network provides better isolation and security, while Host Network can be useful for certain applications that require direct access to the host's network.
- Docker Volumes vs Bind Mounts: Docker Volumes are managed by Docker and provide a way to persist data outside of the container, while Bind Mounts allow you to mount a specific directory from the host into the container. Docker Volumes are more portable and easier to manage, while Bind Mounts can be useful for development purposes when you want to edit files on the host and see the changes reflected in the container.