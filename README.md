Migrate pinecone (and homelab in general) to kubernetes.

## TODO
1. Spigot: run in screen, attach from outside docker to run 'save-off' for backups - copiar esquema dos scripts do minecraft/spigot do arch.
1. `init: true` on all services?
1. Unify storage service
   * ~/Documents
   * PVCs for pods
1. Keep a KVM host for experiments somehow
   * need storage for images

## Notes
Its a lot of unneeded work for the usecase, but side projects are for over-engineering and learning (:
The main goal is to have everything as immutable as possible.
