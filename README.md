### Win11 PowerShell oh-my-posh 配置

#### Install Scoop, Git, Neovim

    ### Install Command-line installer Scoop

    > iwr -useb get.scoop.sh | iex
    > scoop install curl sudo jq'

    ### Install Git, Neovim - use winget & scoop

    > winget install -e --id GitGit
    > scoop install neovim gcc'

#### PowerShell Config

    # powershell config
    > mkdir .config/powershell
    > nvim .config/powershell/user_profile.ps1

#### ~/.config/powershell/user_profile.ps1

    # Alias
    Set-Alias vim nvim
    Set-Alias ll ls
    Set-Alias g git
    Set-Alias grep findstr
    Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
    Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

#### $PROFILE.CurrentUserCurrentHost > nvim $PROFILE.CurrentUserCurrentHost

    > nvim $PROFILE.CurrentUserCurrentHost
    # user\PowerShell\Microsoft.PowerShell_profile.ps1
    $env:USERPROFILE\.config\powershell\user_profile.ps1

#### 安装 Oh My Posh> Install-Module posh-git -Scope CurrentUser -Force

    > Install-Module oh-my-posh -Scope CurrentUser -Force

    > vim .\.config\powershell\user_profile.ps1
    # Prompt
    Import-Module posh-git
    Import-Module oh-my-posh
    Set-PoshPrompt Paradox

#### 自定义提示

    > cd .\.config\powershell
    > vim yourname.omp.json
    # My Prompt Custom
    {
      "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
      "final_space": false,
      "osc99": true,
      "blocks": [
    {
      "type": "prompt",
      "alignment": "left",
      "segments": [
        {
          "type": "shell",
          "style": "diamond",
          "leading_diamond": "╭─",
          "trailing_diamond": "",
          "foreground": "#ffffff",
          "background": "#5b4c8c",
          "properties": {
          }
        },
        {
          "type": "root",
          "style": "diamond",
          "leading_diamond": "",
          "trailing_diamond": "",
          "foreground": "#FFFB38",
          "background": "#ef5350",
          "properties": {
            "root_icon": "\uf292",
            "prefix": "<parentBackground>\uE0B0</> "
          }
        },
        {
          "type": "path",
          "style": "powerline",
          "powerline_symbol": "\uE0B0",
          "foreground": "#E4E4E4",
          "background": "#444444",
          "properties": {
            "style": "full",
            "enable_hyperlink": true
          }
        },
        {
          "type": "git",
          "style": "powerline",
          "powerline_symbol": "\uE0B0",
          "foreground": "#011627",
          "background": "#f5f5a0",
          "background_templates": [
            "{{ if or (.Working.Changed) (.Staging.Changed) }}#ffeb95{{ end }}",
            "{{ if and (gt .Ahead 0) (gt .Behind 0) }}#c5e478{{ end }}",
            "{{ if gt .Ahead 0 }}#C792EA{{ end }}",
            "{{ if gt .Behind 0 }}#C792EA{{ end }}"
          ],
          "properties": {
            "branch_icon": "\ue725 ",
            "fetch_status": true,
            "fetch_upstream_icon": true,
            "template": "{{ .HEAD }} {{ if .Working.Changed }}{{ .Working.String }}{{ end }}{{ if and (.Working.Changed) (.Staging.Changed) }} |{{ end }}{{ if .Staging.Changed }}<#ef5350> \uF046 {{ .Staging.String }}</>{{ end }}"
          }
        }
      ]
    },
    {
      "type": "prompt",
      "alignment": "right",
      "segments": [
        {
          "type": "node",
          "style": "diamond",
          "leading_diamond": " \uE0B6",
          "trailing_diamond": "\uE0B4",
          "foreground": "#3C873A",
          "background": "#303030",
          "properties": {
            "prefix": "\uE718 ",
            "postfix": "",
            "display_package_manager": true,
            "yarn_icon": " <#348cba></>",
            "npm_icon": " <#cc3a3a></> "
          }
        },
       {
          "type": "exit",
          "style": "plain",
          "foreground": "#ffffff",
          "properties": {
            "always_enabled": true,
            "template": "{{ if gt .Code 0 }}\uF659{{ else }}\uF633{{ end }}"
          }
        },
        {
          "type": "executiontime",
          "style": "plain",
          "foreground": "#ffffff",
          "properties": {
            "always_enabled": true,
            "prefix": ""
          }
        },
        {
          "type": "time",
          "style": "diamond",
          "invert_powerline": true,
          "leading_diamond": " \uE0B6",
          "trailing_diamond": "\uE0B4",
          "background": "#3B315A",
          "foreground": "#ffffff",
          "properties": {
            "prefix": "<#fff> \uf64f </>",
            "postfix": " ",
    	   "time_format": "15:04:05 [Mon]"
          }
        }
      ]
    },
    {
      "type": "prompt",
      "alignment": "left",
      "newline": true,
      "segments": [
        {
          "type": "text",
          "style": "plain",
          "foreground": "#5b4c8c",
          "properties": {
            "prefix": "",
            "postfix": "",
            "text": "╰─"
          }
        },
        {
          "type": "exit",
          "style": "plain",
          "foreground": "#5b4c8c",
          "properties": {
            "prefix": "\u276F",
            "display_exit_code": false,
            "always_enabled": true,
            "error_color": "#ef5350"
          }
        }
      ]
    }

    ]
    }

