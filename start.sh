#!/bin/sh -ex

#start the service
cd /app/
gunicorn -w 1 \
	-k uvicorn.workers.UvicornWorker starter.main:app \
	-b 0.0.0.0:8000
