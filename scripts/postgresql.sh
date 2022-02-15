# start Postgres
misc_dir=/home/runner/misc/${REPL_SLUG}

# rm -rf ${misc_dir}/postgresql
if [ ! -e ${misc_dir}/postgresql ]; then
  mkdir -p ${misc_dir}/postgresql
  cd ${misc_dir}/postgresql
  initdb ${misc_dir}/postgresql/data
  cp ${root_dir}/scripts/postgresql.conf.tpl ${misc_dir}/postgresql/data/postgresql.conf
  socker_dir="${misc_dir}/postgresql"
  sed -i "s#replace_unix_dir#${socker_dir}#" ${misc_dir}/postgresql/data/postgresql.conf
  pg_ctl start -D ${misc_dir}/postgresql/data -l ${misc_dir}/postgresql.log
  createdb -h 127.0.0.1
  psql -h 127.0.0.1 -c "create database orzlab;"
  cd /home/runner/${REPL_SLUG}
else
  pg_ctl stop -D ${misc_dir}/postgresql/data -l ${misc_dir}/postgresql.log
  pg_ctl start -D ${misc_dir}/postgresql/data -l ${misc_dir}/postgresql.log
fi
