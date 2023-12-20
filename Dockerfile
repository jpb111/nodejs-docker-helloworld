#@Author: John Paul Babu @jondevops.dev <johnpaul@irisind.com,john@jondevops.dev>


FROM node:18-bullseye-slim AS base

# Set the working directory in the container
WORKDIR /app

# Create a non-root user
RUN addgroup --system nonroot && adduser --system --ingroup nonroot nonroot

# Give ownership of the working directory to the non-root user
RUN chown -R nonroot:nonroot /app

# Switch to the non-root user
USER nonroot

# Copy package.json and package-lock.json (or yarn.lock) to the working directory
COPY package*.json ./

# Install production dependencies
RUN npm ci --only=production

# -------

# Use a separate stage 

FROM base AS build

# Copy the application code into the container
COPY . .

# Start the application 
CMD ["npm", "start"]
