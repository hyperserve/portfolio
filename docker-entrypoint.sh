#!/bin/sh
set -e

/app/bin/portfolio eval Portfolio.Release.migrate

exec /app/bin/server
