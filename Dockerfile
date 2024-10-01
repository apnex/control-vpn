FROM alpine:latest

RUN apk --no-cache --update add \
	bash \
	sudo \
	syslog-ng \
	strongswan && \
rm -rf /tmp/* && \
rm -rf /var/cache/apk/*

## allow charon as user=ipsec to execute as root
RUN echo '%ipsec ALL=(ALL:ALL) NOPASSWD:SETENV: ALL' > /etc/sudoers.d/ipsec
RUN chmod 0440 /etc/sudoers.d/ipsec

# Not in use - overidden in k8s manifest
#EXPOSE	500/udp \
#	4500/udp
#ENTRYPOINT ["/usr/sbin/ipsec"]
#CMD ["start", "--nofork"]
