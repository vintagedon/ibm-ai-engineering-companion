# PostgreSQL 16 + pgvector Cheat Sheet

## Connection

Connect to PostgreSQL instances and manage sessions.

```bash
psql -h 10.25.20.8 -U username -d steam_db
psql -h 10.25.20.8 -U username -d desi_db
psql postgres://user:pass@host:5432/db
```

## Basic Meta Commands

Essential session management and connection commands.

```sql
\q                    -- Quit psql
\c database           -- Connect to database
\c database user      -- Connect as different user
\conninfo             -- Display connection info
\password             -- Change password
```

## Database Information

Explore databases, schemas, and user permissions.

```sql
\l                    -- List databases
\l+                   -- List databases with details
\du                   -- List users/roles
\du+                  -- List users with details
\dn                   -- List schemas
\dn+                  -- List schemas with details
```

## Table Information

Navigate tables and examine structure.

```sql
\dt                   -- List tables
\dt+                  -- List tables with details
\dt schema.*          -- List tables in schema
\d table              -- Describe table
\d+ table             -- Describe table with details
\dt *pattern*         -- List tables matching pattern
```

## Index and Object Information

Find indexes, views, functions, and extensions.

```sql
\di                   -- List indexes
\di+                  -- List indexes with details
\ds                   -- List sequences
\dv                   -- List views
\dm                   -- List materialized views
\df                   -- List functions
\df+                  -- List functions with details
\do                   -- List operators
\dT                   -- List data types
\dE                   -- List foreign tables
\dx                   -- List extensions
```

## Advanced Object Details

Deep dive into database objects and system information.

```sql
\d+ table             -- Show column details, indexes, constraints
\dS                   -- List system tables
\dg                   -- List roles (same as \du)
\db                   -- List tablespaces
\dc                   -- List conversions
\dC                   -- List casts
\dd                   -- List object descriptions
```

## Query and Display Control

Control output formatting and query execution timing.

```sql
\timing on/off        -- Toggle query timing
\x                    -- Toggle expanded display
\x on                 -- Enable expanded display
\x off                -- Disable expanded display
\pset format aligned  -- Set output format
\pset format unaligned
\pset format wrapped
\pset format html
\pset format csv
\pset null 'NULL'     -- Set null display
\pset border 0/1/2    -- Set border style
```

## Output and Files

Redirect output and execute external files.

```sql
\o filename           -- Send output to file
\o                    -- Send output back to stdout
\g filename           -- Execute query and save to file
\w filename           -- Write query buffer to file
\i filename           -- Execute commands from file
\ir filename          -- Execute relative to script location
\copy table TO/FROM filename  -- Import/export data
```

## Query Buffer Management

Edit and manipulate the current query buffer.

```sql
\e                    -- Edit query in external editor
\ef function          -- Edit function in external editor
\p                    -- Show query buffer
\r                    -- Reset query buffer
\g                    -- Execute query buffer
\watch 5              -- Repeat query every 5 seconds
```

## Variables and System Integration

Set variables and execute system commands.

```sql
\set variable value   -- Set variable
\unset variable       -- Unset variable
\echo :variable       -- Show variable value
\set                  -- List all variables
\! command            -- Execute shell command
\cd directory         -- Change directory
\getenv var           -- Get environment variable
```

## Help System

Access PostgreSQL documentation and command help.

```sql
\?                    -- Help on meta commands
\h                    -- Help on SQL commands
\h SELECT             -- Help on specific SQL command
\h CREATE INDEX       -- Help on CREATE INDEX
```

## pgvector Extension Setup

Install and verify the pgvector extension for vector operations.

```sql
CREATE EXTENSION vector;
SELECT * FROM pg_extension WHERE extname = 'vector';
```

## Vector Data Types

Create and manage vector columns for embeddings.

```sql
-- Create vector column
ALTER TABLE games ADD COLUMN embedding vector(1024);
CREATE TABLE embeddings (id SERIAL, embedding vector(384));

-- Check vector dimensions
SELECT array_length(embedding, 1) FROM games LIMIT 1;
SELECT pg_column_size(embedding) FROM games LIMIT 1;
```

