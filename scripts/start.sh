root_dir=/home/runner/${REPL_SLUG}
source ${root_dir}/scripts/postgresql.sh

# start nginx
# pkill nginx

# nginx -e /home/runner/data/$REPL_SLUG/logs/error.log -c /home/runner/data/$REPL_SLUG/nginx.conf

# start app
go run main.go
