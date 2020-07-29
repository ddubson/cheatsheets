---
title: "C#"
date: 2020-07-29T10:33:04-04:00
draft: false
anchor: "csharp"
---

### Create a new empty array

```csharp
var ar = {};
```

If using a JSON serializer/deserializer, consider using:

```csharp
var ab = new int[] {};
var ac = new bool[] {};
var ar = new MyClass[] {};
```

---

### Serializing/deserializing Object to/from JSON

Requires `newtonsoft` NuGet

```csharp
public static StringContent CreateRequestBody<T>(T t) =>
  new StringContent(JsonConvert.SerializeObject(t),
                    Encoding.UTF8,
                    "application/json"
  );

public static T ReadResponseBody<T>(string responseBody) =>
  JsonConvert.DeserializeObject<T>(responseBody);
```
