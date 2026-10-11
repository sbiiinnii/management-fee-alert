#!/bin/bash

# 관리비 알림 프로젝트
BASE_DIR="$HOME/management-fee-alert"
LOG_FILE="$HOME/management-fee-alert/management_fee.log"
ENV_FILE="$BASE_DIR/.env"

# 텔레그램 설정 불러오기
if [ ! -f "$ENV_FILE" ]; then
    echo "오류: .env 파일을 찾을 수 없습니다."
    exit 1
fi

source "$ENV_FILE"

# 필요한 설정이 있는지 확인
if [ -z "$TELEGRAM_BOT_TOKEN" ] || [ -z "$TELEGRAM_CHAT_ID" ]; then
    echo "오류: 텔레그램 토큰 또는 채팅 ID가 없습니다."
    exit 1
fi

# 관리비 알림 메시지 작성
MESSAGE="[$(date '+%Y-%m-%d %H:%M:%S')] 관리비 납부일입니다! 집주인에게 관리비를 입금했는지 확인하세요."

# 터미널에 알림 출력
echo "$MESSAGE"

# 실행 기록을 로그 파일에 저장
echo "$MESSAGE" >> "$LOG_FILE"

# 텔레그램으로 메시지 전송
RESPONSE=$(curl -sS -X POST \
    "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage" \
    --data-urlencode "chat_id=${TELEGRAM_CHAT_ID}" \
    --data-urlencode "text=${MESSAGE}")

# 전송 결과 확인
if echo "$RESPONSE" | grep -q '"ok":true'; then
    echo "텔레그램 전송 성공"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] 텔레그램 전송 성공" >> "$LOG_FILE"
else
    echo "텔레그램 전송 실패"    echo "[$date '+%Y-%m-%d %H:%M:%S')] 텔레그램 전송 실패: $RESPONSE" >> "$LOG_FILE"
    exit 1
fi
