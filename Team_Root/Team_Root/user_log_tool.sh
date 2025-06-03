#!/bin/bash


LOGGEDUSERSFILE="logged_users.txt"
LOGFILE="system_status.txt"
ps -e | sort -k2 -nr | sed 1d | head -n 5 > "top_CPU.txt"

while true; do
	echo "[1] 사용자 명령어 추출"
	echo "[2] 인기 명령어 추출 "
	echo "[3] 현재 로그인 사용자 보기 "
	echo "[4] 시스템 상태확인 "
	echo "[5] CPU 사용률 확인 "
	echo "[6] 종료"

echo "메뉴 번호를 입력하세요: "
read choice

case $choice in
	1)
	cat ~/.bash_history | tail -20 > user_commands.txt
	echo "저장완료 "
	;;

	2) 
	cat user_commands.txt | sort | uniq -c | sort -nr | head -5 > popular_commands.txt
	echo "저장완료 "
	;;

	3) 
	echo "현재 로그인한 사용자 확인중..."
	who > "logged_users.txt"
	echo "저장완료 "
	;;

	4)	
       	echo "시스템 부하 평균 수집 중..."
	uptime | cut -d ':' -f4 > "$LOGFILE"
	echo "저장완료 "
	;;

	5)
	echo "CPU 사용률 상위 5개 프로세스  "
	;;

	6) 
	echo "프로그램을 종료합니다."
	break
	;;
	*)
	echo "잘못된 입력입니다.  1 ~ 6 사이의 숫자를 입력하세요."
	;;

	esac

	echo " "
done