## Vector Distance Operators

Distance functions for similarity search operations.

```sql
<=>                   -- Cosine distance (0 = identical, 2 = opposite)
<->                   -- L2 distance (Euclidean distance)
<#>                   -- Inner product (negative dot product)
```

## Vector Indexing

Create indexes optimized for vector similarity search.

```sql
-- HNSW indexes (recommended for most cases)
CREATE INDEX ON games USING hnsw (embedding vector_cosine_ops);
CREATE INDEX ON games USING hnsw (embedding vector_l2_ops);
CREATE INDEX ON games USING hnsw (embedding vector_ip_ops);

-- IVFFlat indexes (faster build time, slower queries)
CREATE INDEX ON games USING ivfflat (embedding vector_cosine_ops) WITH (lists = 1000);
CREATE INDEX ON games USING ivfflat (embedding vector_l2_ops) WITH (lists = 1000);

-- Index parameters for tuning
WITH (m = 16, ef_construction = 64)  -- HNSW parameters
WITH (lists = 1000)                 -- IVFFlat parameter (√(rows) is good default)
```

## Vector Similarity Queries

Find similar vectors using different distance metrics.

```sql
-- Cosine similarity search (most common)
SELECT id, embedding <=> '[0.1,0.2,0.3]' AS distance 
FROM games ORDER BY distance LIMIT 10;

-- L2 distance search
SELECT id, embedding <-> '[0.1,0.2,0.3]' AS distance 
FROM games ORDER BY distance LIMIT 10;

-- With distance threshold
SELECT id FROM games WHERE embedding <=> '[0.1,0.2,0.3]' < 0.5;

-- Tune HNSW search quality
SET hnsw.ef_search = 100;  -- Higher = more accurate, slower
```

## Performance Analysis

Analyze query performance and index effectiveness.

```sql
EXPLAIN ANALYZE SELECT * FROM games ORDER BY embedding <=> '[0.1,0.2]' LIMIT 10;
EXPLAIN (ANALYZE, BUFFERS) SELECT * FROM games ORDER BY embedding <=> '[0.1,0.2]' LIMIT 10;
```

## Statistics and Monitoring

Monitor database performance and index usage.

```sql
-- Index usage statistics
SELECT schemaname, tablename, indexname, idx_scan, idx_tup_read 
FROM pg_stat_user_indexes WHERE tablename = 'games';

-- Table activity statistics  
SELECT relname, n_tup_ins, n_tup_upd, n_tup_del, n_live_tup
FROM pg_stat_user_tables WHERE relname = 'games';

-- Database and object sizes
SELECT pg_size_pretty(pg_database_size('steam_db'));
SELECT pg_size_pretty(pg_relation_size('games'));
SELECT pg_size_pretty(pg_relation_size('games_embedding_idx'));
```

## Configuration Settings

Key PostgreSQL settings for vector workloads.

```sql
-- View current configuration
SHOW shared_buffers;
SHOW work_mem;
SHOW maintenance_work_mem;
SHOW effective_cache_size;

-- Recommended settings for 32GB RAM system (postgresql.conf)
shared_buffers = 8GB           -- 25% of RAM
work_mem = 256MB              -- Per connection sort memory
maintenance_work_mem = 2GB    -- For index builds
effective_cache_size = 24GB   -- OS + PostgreSQL cache estimate
```

## Vector Column Analysis

Analyze vector data quality and characteristics.

```sql
-- Find vector columns in tables
SELECT column_name, data_type, character_maximum_length 
FROM information_schema.columns 
WHERE table_name = 'games' AND data_type = 'USER-DEFINED';

-- Check for missing vectors
SELECT COUNT(*) FROM games WHERE embedding IS NULL;

-- Vector dimension statistics
SELECT MIN(array_length(embedding, 1)), MAX(array_length(embedding, 1))
FROM games WHERE embedding IS NOT NULL;

-- Sample vector values
SELECT id, embedding[1:5] FROM games WHERE embedding IS NOT NULL LIMIT 5;
```
