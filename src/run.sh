SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd "$SCRIPT_DIR"

echo "create table users(id integer primary key, name text, class text);
insert into users(name, class) values('Yamada','A');
insert into users(name, class) values('Suzuki','B');
insert into users(name, class) values('Tanaka','A');
" > create_0.sql

sqlite3 :memory: \
".read create_0.sql" \
".headers on" \
"select * from users;"

sqlite3 :memory: \
".read create_0.sql" \
".headers off" \
"select * from users;"

