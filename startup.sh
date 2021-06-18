#!/bin/sh
# Run Migrations

if [ -n "$RAILS_ENV" ]
  then
    echo "RAILS_ENV is $RAILS_ENV"
  else
    echo 'RAILS_ENV not set, default to production'
    export RAILS_ENV='production'
fi



if [ -n "$SKIP_MIGRATIONS" ]
  then
	echo "SKIP_MIGRATIONS is set. Skipping Migrations."
  else
	bundle exec rake db:migrate
fi

echo "Starting SSH Server"
/usr/sbin/sshd

echo "## Migrations complete. Starting app."
# Start App
bundle exec rails server -b 0.0.0.0