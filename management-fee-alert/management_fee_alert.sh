#!/bin/bash

# 관리비 알림 프로젝트
LOG_FILE="$HOME/management-fee-alert/management_fee.log"

MESSAGE="[$(date '+%Y-%m-%d %H:%M:%S')] 관리비 납부일입니다! 집주인에게 관리비를 입금했는지 확인하세요."

# 터미널에 알림 출력
echo "$MESSAGE"

# 실행 기록을 로그 파일에 저장
echo "$MESSAGE" >> "$LOG_FILE"
