# BUSCH uCore Config

These are the files I use to install uCore to my web server "BUSCH".

## Installation

1. Generate password hash, place it into the butane file
  - `podman run -it --rm quay.io/coreos/mkpasswd --method=yescrypt`
2. Generate an ignition file and host it on an http server
  - `serve.sh [server]`
3. Boot live CoreOS image
4. Start install from the generated ignition file
  - `sudo coreos-installer install /dev/nvme0n1 --insecure-ignition --ignition-url http://192.168.16.21:8000/[server].ign`
5. Reboot, then wait for it to automatically reboot 2 additional times
6. On first login it will walk you through enrolling the key for secureboot

## Useful Resources

- [CoreOS Docs](https://docs.fedoraproject.org/en-US/fedora-coreos/producing-ign/)
- [Ignition Docs](https://coreos.github.io/ignition/)
- [ucore](https://github.com/ublue-os/ucore)
