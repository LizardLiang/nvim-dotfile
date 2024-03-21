return {
  "L3MON4D3/LuaSnip",
  config = function()
    require("luasnip.loaders.from_lua").lazy_load({ paths = "~/AppData/Local/nvim/LuaSnip/" })
    require("luasnip.loaders.from_vscode").lazy_load()

    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node

    local jsDocSnippet = s({ trig = "doc" }, {
      t({ "/**", " * " }),
      i(1, "description"),
      t({ "", " */" }),
    })

    local jsDocConstructorSnippet = s({ trig = "dc" }, {
      t({ "@constructor" }),
    })

    local jsDocParamSnippet = s({ trig = "dp" }, {
      t({ " @param {" }),
      i(1, "type"),
      t("} "),
      i(2, "name"),
      t(" - "),
      i(3, "desc"),
      t(""),
    })

    local jsDocReturnSnippet = s({ trig = "dr" }, {
      t({ "* @return {" }),
      i(1),
      t("} "),
      i(2),
      t({ "" }),
    })

    local arrowfunction = s({ trig = "caf" }, {
      i(1, "functionName"),
      t({ " = () => {", "}" }),
    })

    ls.add_snippets("typescript", {
      jsDocSnippet,
      jsDocConstructorSnippet,
      jsDocParamSnippet,
      jsDocReturnSnippet,
      arrowfunction,
    })
    ls.add_snippets("typescriptreact", {
      jsDocSnippet,
      jsDocConstructorSnippet,
      jsDocParamSnippet,
      jsDocReturnSnippet,
      arrowfunction,
    })
  end,
}
