FROM openmicroscopy/omero-server:5.6.16

USER root
RUN dnf -y install epel-release && \
    dnf -y install jq curl-minimal ca-certificates && \
    dnf -y clean all && rm -rf /var/cache

# remove any baked-in TLS materials; provide at runtime instead
RUN rm -f /OMERO/certs/*.key /OMERO/certs/*.crt || true

# upgrade setuptools to address Trivy python-pkg CVEs
RUN dnf -y install python3-pip && \
    python3 -m pip install --no-cache-dir --upgrade pip && \
    python3 -m pip install --no-cache-dir "setuptools>=78.1.1" && \
    python3 -m pip cache purge || true

COPY --chown=omero-server:omero-server scripts/ /omero/
USER omero-server
