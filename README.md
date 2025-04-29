# 🐳 Appium Docker Runner

Easily run an Appium server inside a Docker container with Android SDK support.  
Perfect for mobile test automation and ready for CI/CD pipelines.

---

## 🚀 Features

- ✅ Ubuntu 22.04 base image  
- ✅ Installs Node.js 18+ and Appium 2.18.0  
- ✅ Includes Android SDK (command line tools)  
- ✅ Writes logs to `../logs/appium-server.log`  
- ✅ Runs using `docker-compose` or `docker build` + `docker run`  

---

## ⚙️ Usage with Docker Compose

### 🏗 1. Build & Start the Container

```bash
docker-compose build
docker-compose up -d
curl http://localhost:4723/status

{
  "value": {
    "ready": true,
    "message": "The server is ready to accept new connections",
    "build": {
      "version": "2.18.0"
    }
  }
}
