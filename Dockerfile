# Stage 1: Node.js Build Stage
FROM node:16 as node_builder

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build


# Stage 2: Python Runtime Stage
FROM python:3.8

WORKDIR /app

# Copy the Node.js build artifacts
COPY --from=node_builder /app/build /app/build

# Copy Python dependencies file
COPY requirements.txt ./

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port that the app will run on (adjust if needed)
EXPOSE 3000

# Define the command to start the app
CMD ["npm", "start"]
