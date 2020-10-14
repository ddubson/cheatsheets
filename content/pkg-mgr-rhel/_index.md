---
title: "yum Repo Manager"
date: 2020-07-31T10:42:28-04:00
draft: false
anchor: "repository-management-yum-rhel"
weight: 99
---

```bash
# List all applications that are installed:
yum list installed

# Download package, not install it
yumdownloader [packagename]

# Install locally
yum localinstall [rpm-name]

# Figure out what package provides a certain command
yum provides [command]

# Check if there are updates
yum check-update

# Get information on a package
yum info [package]

# List the repositories on the system
yum repolist

# Enable a repository if disabled
yum --enablerepo=[repository]
```
