FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y wget unzip libglu1-mesa libxcursor1 libxrandr2 libxi6 libasound2

# Download Godot headless
RUN wget https://downloads.tuxfamily.org/godotengine/4.2.2/Godot_v4.2.2-stable_linux_server.64.zip -O godot.zip \
	&& unzip godot.zip -d /usr/local/bin/ \
	&& mv /usr/local/bin/Godot_v4.2.2-stable_linux_server.64 /usr/local/bin/godot \
	&& chmod +x /usr/local/bin/godot \
	&& rm godot.zip

# Copy project
WORKDIR /app
COPY . .

# Expose WebSocket port
EXPOSE 8080

# Run server build in headless mode
CMD ["godot", "--headless", "--main-pack", "server.pck"]
