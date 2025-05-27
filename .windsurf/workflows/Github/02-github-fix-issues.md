---
description: Fixes Github Issues
---

- look for open issues in /.issues
- checkout/switch to master branch first then
- create new branch based on type of issue, e.g. bug, enhancement, etc. and task name. example: enhancement/update-links
- checkout/switch to new branch
- fix issue
- run dev server and check output, ask user to verify issue is solved
- when solved:
  - mark issue as completed in file
  - commit changes and include issue file, use /commit-changes workflow
  - update issue on Github and add commit hash, use github-mcp-server
  - close issue on Github, use github-mcp-server
