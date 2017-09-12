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


#### Windows hosts ####
It turns out that --mount type=bind does not behave as well with windows hosts, so the files copied into the dockercontainer instead of being changed. This fools applications which are listening for file changes. 
Most applications can listen for changes by polling files, this can drastically decrease performance, but makes the method work on windows hosts. 

In this package nodemon is configured with the -L flag which puts nodemon into legacy mode which in turn makes it poll the files.

### Try it ###

Run the buildandrun.sh script, then do some modifications in src/index.js and watch nodemon restart node inside the docker container.