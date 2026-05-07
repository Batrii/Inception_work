# USER DOCUMENTATION

# Inception Stack — User Guide

## Overview

This project provides a Docker-based infrastructure composed of three main services:

| Service | Purpose |
|---|---|
| NGINX | Reverse proxy and HTTPS web server |
| WordPress | Website application running with PHP-FPM |
| MariaDB | Database service used by WordPress |

Each service runs inside its own Docker container and communicates through a private Docker network.

---

# Starting the Project

## Build and Start Containers

Run:

```bash
make
```

## Stop Containers 
Stop:

```bash
make down
```
## Access to website

Open your browser and visit:

```
https://bnafiai.42.fr
```

access to admin panel:

```
https://bnafiai.42.fr/wp-admin
```

## Locate and manage credentials

Credentials for the database and WordPress admin are stored in the `.env` file. You can edit this file to change the default credentials.

## Check that services are running

To check the status of the running containers, use:

```bash
make ps
```