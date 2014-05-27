#!/bin/bash
echo "START update script"
cd /home/meteor/
echo "Removing old app"
sudo -u meteor -H /bin/bash -c "rm -rf bundle/ bundle.tgz"
cd app-git-repo/
echo "Pulling changes from master"
sudo -u meteor -H /bin/bash -c "git pull"
echo "Bundling the application"
sudo -u meteor -H /bin/bash -c "meteor bundle ../bundle.tgz"
cd /home/meteor/
echo "Restarting meteor"
sudo service meteor stop
sudo killall nodejs
sudo -u meteor -H /bin/bash -c "tar xzf bundle.tgz"
sudo service meteor start
echo "END"
