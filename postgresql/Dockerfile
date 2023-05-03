FROM postgres:13.0-alpine 
RUN mkdir /backups
COPY . .
RUN chmod +x ./backup.sh
RUN crontab ./scheduler.sh
CMD /docker-entrypoint.sh postgres && crond -f
