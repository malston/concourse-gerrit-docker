# concourse-gerrit-docker

```
63% 2016-07-28 17:21:20 ☆  |2.1.2| Mark-Alstons-MacBook-Pro in ~/workspace
○ → git clone https://github.com/malston/concourse-gerrit-docker.git && cd concourse-gerrit-docker

62% 2016-07-28 17:23:05 ☆  |2.1.2| Mark-Alstons-MacBook-Pro in ~/workspace/concourse-docker
○ → mkdir -p keys/web keys/worker

61% 2016-07-28 17:30:11 ☆  |2.1.2| Mark-Alstons-MacBook-Pro in ~/workspace/concourse-docker
○ → tree
.
├── docker-compose.yml
└── keys
    ├── web
    └── worker

3 directories, 1 file

60% 2016-07-28 17:30:13 ☆  |2.1.2| Mark-Alstons-MacBook-Pro in ~/workspace/concourse-docker
○ → ssh-keygen -t rsa -f ./keys/web/tsa_host_key -N ''
Generating public/private rsa key pair.
Your identification has been saved in ./keys/web/tsa_host_key.
Your public key has been saved in ./keys/web/tsa_host_key.pub.
The key fingerprint is:
52:a4:cc:95:c0:53:c5:2c:67:e2:e0:8e:53:61:f8:f0 malston@Mark-Alstons-MacBook-Pro
The key's randomart image is:
+--[ RSA 2048]----+
|     o.o+=.      |
|    oo*++ =      |
|     *+=.=       |
|      E..        |
|     +. S        |
|    o ..         |
|     .           |
|                 |
|                 |
+-----------------+

60% 2016-07-28 17:30:34 ☆  |2.1.2| Mark-Alstons-MacBook-Pro in ~/workspace/concourse-docker
○ → ssh-keygen -t rsa -f ./keys/web/session_signing_key -N ''
Generating public/private rsa key pair.
Your identification has been saved in ./keys/web/session_signing_key.
Your public key has been saved in ./keys/web/session_signing_key.pub.
The key fingerprint is:
d8:01:2f:73:60:aa:58:b9:c7:00:5a:1f:24:47:25:ea malston@Mark-Alstons-MacBook-Pro
The key's randomart image is:
+--[ RSA 2048]----+
|. oo*.=          |
|.o * = +         |
|. = o o +        |
| + =   * .       |
|. E o . S        |
|   .             |
|                 |
|                 |
|                 |
+-----------------+

60% 2016-07-28 17:30:42 ☆  |2.1.2| Mark-Alstons-MacBook-Pro in ~/workspace/concourse-docker
○ → ssh-keygen -t rsa -f ./keys/worker/worker_key -N ''
Generating public/private rsa key pair.
Your identification has been saved in ./keys/worker/worker_key.
Your public key has been saved in ./keys/worker/worker_key.pub.
The key fingerprint is:
f4:fc:12:60:a5:95:68:0d:c6:4d:b7:48:8c:dd:08:15 malston@Mark-Alstons-MacBook-Pro
The key's randomart image is:
+--[ RSA 2048]----+
|       .+%E=.    |
|       .==Bo..   |
  1 HU0BhAA4vzsd1JPdBeeZsuP7T malston@Mark-Alstons-MacBook-Pro
|       .= . .    |
|       o +       |
|        S +      |
|           o     |
|          . .    |
|           .     |
|                 |
+-----------------+

60% 2016-07-28 17:30:48 ☆  |2.1.2| Mark-Alstons-MacBook-Pro in ~/workspace/concourse-docker
○ → cp ./keys/worker/worker_key.pub ./keys/web/authorized_worker_keys

60% 2016-07-28 17:30:56 ☆  |2.1.2| Mark-Alstons-MacBook-Pro in ~/workspace/concourse-docker
○ → cp ./keys/web/tsa_host_key.pub ./keys/worker

59% 2016-07-28 17:31:34 ☆  |2.1.2| Mark-Alstons-MacBook-Pro in ~/workspace/concourse-docker
○ → vi ./keys/web/authorized_worker_keys

59% 2016-07-28 17:33:16 ☆  |2.1.2| Mark-Alstons-MacBook-Pro in ~/workspace/concourse-docker
○ → docker-machine create --driver virtualbox --virtualbox-memory "11000" --virtualbox-disk-size "100000" concourse-gerrit-docker
Running pre-create checks...
Creating machine...
(concourse) Copying /Users/malston/.docker/machine/cache/boot2docker.iso to /Users/malston/.docker/machine/machines/concourse/boot2docker.iso...
(concourse) Creating VirtualBox VM...
(concourse) Creating SSH key...
(concourse) Starting the VM...
(concourse) Check network to re-create if needed...
(concourse) Waiting for an IP...
"Waiting for machine to be running, this may take a few minutes...
Detecting operating system of created instance...
Waiting for SSH to be available...
Detecting the provisioner...
Provisioning with boot2docker...

Copying certs to the local machine directory...
Copying certs to the remote machine...
Setting Docker configuration on the remote daemon...
Checking connection to Docker...
Docker is up and running!
To see how to connect your Docker Client to the Docker Engine running on this virtual machine, run: docker-machine env concourse

56% 2016-07-28 17:34:51 ☆  |2.1.2| Mark-Alstons-MacBook-Pro in ~/workspace/concourse-docker
○ → eval "$(docker-machine env concourse-gerrit-docker)"

56% 2016-07-28 17:34:52 ☆  |2.1.2| Mark-Alstons-MacBook-Pro in ~/workspace/concourse-docker
○ → docker-machine env concourse-gerrit-docker
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.104:2376"
export DOCKER_CERT_PATH="/Users/malston/.docker/machine/machines/concourse-gerrit-docker"
export DOCKER_MACHINE_NAME="concourse-gerrit-docker"
# Run this command to configure your shell:
# eval $(docker-machine env concourse-gerrit-docker)

56% 2016-07-28 17:34:59 ☆  |2.1.2| Mark-Alstons-MacBook-Pro in ~/workspace/concourse-docker
○ → export CONCOURSE_EXTERNAL_URL=http://192.168.99.104:8080

56% 2016-07-28 17:35:11 ☆  |2.1.2| Mark-Alstons-MacBook-Pro in ~/workspace/concourse-docker
○ → docker-compose up -d
Pulling concourse-db (postgres:9.5)...
9.5: Pulling from library/postgres
5c90d4a2d1a8: Downloading [=============================>                     ]  30.4 MB/51.35 MB
22337bfd13a9: Download complete
c3961b297acc: Download complete
5a17453338b4: Download complete
6364e0d7a283: Download complete
58c25f5c0dad: Download complete
f0e675ce88d9: Download complete
10f26c680a34: Downloading [=======================================>           ] 32.81 MB/41.84 MB
873d2c220bff: Download complete
fd10fb78ded6: Download complete
ff1356ba118b: Download complete
```
