#! /bin/bash -exu

. ./utilities.sh
BASE_DIR=`pwd`
CONFIG_DIR="$BASE_DIR/config"

. $CONFIG_DIR/common.conf

if [ -f $APTCACHER_RUNNING_FILE ]
then
	report_info "apt-cacher daemons are already running"
	exit 1
fi

# Some systems like Debian dont have /usr/sbin in normal user's PATH
PATH=/usr/sbin:$PATH

mkdir -p $APTCACHER_DIR/cache-0
mkdir -p $APTCACHER_DIR/log-0
apt-cacher -d -c $CONFIG_DIR/apt-cacher.conf -p $APTCACHER_DIR/pid-0 cache_dir=$APTCACHER_DIR/cache-0 log_dir=$APTCACHER_DIR/log-0 daemon_port=3150

mkdir -p $APTCACHER_DIR/cache-1
mkdir -p $APTCACHER_DIR/log-1
apt-cacher -d -c $CONFIG_DIR/apt-cacher.conf -p $APTCACHER_DIR/pid-1 cache_dir=$APTCACHER_DIR/cache-1 log_dir=$APTCACHER_DIR/log-1 daemon_port=3151

mkdir -p $APTCACHER_DIR/cache-2
mkdir -p $APTCACHER_DIR/log-2
apt-cacher -d -c $CONFIG_DIR/apt-cacher.conf -p $APTCACHER_DIR/pid-2 cache_dir=$APTCACHER_DIR/cache-2 log_dir=$APTCACHER_DIR/log-2 daemon_port=3152

mkdir -p $APTCACHER_DIR/cache-3
mkdir -p $APTCACHER_DIR/log-3
apt-cacher -d -c $CONFIG_DIR/apt-cacher.conf -p $APTCACHER_DIR/pid-3 cache_dir=$APTCACHER_DIR/cache-3 log_dir=$APTCACHER_DIR/log-3 daemon_port=3153

touch $APTCACHER_RUNNING_FILE

report_info "Process finished"

exit 0
