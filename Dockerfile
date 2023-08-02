# Use latest stable channel SDK, and have the SDK included in the image.
FROM dart:stable-sdk

# Resolve app dependencies.
WORKDIR /app
COPY pubspec.* ./
RUN dart pub get

# Copy app source code (except anything in .dockerignore)
COPY . .

# Start server.
# EXPOSE 8080
# CMD ["sh", "-c", "dart run bin/server.dart"]
