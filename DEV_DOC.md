# DEVELOPER DOCUMENTATION

# Inception Stack — Developer Guide

## Overview

This document explains how to:
- set up the development environment
- configure the infrastructure
- build and launch containers
- manage Docker resources
- understand data persistence

The project uses:
- Docker
- Docker Compose
- Makefile automation

Main services:
- NGINX
- WordPress (PHP-FPM)
- MariaDB

---

# Prerequisites

Before starting, install:

| Tool | Purpose |
|---|---|
| Docker | Container runtime |
| Docker Compose | Multi-container orchestration |
| Make | Project automation |

---

# Set up the environment

1. Clone the repository:

```bash
git clone
```
2. Navigate to the project directory:

```bash
cd inception
```
3. Create a `.env` file:

example of .env file:
```
# Database credentials
MYSQL_DATABASE=wordpress
MYSQL_USER=XXXX
MYSQL_PASSWORD=XXXX
MYSQL_ROOT_PASSWORD=XXXX

DOMAIN_NAME=bnafiai.42.fr

# Wordpress credentials
WORDPRESS_ADMIN_USER=XX
WORDPRESS_ADMIN_PASSWORD=XXX
WORDPRESS_ADMIN_EMAIL=XXXXXX

WORDPRESS_USER_USER=XXX
WORDPRESS_USER_PASSWORD=XXXXX
WORDPRESS_USER_EMAIL=XXXX
```

# Build and start the containers:

```bash
make
```
- using docker compose directly:

```bash
docker compose up --build -d
```
# Useful commands:
- Stop containers:

```bash
make down
```
- Check running containers:
```bash
make ps
```
- View logs:
```bash
make logs
```
- Clean up unused resources:
```bash
make clean
```
- Remove volumes:
```bash
make remove
```
- Full cleanup:
```bash
make fclean
```
- Rebuild and restart:
```bash
make re
```
# The data storage:

## Where Data Is Stored

The project uses Docker volumes with bind mounts to persist data directly on the host machine.

Data is stored in:

```text id="9b0svh"
/home/bnafiai/data/
```