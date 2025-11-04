FROM openmicroscopy/omero-server:5.6.16
ENV OMERO_DIST=/opt/omero/server/OMERO.server

USER root

RUN dnf -y install epel-release && \
    dnf -y install jq curl-minimal ca-certificates && \
    dnf -y clean all && rm -rf /var/cache

RUN . /opt/omero/server/venv3/bin/activate && \
    pip install --no-cache-dir omero-metadata



USER omero-server
COPY --chown=omero-server:omero-server scripts/ /omero/

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]