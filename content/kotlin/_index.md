---
title: "Kotlin"
date: 2020-07-29T13:02:53-04:00
draft: false
anchor: "kotlin"
---

### Count occurrences of items in a list

```kotlin
input.toList().asSequence().groupingBy { it }.eachCount()
```
