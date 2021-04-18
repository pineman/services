#!/bin/bash
amixer sset 'Master',0 unmute
exec /spotifyd/spotifyd --no-daemon -c /spotifyd/cache -d pinecone "$@"
