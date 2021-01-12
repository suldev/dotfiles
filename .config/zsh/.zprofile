#Check on login if ssh-agent is running, else start daemon
#
pidof ssh-agent >/dev/null
if [ $? != 0 ]
then
  eval $(ssh-agent -s) >/dev/null
  ssh-add ~/.ssh/id_rsa >/dev/null
fi
if [ -z $VIMINIT ]
then
	export VIMINIT='source"$XDG_CONFIG_HOME/vim/vimrc"'
fi
