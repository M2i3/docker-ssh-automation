#
# The M2i3 SSH Automation Tool to allow remote program execution (when needed)
#
FROM rastasheep/ubuntu-sshd:14.04
MAINTAINER Jean-Marc Lagace <jean-marc@m2i3.com>

# ensure the right locale 
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8
# Set noninteractive mode for apt-get
ENV DEBIAN_FRONTEND noninteractive

# Make sure it's at the latest verion
RUN locale-gen en_US.UTF-8 && \
    apt-get update && \
    apt-get upgrade -y 

RUN apt-get install -y curl python rsync ssh
RUN curl https://bootstrap.pypa.io/get-pip.py | python
RUN pip install docopt

RUN sed -i -e 's/^PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
RUN sed -i -e 's/^#PasswordAuthentication .*/PasswordAuthentication no/' /etc/ssh/sshd_config
RUN sed -i -e 's/^X11Forwarding yes/X11Forwarding no/' /etc/ssh/sshd_config

ADD ./lib/  /usr/bin/

RUN chmod +x /usr/bin/docopts && chmod +x /usr/bin/client-wrapper && chmod +x /usr/bin/start-* && chmod +x /usr/bin/run-allowed.sh

EXPOSE 22

ENTRYPOINT ["/usr/bin/client-wrapper"]