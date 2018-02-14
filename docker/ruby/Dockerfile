FROM ruby:2.5

ENV user gymsales
ENV PUID=1000
ENV PGID=1000
RUN groupadd -g $PGID $user && \
    useradd -u $PUID -g $user -m $user && \
    echo "$user ALL=(ALL)NOPASSWD: ALL" >> /etc/sudoers

RUN chown -R $user:$user /home/$user
RUN chown -R $user:$user /usr/local/bundle

WORKDIR /var/www

USER $user
