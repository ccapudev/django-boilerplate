#!/bin/sh
source .venv/bin/activate
tmux new-session \; \
  set-window-option -g mouse on \; \
  send-keys './manage.py runserver' C-m \; \
  split-window -v \; \
  send-keys 'redis-cli -n 2 flushall' C-m \; \
  send-keys 'celery -A webapp worker -n celery@localhost --loglevel=INFO' C-m \; \
  split-window -h \; \
  send-keys 'celery -A webapp beat --loglevel=INFO' C-m \; \
  split-window -v \; \
  send-keys 'npx tailwindcss -i ./static/tailwind/main.css -o ./static/css/main.css --watch' C-m \;

#tmux new-session -d 'web'
#tmux new-window 'tailwind'
#tmux split-window -v 'source .venv/bin/activate'
#tmux split-window -h 'source .venv/bin/activate'
#tmux -2 attach-session -d