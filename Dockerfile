FROM openmicroscopy/omero-server:5.6.16

USER root
RUN dnf -y install epel-release && \
    dnf -y install jq curl ca-certificates && \
    dnf -y clean all && rm -rf /var/cache

COPY --chown=omero-server:omero-server scripts/ /omero/
USER omero-server
