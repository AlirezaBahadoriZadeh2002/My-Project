FROM consul:latest

LABEL author="Alireza"




RUN apk add --update bash supervisor jq  && rm -rf /var/cache/apk/*


SHELL ["/bin/bash" , "-c"]



WORKDIR /project

RUN mkdir html-backup
RUN mkdir conf-backup



COPY check.sh .
COPY html-replace.sh .
COPY conf-replace.sh .

COPY index.html .


COPY supervisord.conf /etc/supervisord.conf


EXPOSE 8500
EXPOSE 80

CMD ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]
