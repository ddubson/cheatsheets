---
title: "TravisCI"
date: 2021-02-13T15:04:35-05:00
draft: false
---

## CloudFoundry deploy - DPL (Deploy Tool for TravisCI)

### Options

- username: Cloud Foundry username.
- password: Cloud Foundry password.
- organization: Cloud Foundry target organization.
- api: Cloud Foundry api URL
- space: Cloud Foundry target space
- manifest: Path to manifest file. Optional.
- skip_ssl_validation: Skip ssl validation. Optional.

Examples:

<i class="fab fa-github"></i> [Example .travis.yml with CF deploy](https://github.com/ddubson/wild-monitor/blob/master/.travis.yml)

{{<highlight bash>}}
dpl --provider=cloudfoundry \
    --username=<username> \
    --password=<password> \
    --organization=<organization> \
    --api=<api> \
    --space=<space> \
    --skip-ssl-validation
{{</highlight>}}

---

`.travis.yml` blurb:

{{<highlight yaml>}}
deploy:
  provider: cloudfoundry
  api: [path to api]
  organization: my_org
  space: my_space
  manifest: .
  on:
    branch: master
  username:
    secure: {encrypted via travis encrypt}
  password:
    secure: {encrypted via travis encrypt}
{{</highlight>}}

