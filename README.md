# Linux Management Fee Alert

## 1. 프로젝트 소개

매월 22일 관리비 납부일을 잊지 않도록 Bash Shell Script와 cron을 활용해 만든 Linux 자동화 프로젝트입니다.

관리비 납부일 안내 메시지를 생성하고, Telegram Bot API를 통해 텔레그램으로 알림을 전송합니다. 또한 cron을 이용해 정해진 날짜와 시간에 자동 실행되도록 구성했습니다.

## 2. 개발 환경

* OS: Ubuntu Linux
* Language: Bash Shell Script
* Scheduler: cron
* HTTP Client: curl
* Notification: Telegram Bot API
* Version Control: Git, GitHub

## 3. 주요 기능

* 매월 22일 오전 9시에 관리비 알림 스크립트 자동 실행
* 텔레그램을 통한 관리비 납부 알림 전송
* 실행 시간과 알림 메시지를 로그 파일에 기록
* 텔레그램 메시지 전송 결과 확인 및 기록
* 로그인 시 날짜에 따른 관리비 안내 표시
* 19~21일에는 납부일 사전 안내
* 22일에는 납부일 안내

## 4. 프로젝트 구조

```text
management-fee-alert/
├── management_fee_alert.sh
├── login_alert.sh
├── .gitignore
└── README.md
```

## 5. 실행 방법

### 5.1 실행 권한 부여

```bash
chmod +x management_fee_alert.sh
chmod +x login_alert.sh
```

### 5.2 텔레그램 환경변수 설정

프로젝트 디렉터리에 `.env` 파일을 만들고 다음 항목을 설정합니다.

```bash
TELEGRAM_BOT_TOKEN="발급받은_봇_토큰"
TELEGRAM_CHAT_ID="확인한_채팅_ID"
```

실제 토큰과 채팅 ID는 본인의 값으로 설정합니다.

`.env` 파일에는 인증 정보가 포함되므로 GitHub에 업로드하지 않습니다.

### 5.3 스크립트 실행

```bash
./management_fee_alert.sh
```

스크립트를 실행하면 관리비 안내 메시지를 출력하고 텔레그램으로 알림을 전송합니다.

### 5.4 로그 확인

```bash
cat management_fee.log
```

cron 실행 로그는 다음 명령어로 확인할 수 있습니다.

```bash
cat cron.log
```

## 6. cron 설정

매월 22일 오전 9시에 관리비 알림 스크립트를 실행하도록 설정합니다.

```cron
0 9 22 * * /bin/bash /root/management-fee-alert/management_fee_alert.sh >> /root/management-fee-alert/cron.log 2>&1
```

cron 예약 작업은 다음 명령어로 확인할 수 있습니다.

```bash
crontab -l
```

## 7. 로그인 알림 설정

`/root/.bashrc`에 다음 코드를 추가하면 대화형 Bash 세션을 시작할 때 로그인 알림 스크립트를 실행할 수 있습니다.

```bash
if [ -n "$PS1" ]; then
    /bin/bash /root/management-fee-alert/login_alert.sh
fi
```

## 8. 보안 설정

* 텔레그램 봇 토큰과 채팅 ID는 `.env` 파일에서 관리합니다.
* `.gitignore`에 `.env`를 등록해 인증 정보가 Git에 포함되지 않도록 합니다.
* 인증 정보가 포함된 파일을 공개 저장소에 업로드하지 않습니다.

## 9. 배운 점

* Bash Shell Script 작성 및 실행
* Linux 파일 권한 관리
* cron을 활용한 작업 자동화
* 로그 파일을 통한 실행 결과 확인
* 조건문을 활용한 날짜별 알림 구현
* curl을 이용한 외부 API 호출
* Telegram Bot API를 활용한 메시지 전송
* 환경변수를 이용한 인증 정보 관리
* Git과 GitHub를 활용한 프로젝트 관리

