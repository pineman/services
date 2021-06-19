#!/bin/bash
amixer sset 'Master',0 unmute
amixer sset 'Master',0 100
exec /spotifyd/spotifyd --no-daemon -c /spotifyd/cache -d pinecone "$@"
