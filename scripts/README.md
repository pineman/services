mount a zvol at snapshot:
```
sudo zfs set snapdev=visible ssd/docker
sudo mount -o ro,noload /dev/zvol/ssd/docker@dea923f0 /mnt
```
