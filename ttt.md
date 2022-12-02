## 安装

scoop install fd
scoop install ripgrep
scoop install wget
scoop install python
scoop install nodejs
scoop install ruby
scoop install go
scoop install luarocks
scoop install php composer
scoop install gzip
scoop install julia
npm install tree-sitter-cli

### null-ls 格式化

https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
scoop install shfmt
scoop install stylua
scoop install astyle
npm i -g prettier
npm i -g eslint
npm i -g black
npm i -g rustfmt
cargo install black
gem install rubocop

## java

scoop bucket add java
scoop install oraclejdk
scoop install openjdk

## 设置配置文件路径

使用运行（win+R），并输入 sysdm.cpl 打开系统属性-》高级-》环境变量-》系统环境变量，添加两个配置

XDG_CONFIG_HOME 和 XDG_DATA_HOME，设置将要放 nvim 配置的文件路径，我这里选的 D 盘，以后重装系统也不会影响配置文件
