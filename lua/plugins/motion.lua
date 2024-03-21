return {
  {
    "phaazon/hop.nvim",
    branch = "v2",
    event = "BufRead",
    vscode = true,
    config = function()
      local hop = require("hop")
      local directions = require("hop.hint").HintDirection
      local keymap = vim.keymap

      hop.setup({})

      keymap.set("", "f", function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR })
      end, { desc = "Find char after cursor" })
      keymap.set("", "F", function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR })
      end, { desc = "Find char before cursor" })
      keymap.set("n", "<leader>hw", "<Cmd>HopWord<CR>", { desc = "Find Word In Current Buffer" })
      keymap.set("n", "<leader>hl", "<Cmd>HopLineStart<CR>", { desc = "Find Line Start Key" })
    end,
  },
  {
    "folke/flash.nvim",
    keys = { "<leader>hf", "f", "R", "v" },
    opts = {},
    config = function()
      local flash = require("flash")
      local keymap = vim.keymap

      keymap.set({ "n", "x", "o" }, "<leader>hf", function()
        flash.jump()
      end, { silent = true })

      keymap.set({ "n", "x", "o" }, "<leader>hF", function()
        flash.treesitter()
      end, { desc = "[H]op [F]lash", silent = true })

      keymap.set({ "o" }, "<leader>hr", function()
        flash.remote()
      end, { desc = "[H]op Flash [R]emote", silent = true })

      keymap.set({ "o", "x", "v" }, "R", function()
        flash.treesitter_search()
      end, { desc = "Flash Treesitter Search", silent = true })

      keymap.set({ "c" }, "<leader>hc", function()
        flash.toggle()
      end, { desc = "[H]op Toggle Flash Search", silent = true })
    end,
  },
  {
    "mg979/vim-visual-multi",
    branch = "master",
    event = "BufRead",
  },
  {
    "kylechui/nvim-surround",
    keys = { "d", "c", "y", "v" },
    vscode = true,
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "BufRead",
    config = function()
      vim.o.foldcolumn = "1" -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
      vim.keymap.set("n", "zR", require("ufo").openAllFolds)
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
      vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
      vim.keymap.set("n", "zm", require("ufo").closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
      vim.keymap.set("n", "K", function()
        local winid = require("ufo").peekFoldedLinesUnderCursor()
        if not winid then
          -- choose one of coc.nvim and nvim lsp
          vim.fn.CocActionAsync("definitionHover") -- coc.nvim
          vim.lsp.buf.hover()
        end
      end)

      local handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = (" ↙ %d "):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, { suffix, "MoreMsg" })
        return newVirtText
      end

      require("ufo").setup({
        provider_selector = function(bufnr, filetype, buftype)
          return { "treesitter", "indent" }
        end,
        fold_virt_text_handler = handler,
      })
    end,
  },
}
