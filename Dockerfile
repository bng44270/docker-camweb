FROM debian:latest

RUN apt-get update
RUN apt-get install -y git make python3 python3-pip python3-full fswebcam
RUN pip3 install --break-system-packages flask

RUN cd /tmp && git clone https://github.com/bng44270/camweb.git

COPY runcamweb.sh /tmp
RUN chmod +x /tmp/runcamweb.sh

ENTRYPOINT ["/tmp/runcamweb.sh"]
