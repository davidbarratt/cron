FROM debian:stretch

RUN apt-get update && apt-get install -y \
		cron \
		curl \
		mysql-client \
		--no-install-recommends && rm -r /var/lib/apt/lists/*

COPY ./bin/cron-start /bin/cron-start

RUN chmod +x /bin/cron-start

ENV CRONTAB '* * * * * echo "Hello World!"';

CMD ["cron-start"]
