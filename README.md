#Homeserver Infrastructure
Just a set of scripts for me to quickly spin-up my current homelab configuration when I update its hardware.

## Pre-requisite checks

1. Is git installed ?
2. Do I have internet access to clone the repo ?

## Steps it should take

1. Install git in case it is not and I had to manually copy it 
2. Clone the repo
3. Launch the setup_script
4. Disable sleep on closing lid if running on a laptop
5. Copy the files from either the git repo or manually into the host 
6. Install Docker
7. Fill the .env variables (Maybe make it interactive over ?)
8. Run main docker-compose.yml file 


