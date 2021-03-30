# vim:set ft=dockerfile:
FROM postgres:13-alpine

COPY docker/docker-entrypoint.sh /usr/local/bin/

#RUN echo -e '#!/bin/bash\nsu-exec' > /usr/bin/gosu && \
#    chmod +x /usr/bin/gosu

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["postgres"]
