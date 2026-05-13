# Lightweight Node.js image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy dependency files first
COPY package*.json ./

# Install required packages
RUN npm install postcss@8.4.21 postcss-safe-parser@6.0.0 --legacy-peer-deps && \
    npm install --legacy-peer-deps

# Copy application files
COPY . .

# Change application port
EXPOSE 8082

# Environment variables
ENV NODE_OPTIONS=--openssl-legacy-provider
ENV PORT=8082

# Start application
CMD ["npm", "start"]
