FROM consul:latest

LABEL author="Alireza"




RUN apk add --update bash supervisor jq  && rm -rf /var/cache/apk/*


#RUN apk add --no-cache supervisor


SHELL ["/bin/bash" , "-c"]


#RUN apk add --update jq && rm -rf /var/cache/apk/*


WORKDIR /project

RUN mkdir html-backup
RUN mkdir conf-backup



COPY check.sh .
COPY html-replace.sh .
COPY conf-replace.sh .

COPY index.html .


COPY supervisord.conf /etc/supervisord.conf


EXPOSE 8500

CMD ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]
