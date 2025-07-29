FROM ankane/pgvector:latest

# Install wal2json
RUN apt-get update && apt-get install -y \
    postgresql-15-wal2json \
    && rm -rf /var/lib/apt/lists/*

# Enable logical replication in Postgres
RUN echo "wal_level = logical" >> /var/lib/postgresql/data/postgresql.auto.conf && \
    echo "max_replication_slots = 10" >> /var/lib/postgresql/data/postgresql.auto.conf && \
    echo "max_wal_senders = 10" >> /var/lib/postgresql/data/postgresql.auto.conf
