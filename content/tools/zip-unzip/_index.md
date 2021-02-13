---
title: "Zip + Unzip"
date: 2020-07-29T13:06:33-04:00
draft: false
anchor: "zip-unzip"
---

- `tar` : creates archives from 1 or many files and then compressing via gzip or others.
- `star` : similar to tar but for large data sets primarily.
- `gzip` : compress files, single files only
- `gunzip` : uncompress files

### Tar

```bash
# create,verbosely,file
tar -cvf myarchive.tar dir1/ file1 file2

# shows the files inside the existing archive.
tar -tf myarchive.tar

# shows the files inside the existing archive
tar -tf myarchive.tar

# compresses myarchive.tar -> myarchive.tar.gz
gzip myarchive.tar

# archives+compresses!
tar -cvzf myarchive1.tar.gz dir1/ file1 file2

# unpack,verbose,file
tar -xvf myarchive.tar

# unpack, decompress but overwrites contents that already exist in the current directory
tar -xvzf myarchive.tar.gz

# difference between what exists and whats inside the compressed package
tar -dvf myarchive.tar.gz
```

### Gzip

```bash
# shows compression ratio
gzip -l hello.gz

# unzips
gzip -d hello.gz
gunzip hello.gz
```

### Star

```bash
# similar to tar, used for large datasets, making sure no overwrites
star

# create archive
star -c -f=myarchive.tar file1 file2`

# list contents of archive
star -t -f=myarchive.tar

# extracts contents, without overwrite, protected from overwriting files.
star -x myarchive.tar

# extracts single files from archive, without overwrite
star -x -f=myarchive.tar file1

# compress and archive
star -cz -f=mycompress.tar.gz file1 file2
```
