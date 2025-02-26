# SaltStack Mini Docker Lab
This project demonstrates how to use SaltStack for configuration management and orchestration in a containerized environment. It sets up a Salt Master and two Salt Minions using Docker Compose, allowing you to experiment with Salt states, pillars, and remote execution in an isolated environment.


## Project Overview
This project uses Docker Compose to create a SaltStack environment with:

1. Salt Master: The central server that manages the minions.

2. Salt Minions: The client machines that are managed by the master.

The project includes example Salt states and pillars to install and manage Nginx on the minions. It’s a great way to learn SaltStack and showcase your skills in infrastructure automation.

## Features
* **Containerized Environment**: Uses Docker Compose for easy setup and teardown.

* **SaltStack Basics**: Demonstrates Salt states, pillars, and remote execution.

* **Nginx Example**: Includes a sample state to install and configure Nginx on minions.

* **Scalable**: Easily add more minions or customize states for other use cases.

## Prerequisites
Before running this project, ensure you have the following installed on your machine:

1. **Docker**: Install Docker

2. **Docker Compose**: Install Docker Compose


## Setup and Usage
#### Clone the Repository
```bash
git clone https://github.com/your-username/saltstack-mini-docker-lab.git
cd saltstack-mini-docker-lab
```
#### Start the Environment
Run the following command to start the Salt master and minions:
```bash
docker-compose build
docker-compose up -d
```
#### Accept Minion Keys
Once the containers are running, accept the minion keys on the Salt master:

```bash
docker exec -it salt-master salt-key -A
```

#### Apply Salt States
Apply the example state to install and configure Nginx on the minions:

```bash
docker exec -it salt-master salt '*' state.apply
```
#### Verify the Setup
Check if Nginx is installed and running on the minions:

```bash
docker exec -it salt-minion1 systemctl status nginx
docker exec -it salt-minion2 systemctl status nginx
```
#### Stop the Environment
To stop and remove the containers, run:

```bash
docker-compose down
```


## Project Structure
```
saltstack-docker-demo/
├── docker-compose.yml          # Docker Compose configuration
├── master/                     # Salt master configuration and files
│   ├── config/                 # Master configuration files
│   │   └── master.conf
│   ├── salt/                   # Salt states and pillars
│   │   ├── states/
│   │   │   └── top.sls         # Top file for states
│   │   │   └── example.sls     # Example state to install Nginx
│   │   └── pillar/
│   │       └── top.sls         # Top file for pillars
│   │       └── example.sls     # Example pillar data
├── minion1/                    # Configuration for minion1
│   └── config/
│       └── minion.conf
├── minion2/                    # Configuration for minion2
│   └── config/
│       └── minion.conf
└── README.md                   # Project documentation
```


## Salt States and Pillars
#### Example State (example.sls)
This state installs and starts Nginx on the minions:

```yml
install_nginx:
  pkg.installed:
    - name: nginx

start_nginx:
  service.running:
    - name: nginx
    - require:
      - pkg: install_nginx
```

#### Example Pillar (example.sls)
This pillar file contains example data:

```
example_key: example_value
```

## Example Commands
#### Apply States
Apply the example state to all minions:

```
docker exec -it salt-master salt '*' state.apply
```

#### Run Ad-Hoc Commands
Run a command on all minions:

```
docker exec -it salt-master salt '*' cmd.run 'echo Hello, Salt!'
```

#### Check Minion Status
Check the status of the minions:

```
docker exec -it salt-master salt '*' test.ping
```


## License
This project is licensed under the MIT License.
