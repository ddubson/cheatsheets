---
title: "Bash shell"
date: 2020-07-29T11:22:32-04:00
anchor: "bash-shell"
draft: false
---

List all processes bound to a specific port

```bash
lsof -i:8080
```

Kill or terminate a process by the port it's bound on

```bash
# Kill
lsof -ti tcp:<port> | xargs kill -SIGKILL

# Terminate
lsof -ti tcp:<port> | xargs kill -SIGTERM
```

Wait for a process to start and bind to port

```bash
export SERVER_PORT=8080
mvn spring-boot:run -Dserver.port=${SERVER_PORT} &
while ! echo exit | nc localhost ${SERVER_PORT}; do sleep 4; done
```
