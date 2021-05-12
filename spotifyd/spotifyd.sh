#!/bin/bash
amixer sset Master,0 unmute
amixer sset Master,0 50%
exec /spotifyd/spotifyd --no-daemon -c /spotifyd/cache -d pinecone "$@"
