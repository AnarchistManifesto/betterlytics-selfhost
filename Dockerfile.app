FROM ghcr.io/betterlytics/betterlytics-selfhost:latest

# Copy custom entrypoint and configuration files
COPY base/entrypoint.sh /entrypoint.sh
COPY base/derive.sh /derive.sh
COPY base/proxy /etc/nginx/templates
COPY base/supervisord.conf /etc/supervisor/conf.d/betterlytics.conf

# Ensure scripts are executable
RUN chmod +x /entrypoint.sh /derive.sh

# Override the default entrypoint
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
