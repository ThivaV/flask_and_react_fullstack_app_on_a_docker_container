# Flask and ReAct fullstack app on single docker container

- Build docker image: `sudo docker build -t <IMAGE_NAME> .`
- Build a container from the built image: `sudo docker run -p 5001:5000 -p 3001:3000 <IMAGE_NAME>`

___

- Build an image: `sudo docker build -t <IMAGE_NAME> .`
- Build run a container with change detect: `sudo docker run -p 90:5000 -v $(pwd):/app <IMAGE_NAME>`
- Build run: `sudo docker run -d -p 3000:3000 -p 90:5000 <IMAGE_NAME>`
- Build run with bash into the container: `sudo docker run -it <IMAGE_NAME> bash`

___

- [Flask and ReAct fullstack app on multiple docker containers](https://github.com/ThivaV/flask_and_react_fullstack_app_on_multiple_docker_containers)