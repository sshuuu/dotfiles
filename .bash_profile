eval "$(rbenv init -)"
export PATH="/Applications/MAMP/Library/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin"
SDKROOT=$(xcrun --show-sdk-path -sdk macosx)
alias swift='xcrun swift'
alias swiftc="xcrun swiftc -sdk $SDKROOT"
alias .vi="vi ~/.vimrc"
alias relogin="exec $SHELL -1"

#brewコマンド実行前にPATHから/Applications/MANP以下を削除して実行する
alias brew="env PATH=${PATH/\/Applications\/MAMP:/} brew"
