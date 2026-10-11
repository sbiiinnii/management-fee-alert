# Linux Management Fee Alert

## 1. 프로젝트 소개

매월 22일 관리비 납부일을 잊지 않도록 Bash Shell Script와 cron을 활용해 만든 Linux 자동화 프로젝트입니다.

## 2. 개발 환경

* OS: Ubuntu Linux
* Language: Bash Shell Script
* Scheduler: cron
* Version Control: Git, GitHub

## 3. 주요 기능

* 매월 22일 오전 9시에 관리비 알림 스크립트 자동 실행
* 실행 시간과 알림 메시지를 로그 파일에 기록
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

프로젝트 파일이 있는 디렉터리에서 실행 권한을 부여합니다.

```bash
chmod +x management_fee_alert.sh
chmod +x login_alert.sh
```

관리비 알림 스크립트를 직접 실행합니다.

```bash
./management_fee_alert.sh
```

로그 파일을 확인합니다.

```bash
cat management_fee.log
```

## 6. cron 설정

매월 22일 오전 9시에 실행하도록 설정합니다.

```cron
0 9 22 * * /bin/bash /root/management-fee-alert/management_fee_alert.sh >> /root/management-fee-alert/cron.log 2>&1
```

cron 예약은 다음 명령어로 확인할 수 있습니다.

```bash
crontab -l
```

## 7. 로그인 알림 설정

`/root/.bashrc`에 다음 코드를 추가하면 대화형 Bash 세션을 시작할 때 알림을 표시할 수 있습니다.

```bash
if [ -n "$PS1" ]; then
    /bin/bash /root/management-fee-alert/login_alert.sh
fi
```

## 8. 배운 점

* Bash Shell Script 작성 및 실행
* Linux 파일 권한 관리
* cron을 활용한 작업 자동화
* 로그 파일을 통한 실행 결과 확인
* 조건문을 활용한 날짜별 알림 구현
* Git과 GitHub를 활용한 프로젝트 관리

