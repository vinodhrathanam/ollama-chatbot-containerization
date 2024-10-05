# ollama-chatbot-containerization

This project provides a Docker setup for deploying the Ollama AI model and an accompanying Open Web UI. The setup allows for easy management and access to the Ollama API, leveraging Docker and Docker Compose for orchestration.

## Prerequisites

Before you begin, ensure you have the following installed:

- [Docker](https://www.docker.com/get-started) 
- [Docker Compose](https://docs.docker.com/compose/install/)

## Getting Started

### Starting Docker Daemon

Before running the Docker containers, make sure the Docker daemon is up and running. You can start the Docker daemon with the following command:

```bash
sudo service docker start
```
### Build and Run the Docker Image
1. Change Directory: Navigate to the ollama-chatbot-containerization project directory:
```bash
cd /path/to/your/ollama-chatbot-containerization
```
2. Build the Docker Image: Run the following command to build the Docker image:
```
docker build -t ollama-webui:latest .
```
3. Run the Docker Container: Use the following command to run the Docker container with privileged access:
```
docker run -d --privileged -v /var/run/docker.sock:/var/run/docker.sock ollama-webui:latest
```
### Accessing the Application
Ollama API: http://localhost:11434/api/chat 

Open Web UI: http://localhost:3000

### Pulling the Ollama Model
After starting the containers, you may need to pull the desired Ollama model. You can do this by executing:
```
docker exec ollama ollama pull <model_name>
```
Replace <model_name> with the desired model name (e.g., llama3.2). Current model in the file using 'llama3'.

### Stopping the Containers
To stop and remove the containers, run:
```
docker-compose down
```
### Troubleshooting
If you encounter issues, check the logs for the Ollama container using:
```
docker logs ollama
```
