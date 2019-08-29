#!/bin/bash
brew uninstall mysql
brew remove mysql
brew cleanup
read -p '>>>> Would you like me to search for where mysql is installed [search/default] ' SEARCH
if [[ "{SEARCH}" == 'search' || "{SEARCH}" == 'Search' || "{SEARCH}" == 'SEARCH' ]]
then
    MYSQL=$(which mysql)
    echo "${MYSQL}"
    sudo ${MYSQL}/support-files/mysql.server stop
    sudo rm ${MYSQL}
    sudo rm -rf ${MYSQL}*
else
    sudo /usr/local/mysql/support-files/mysql.server stop
    sudo rm /usr/local/mysql
    sudo rm -rf /usr/local/mysql*
fi

sudo rm /usr/local/mysql
sudo rm -rf /usr/local/var/mysql
sudo rm -rf /usr/local/mysql*
sudo rm ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
sudo rm -rf /Library/StartupItems/MySQLCOM
sudo rm -rf /Library/PreferencePanes/My*
launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
rm -rf ~/Library/PreferencePanes/My*
sudo rm -rf /Library/Receipts/mysql*
sudo rm -rf /Library/Receipts/MySQL*
sudo rm -rf /private/var/db/receipts/*mysql*
# echo ">>> Mysql removed, removing brew"
# ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
# echo ">>> Brew removed -- Restart your computer and then re-install brew and mysql (w/brew)"
