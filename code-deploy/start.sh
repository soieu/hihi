#!/usr/bin/env bash

sudo -u ubuntu -i <<'EOF'
cd /home/ubuntu/photio-remix
PROJECT_ROOT="/home/ubuntu/instance_test"
APP_LOG="$PROJECT_ROOT/application.log"
ERROR_LOG="$PROJECT_ROOT/error.log"
DEPLOY_LOG="$PROJECT_ROOT/deploy.log"
DOWNLOAD_LOG="$PROJECT_ROOT/download.log"
REQUIREMENTS_LOG="$PROJECT_ROOT/requirements.log"

nohup python3 -m pip install -r  $PROJECT_ROOT/requirements.txt > $REQUIREMENTS_LOG 2> $REQUIREMENTS_LOG

TIME_NOW=$(date +%c)

echo "$TIME_NOW > 실행" >> $DEPLOY_LOG
nohup python3 -m uvicorn main:app --host 0.0.0.0 --port 8080 > $APP_LOG 2>&1 &


CURRENT_PID=$(pgrep -f main.py)
echo "$TIME_NOW > 실행된 프로세스 아이디 $CURRENT_PID 입니다." >> $DEPLOY_LOG

EOF