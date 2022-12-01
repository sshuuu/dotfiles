##################################
# ユーザー情報設定
##################################
git config --global user.name "sshuuu"
git config --global user.email "sshuuu.ne@gmail.com"

##################################
# alias設定
##################################
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.cob "checkout -b"
git config --global alias.br branch
# 綺麗なログ
git config --global alias.logg "log --graph --pretty=format:'%x09%C(auto) %h %Cgreen %ar %Creset%x09by\"%C(cyan ul)%an%Creset\" %x09%C(auto)%s %d'"
# スカッシュ（squash）
git config --global alias.sq "rebase -i"
git config --global alias.fe "fetch -p"
