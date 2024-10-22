#!/usr/bin/env bash

PROJECT_ROOT="/home/ubuntu/hihi"

DEPLOY_LOG="$PROJECT_ROOT/deploy.log"
KILL_LOG="$PROJECT_ROOT/kill.log"

TIME_NOW=$(date +%c)

CURRENT_PID=$(pgrep -f app:app)
if [ -z $CURRENT_PID ]; then
    echo "$TIME_NOW > 현재 실행중인 애플리케이션이 없습니다." >> $DEPLOY_LOG
    # echo 현재 실행중인 애플리케이션이 없습니다.
else
    echo "$TIME_NOW > 실행중인 애플리케이션 KILL 시작" >> $KILL_LOG
    echo "$TIME_NOW > 실행중인 $CURRENT_PID 애플리케이션 종료." >> $DEPLOY_LOG
    kill -9 $CURRENT_PID
    echo "$TIME_NOW > KILL 성공" >> $KILL_LOG
fi