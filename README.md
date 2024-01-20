# yara-forge-docker
Run YARA Forge in a Docker container

This project is based on the great work by Florian Roth and his team on [YARA Forge](https://github.com/yarahq/yara-forge). 

Check out the blog post about YARA Forge here: https://cyb3rops.medium.com/introducing-yara-forge-a77cbb77dcab

Nothing with YARA Forge is changed -- you can simply run it in a Docker container, as opposed to installing Python components directly on the filesystem.

# Example
```
git clone https://github.com/weslambert/yara-forge-docker && cd yara-forge-docker

sudo docker run -it --rm --name=yara-forge -v ${PWD}/yara-forge-config.yml:/yara-forge/yara-forge-config.yml -v ${PWD}/packages:/yara-forge/packages wlambert/yara-forge python yara-forge.py -c yara-forge-config.yml
```

By default, the command will pull the [hosted](https://hub.docker.com/r/wlambert/yara-forge) version of the YARA Forge Docker image, but the command can be changed to use your own locally hosted image.

To build a local image, run the following command and substitute the name in the command above:

`sudo docker build -t $yourrepository/imagename`

# Custom Configuration
The configuration and scoring file (both from the original YARA Forge repository) can be modified as desired before running the above command. This can be useful for excluding rules, or including other rules not included by default.

# Packages
Rule packages will be created under `yara-forge-docker/packages`, with a separate directory for the core, extended, and full rule sets.
