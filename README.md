Migrate pinecone (and homelab in general) from docker-compose to kubernetes.

Storage is zfs on baremetal by sshfs. k8s cluster would be on a VM (k3os).

## TODO
1. CI/CD - build images and kubectl apply - can use free runners on gitlab.com, can also setup a runner
1. node-exporter on baremetal or docker? what can we run on k8s?

## Notes
Its a lot of unneeded work for the usecase, but side projects are for over-engineering and learning (:
The main goal is to have everything as immutable as possible and minimize state to make sporadic deployments trivial.

## On docker and iptables and libvirt bridges
https://www.google.com/search?q=docker+iptables+close+port
https://serverfault.com/questions/704643/steps-for-limiting-outside-connections-to-docker-container-with-iptables
https://serverfault.com/questions/946010/what-are-proper-iptables-rules-for-docker-host
https://www.google.com/search?q=docker+libvirt+iptables
https://bbs.archlinux.org/viewtopic.php?id=233727
https://serverfault.com/questions/963759/docker-breaks-libvirt-bridge-network

Try podman?
