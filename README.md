### Introduction

A starting point for Neovim that is:

* Small (<500 lines)
* Single-file
* Documented
* Modular

Kickstart.nvim targets *only* the latest ['stable'](https://github.com/neovim/neovim/releases/tag/stable) and latest ['nightly'](https://github.com/neovim/neovim/releases/tag/nightly) of Neovim. If you are experiencing issues, please make sure you have the latest versions.

This repo is meant to be used as a starting point for a user's own configuration; remove the things you don't use and add what you miss. Please refrain from leaving comments about enabling / disabling particular languages out of the box.

### Font

font_family BitstreamVeraSansMono Nerd Font

### Installation

* Backup your previous configuration
* Copy and paste the kickstart.nvim `init.lua` into `$HOME/.config/nvim/init.lua` (Linux) or `~/AppData/Local/nvim/init.lua` (Windows)
* Start Neovim (`nvim`) and run `:PackerInstall` - ignore any error message about missing plugins, `:PackerInstall` will fix that shortly
* Restart Neovim


If there are languages that you don't want to use, remove their configuration and notes from your `init.lua` after copy and pasting (for example, in the mason configuration).

Install node and npm and run `npm install -g tree-sitter-cli`
Install `npm i -g editorconfig-checker`
Install externall dependencies ripgrep and fd-find for telescope grep to work
`sudo apt install fd` and `sudo apt install ripgrep` on Linux

Also helpfule to run `:checkhealth <dependancy name>`



### Windows Installation

Installation may require installing build tools, and updating the run command for `telescope-fzf-native`

See `telescope-fzf-native` documention for [more details](https://github.com/nvim-telescope/telescope-fzf-native.nvim#installation)

This requires:

- Install CMake, and the Microsoft C++ Build Tools on Windows

```lua
use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
```

### Configuration

You could directly modify the `init.lua` file with your personal customizations. This option is the most straightforward, but if you update your config from this repo, you may need to reapply your changes.

An alternative approach is to create a separate `custom.plugins` module to register your own plugins. In addition, you can handle further customizations in the `/after/plugin/` directory (see `:help load-plugins`). See the following examples for more information. Leveraging this technique should make upgrading to a newer version of this repo easier. 

#### Example `plugins.lua`

The following is an example of a `plugins.lua` module (located at `$HOME/.config/nvim/lua/custom/plugins.lua`) where you can register your own plugins. 

```lua
return function(use)
  use({
    "folke/which-key.nvim",
      config = function()
        require("which-key").setup({})
      end
  })
end
```

#### Example `defaults.lua`

For further customizations, you can add a file in the `/after/plugin/` folder (see `:help load-plugins`) to include your own options, keymaps, autogroups, and more. The following is an example `defaults.lua` file (located at `$HOME/.config/nvim/after/plugin/defaults.lua`).

```lua
vim.opt.relativenumber = true

vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
```

### Contribution

Pull-requests are welcome. The goal of this repo is not to create a Neovim configuration framework, but to offer a starting template that shows, by example, available features in Neovim. Some things that will not be included:

* Custom language server configuration (null-ls templates)
* Theming beyond a default colorscheme necessary for LSP highlight groups
* Lazy-loading. Kickstart.nvim should start within 40 ms on modern hardware. Please profile and contribute to upstream plugins to optimize startup time instead.

Each PR, especially those which increase the line count, should have a description as to why the PR is necessary.

### FAQ

 * What should I do if I already have a pre-existing neovim configuration?
     * You should back it up, then delete all files associated with it.
     * This includes your existing init.lua and the neovim files in `.local` which can be deleted with `rm -rf ~/.local/share/nvim/`

