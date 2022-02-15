# start Postgres
rm -rf ${PGDATA}
if [ ! -e ${PGDATA} ]; then
  mkdir -p ${PGDATA}
  cd ${PGDATA}
  initdb ${PGDATA}
  cp ${REPLDIR}/scripts/postgresql.conf.tpl ${PGDATA}/postgresql.conf
  socker_dir="${PGDATA}"
  sed -i "s#replace_unix_dir#${socker_dir}#" ${PGDATA}/postgresql.conf
  pg_ctl start -D ${PGDATA} -l ${PGDATA}.log
  createdb -h 127.0.0.1
  psql -h 127.0.0.1 -c "create database orzlab;"
  cd /home/runner/${REPL_SLUG}
else
  pg_ctl stop -D ${PGDATA} -l ${PGDATA}.log
  pg_ctl start -D ${PGDATA} -l ${PGDATA}.log
fi
