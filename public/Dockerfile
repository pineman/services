FROM registry.gitlab.com/pineman/services/base:1.3.0
COPY setup.sh /
RUN /setup.sh
COPY public.js /
ENTRYPOINT ["node", "/public.js"]
