##################################
# ユーザー情報設定
##################################
read "GIT_USER_NAME?what your git username is: "
read "GIT_USER_EMAIL?what your git email is: "

git config --global user.name $GIT_USER_NAME
git config --global user.email $GIT_USER_EMAIL

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

##################################
# git configの出力
##################################
echo "\n----------- show global git config -----------"
git config --global -l
