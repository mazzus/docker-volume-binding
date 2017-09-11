## Binding volumes to docker container ##

This is an example of how to bind volumes to docker containers. This can significantly improve the development experience!

The whole solution is in buildandrun.sh:

```
docker run --mount type=bind,source="$(pwd)/src,target=/src,readonly" \
  --rm -it real-time-files
```

--mount is just the new and improved substitutor of -v.
readonly, can be ommitted if you want the container to be able to alter files on the host.

For more about binding volumes to docker container see: https://docs.docker.com/engine/admin/volumes/bind-mounts/#configure-the-selinux-label

### Try it ###

Run the buildandrun.sh script, then do some modifications in src/index.js and watch nodemon restart node inside the docker container.