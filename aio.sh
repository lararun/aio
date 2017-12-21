#!/bin/sh
run_schedule(){
	echo "Start Schedule Module ... "
	if [ ! -f "/home/artisan" ]; then
		echo "Artisan Not Fount ..."
		exit;
	fi
	round=1
	while [ true ]; do
		echo Schedule Round: \[$round\]  Time: `date '+%F %T'`
		((round=$round+1))
		/usr/bin/php /home/artisan schedule:run
		/bin/sleep 60
	done
}

run_web(){
	echo "Start Web Module ... "
	php-fpm7
	nginx -g 'daemon off;'
}

run_queue(){
	echo "Start Queue Module ... "
	if [ ! -f "/home/artisan" ]; then
		echo "Artisan Not Fount ..."
		exit;
	fi
	params=$@
	if [ $# = 1 ] ; then
		queue_params="--timeout=60 --tries=3 --sleep=3"
	else
		queue_params="$2 $3 $4 $5 $6 $7 $8 $9"
	fi
	echo "php artisan $queue_params"
	/usr/bin/php /home/artisan queue:work $queue_params
}

run_all(){
	run_queue $@ &
	run_schedule &
	run_web
}

case $1 in
	schedule) run_schedule ;;
	queue) run_queue $@ ;;
	all) run_all $@ ;;
	sh) /bin/sh ;;
	*) run_web ;;
esac
