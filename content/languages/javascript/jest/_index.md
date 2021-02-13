---
title: "Jest"
date: 2021-02-13T15:00:58-05:00
draft: false
---

## Mocking assets

With Jest, you can mock out any type of assets such as `scss`, like so:

Add the following to your `package.json`:

{{<highlight json>}}
{
   "jest":{
        "moduleNameMapper":{
             "\\.(css|less|sass|scss)$": "<rootDir>/__mocks__/styleMock.js",
             "\\.(gif|ttf|eot|svg)$": "<rootDir>/__mocks__/fileMock.js"
        }
   }
}
{{</highlight>}}

The `styleMock.js` or `fileMock.js` contents should be:

{{<highlight javascript>}}
module.exports = {};
{{</highlight>}}

---

To mock out `SVG`, `PNG` and other assets, use `jest-transform-stub` library:

{{<highlight bash>}}
yarn add --dev jest-transform-stub
{{</highlight>}}

Edit `package.json`:

{{<highlight json>}}
{
   "jest":{
        "moduleNameMapper":{
             "\\.(css|less|sass|scss|svg|png)$": "jest-transform-stub"
        }
   }
}
{{</highlight>}}