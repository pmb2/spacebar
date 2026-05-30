# =============================================================================
# Spacebar Dockerfile — Multi-stage production build
# =============================================================================
# Stage 1: Build
FROM node:20-alpine AS builder

WORKDIR /app

# Install build dependencies
RUN apk add --no-cache python3 make g++ git

# Copy package files and install ALL dependencies (including devDependencies for build)
COPY package.json package-lock.json ./
COPY patches/ ./patches/
RUN npm ci

# Copy source files
COPY tsconfig.json tsconfig.tsbuildinfo ./
COPY src/ ./src/
COPY scripts/ ./scripts/

# Create assets directory for schema generation
RUN mkdir -p assets

# Build the project
RUN npm run build

# =============================================================================
# Stage 2: Production runtime
FROM node:20-alpine AS runtime

# Install runtime system dependencies
# bcrypt needs make/g++/python3, sharp needs vips
RUN apk add --no-cache \
    python3 \
    make \
    g++ \
    vips-dev \
    tini \
    tzdata

# Create non-root user
RUN addgroup -S spacebar && adduser -S spacebar -G spacebar

WORKDIR /app

# Copy built artifacts from builder
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json

# Copy config and data assets
COPY config.json ./config.json
COPY config.production.json ./config.production.json
COPY assets/ ./assets/
COPY locales/ ./locales/

# Create data directories
RUN mkdir -p /app/data && chown -R spacebar:spacebar /app

# Environment variables (with safe defaults)
ENV NODE_ENV=production
ENV CONFIG_PATH=/app/config.production.json
ENV PORT=3001

# Database connection (must be provided at runtime)
# ENV DATABASE=postgres://user:pass@host:5432/spacebar
# ENV DB_SYNC=false
# ENV APPLY_DB_MIGRATIONS=true

# Optional overrides
# ENV POSTGRES_HOST=
# ENV POSTGRES_PORT=
# ENV POSTGRES_USER=
# ENV POSTGRES_PASSWORD=
# ENV POSTGRES_DB=
# ENV JWT_SECRET=
# ENV API_ENDPOINT_PUBLIC=
# ENV GATEWAY_ENDPOINT_PUBLIC=
# ENV CDN_ENDPOINT_PUBLIC=
# ENV RABBITMQ_HOST=
# ENV CDN_SIGNATURE_PATH=
# ENV LEGACY_JWT_SECRET_PATH=

EXPOSE 3001

# Use tini as init system for proper signal handling
ENTRYPOINT ["/sbin/tini", "--"]

# Switch to non-root user
USER spacebar

# Start the server
CMD ["node", "--enable-source-maps", "dist/bundle/start.js"]