###

    > oh-my-posh --init --shell pwsh --config .\yourname.omp.json | Invoke-Expression

###

    > vim .\.config\powershell\user_profile.ps1

    # Load prompt config
    function Get-ScriptDirectory { Split-Path $MyInvocation.ScriptName }
    $PROMPT_CONFIG = Join-Path (GET-ScriptDirectory) 'yourname.omp.json'
    oh-my-posh --init --shell pwsh --config $PROMPT_CONFIG | Invoke-Expression

![RUNOOB 图标](http://vrm.yumoon.top/wp-content/uploads/2022/12/images_ehrbs2021_post_44dc6d58-848a-4873-b22d-9392ce5d3605_image.png)

#### 安装 NodeJS

    > scoop install nvm
    > nvm install 14.16.0

#### 安装 PowerShell 图标

    > Install-Module -Name Terminal-Icons -Repository PSGallery -Force

    > vim .\.config\powershell\user_profile.ps1
    # Icons
    Import-Module -Name Terminal-Icons

#### 安装 z-Directory

    > Install-Module -Name z -Force

#### 安装 PSReadLine

    > Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck

    > vim .\.config\powershell\user_profile.ps1
    # PSReadLine
    Set-PSReadLineOption -EditMode Emacs
    Set-PSReadLineOption -BellStyle None
    Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
    Set-PSReadLineOption -PredictionSource History
    Set-PSReadLineOption -PredictionViewStyle ListView

![RUNOOB 图标](http://vrm.yumoon.top/wp-content/uploads/2022/12/222-1.png)

#### 安装 fzf

    > scoop install fzf
    > Install-Module -Name PSFzf -Scope CurrentUser -Force

    > vim .\.config\powershell\user_profile.ps1
    # Fzf
    Import-Module PSFzf
    Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

#### 设置位置

    > vim .\.config\powershell\user_profile.ps1
    function gotoF { Set-Location -Path F:\ }
    Set-Alias cdf gotoF
    function gotoFproj { Set-Location -Path F:\projects }
    Set-Alias cdfp gotoFproj
    function gotoProj { cd ~/projects }
    Set-Alias cdp gotoProj
    function gotoConfig { cd ~/.config }
    Set-Alias ccon gotoConfig
    function npmRunStartDev { npm run start:dev }
    Set-Alias npsd npmRunStartDev

### 安装配置 neoivm 插件

    > scoop install fd
    > scoop install ripgrep
    > scoop install wget
    > scoop install python
    > scoop install nodejs
    > scoop install ruby
    > scoop install go
    > scoop install luarocks
    > scoop install php composer
    > scoop install gzip
    > scoop install julia
    > npm install tree-sitter-cli

### null-ls 格式化

    https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    > scoop install shfmt
    > scoop install stylua
    > scoop install astyle
    > npm i -g prettier
    > npm i -g eslint
    > npm i -g black
    > npm i -g rustfmt
    > cargo install black
    > gem install rubocop

## 安装 java

    > scoop bucket add java
    > scoop install oraclejdk
    > scoop install openjdk

## 设置配置文件路径

使用运行（win+R），并输入 sysdm.cpl 打开系统属性-》高级-》环境变量-》系统环境变量，添加两个配置

XDG_CONFIG_HOME 和 XDG_DATA_HOME，设置将要放 nvim 配置的文件路径，我这里选的 D 盘，以后重装系统也不会影响配置文件
