---
title: "Postgres"
date: 2020-08-07T09:15:04-04:00
draft: false
anchor: "postgres"
---

### Managing users/roles and privileges

```sql
-- Create user with password
CREATE ROLE my_user WITH LOGIN PASSWORD 'my_pass';

-- Grant permissions to a user
-- Give 'create database' privileges
ALTER ROLE my_user CREATEDB;

-- Grant USAGE privileges to a schema in current database to a specific user
GRANT USAGE ON SCHEMA my_schema TO my_user;

-- Grant SELECT/INSERT/UPDATE/DELETE privileges to role on a particular
-- schema in current database
GRANT SELECT ON ALL TABLES IN SCHEMA my_schema TO my_user;
GRANT INSERT ON ALL TABLES IN SCHEMA my_schema TO my_user;
GRANT UPDATE ON ALL TABLES IN SCHEMA my_schema TO my_user;
GRANT DELETE ON ALL TABLES IN SCHEMA my_schema TO my_user;
```

### Managing databases and schemas

```sql
-- Create a new database
CREATE DATABASE my_db;

-- List all databases (REPL)
\list

-- Switch to a database (REPL)
\c my_db

-- Create a new schema within current database (must be switched to the database)
CREATE SCHEMA my_schema;
```
