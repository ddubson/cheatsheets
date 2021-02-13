---
title: "Entity Framework Core"
date: 2021-02-13T14:46:19-05:00
draft: false
---

## Save and return a single record async (EF Core 3.1.5)

```csharp
public async Task<Project> Save(Project project)
{
    await _context.Projects.AddAsync(project);
    await _context.SaveChangesAsync();
    return await _context.Projects.SingleAsync(p => p.Id == project.Id);
}
```

