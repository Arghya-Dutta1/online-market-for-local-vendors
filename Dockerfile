# Use official Node.js base image
FROM node:18

# Install sqlite3 and build tools
RUN apt-get update && apt-get install -y sqlite3 build-essential

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy backend source code
COPY src ./src

# Copy frontend public files into the src/public directory
COPY public ./src/public

# Set working directory to backend code
WORKDIR /app/src

# Expose backend port
EXPOSE 3000

# Start the Node.js server
CMD ["node", "server.js"]
