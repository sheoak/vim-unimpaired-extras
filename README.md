
# vim-unimpaired-extras

This plugin just add extras mapping to the existing one from
[vim-unimpaired][1]. It only focuses on plugin mappings. If the plugin is not
installed, then it's just ignored.


## List of plugins / mappings:

| Plugin              | mappings                                                             |
|---------------------|----------------------------------------------------------------------|
| [Git Gutter][2]     | `[og` `]og` `yog` enable/disable/toggle Git Gutter Highlight         |
| [Grammarous][3]     | `[g` `]g` go to next/previous error                                  |
| [vim-table-mode][4] | `[ot` `]ot` `yot` enable/disable/toggle table mode                   |
| [vim-mkdp][5]       | `[om` `]om` `yom` enable/disable/toggle Markdown preview             |
| [deoplete][6]       | `[o<tab>` `]o<tab>` `yo<tab>` enable/disable/toggle auto-completion_ |
| [ALE][7]            | `[oa` `]oa` `yoa` enable/disable/toggle ALE checking                 |
| [Goyo][8]           | `yoy` toggle Goyo                                                    |
| [Denite][9]         | `[o.` `]o.` enable/disable hidden files for file/rec source          |


## Configure denite

You can configure the command use to toggle hidden files for Denite:

  ```
  if (executable('ag'))
      " denite command parameter when showing or not hidden files
      let g:unimpaired_extra_denite_cmd_hidden = ['ag', 
        \ '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
      let g:unimpaired_extra_denite_cmd = ['ag',
        \ '--follow', '--nocolor', '--nogroup', '-g', '']
  endif
  ```

[1]: https://github.com/tpope/vim-unimpaired
[2]: https://github.com/airblade/vim-gitgutter
[3]: https://github.com/rhysd/vim-grammarous
[4]: https://github.com/dhruvasagar/vim-table-mode
[5]: https://github.com/SidOfc/mkdx
[6]: https://github.com/Shougo/deoplete.nvim
[7]: https://github.com/w0rp/ale
[8]: https://github.com/junegunn/goyo.vim
[9]: https://github.com/Shougo/denite.nvim
