FROM registry.access.redhat.com/ubi9/ruby-30@sha256:f24b6ff08fe6be56b5265a82b766a1a36865fcb28e89615730247a0e25634087
USER default
EXPOSE 8080
ENV RACK_ENV production
ENV RAILS_ENV production
COPY . /opt/app-root/src/
ENV GEM_HOME ~/.gem
RUN bundle install
CMD ["./run.sh"]

USER root
RUN chmod og+rw /opt/app-root/src/db
USER default
