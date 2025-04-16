# Use a stable, lightweight base image
FROM nginx:stable-alpine

# Remove the default Nginx config to avoid conflicts
RUN rm /etc/nginx/conf.d/default.conf

# Copy your development Nginx config (ensure the file is named correctly)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80 for local access
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
