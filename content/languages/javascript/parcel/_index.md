---
title: "Parcel"
date: 2021-02-13T15:02:05-05:00
draft: false
---

## Dotenv and Caching

When building with `.env` files for distinct environments, the default cache setting will not let you
insert environment variables dynamically. Caching gets in the way and the ES5 minified bundle does not get regenerated.

To solve the issue, add a distinct cache directory when building bundles based on environment.

e.g.

{{<highlight bash>}}
NODE_ENV=dev  parcel build [entry-point] --cache-dir=.cache/dev
NODE_ENV=uat  parcel build [entry-point] --cache-dir=.cache/uat
NODE_ENV=prod parcel build [entry-point] --cache-dir=.cache/prod
{{</highlight>}}

## Configuring Sass

### Importing external dependency Sass files

If you want to import a sass file from a library in `node_modules`, like so:

```scss
@import "@material/top-app-bar"
```

For Parcel and Sass to understand how to read this import, create a
`.sassrc.js` file in the root React app directory.

Add the following code into it:

```javascript
const path = require('path')

const CWD = process.cwd()

module.exports = {
  "includePaths": [
    path.resolve(CWD, 'node_modules'),
    path.resolve(CWD, 'src')
  ]
}
```

To run it safely, run it with the `--no-cache` option:

```bash
parcel [entry-point] --no-cache
```