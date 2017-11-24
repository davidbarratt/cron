FROM debian:jessie

RUN apt-get update && apt-get install -y \
		cron \
		--no-install-recommends && rm -r /var/lib/apt/lists/*

COPY ./bin/cron-start /bin/cron-start

RUN chmod +x /bin/cron-start

ENV CRONTAB '* * * * * echo "Hello World!"';

CMD ["cron-start"]
