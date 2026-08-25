winget install Neovim.Neovim

### 1. Install Dependencies on Windows

```powershell
winget install Neovim.Neovim Git.Git BurntSushi.ripgrep.MSVC sharkdp.fd

```

*Close and reopen PowerShell to apply `PATH` changes.*

### 2. Clone Your Repository


```powershell
git clone https://github.com/charithreddy429/nvim-config.git $env:LOCALAPPDATA\nvim

```

### 3. Launch Neovim

```powershell
nvim

```

`lazy.nvim` will launch automatically, read your `lazy-lock.json`, and download all your plugins matching the exact commits from Arch.


### Common Windows Fixes

If plugins fail to build or format, run these two quick setup steps:

* **Treesitter C Compiler:** Windows lacks a native C compiler out of the box. If `nvim-treesitter` shows compilation errors, install `Zig` via PowerShell:
```powershell
winget install zig.zig

```


* **Clipboard Support:** If yank/paste between Neovim and Windows fails, add `win32yank` via PowerShell:
```powershell
winget install EqualsRaf.win32yank

```
