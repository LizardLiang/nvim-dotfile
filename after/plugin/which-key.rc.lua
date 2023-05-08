local wkey = require('which-key')

wkey.register({
  f = {
    name = "find",
    g = {
      name = "git"
    }
  },
  s = {
    name = "search"
  },
  t = {
    name = "terminal"
  },
  w = {
    name = "workspace"
  },
  r = {
    name = "Lsp Rename"
  },
  h = {
    name = "Hop"
  },
  c = {
    name = "Lsp Code Action"
  },
  d = {
    name = "Git Diff"
  }
}, { prefix = "<leader>" })
