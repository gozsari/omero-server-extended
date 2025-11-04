FROM openmicroscopy/omero-server:5.6.16

USER root
RUN apt-get update && apt-get install -y --no-install-recommends \
      jq curl ca-certificates && rm -rf /var/lib/apt/lists/*

COPY --chown=omero-server:omero-server scripts/ /omero/
USER omero-server
