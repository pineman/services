Migrate pinecone (and homelab in general) from docker-compose to kubernetes.

## TODO
1. Merge with `images` repo on gitlab
1. CI/CD - build images and kubectl apply - can use free runners on gitlab.com, can also setup a runner
1. node-exporter on baremetal or docker? what can we run on k8s?
1. `init: true` on all services?
1. Unify storage service
   * ~/Documents
   * PVCs for pods
1. Keep a KVM host for experiments somehow
   * need storage for images

## Notes
Its a lot of unneeded work for the usecase, but side projects are for over-engineering and learning (:
The main goal is to have everything as immutable as possible.
