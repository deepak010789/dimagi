sudo apt-get update
sudo apt-get install -y software-properties-common
sudo apt-get install -y libpq-dev libxml2-dev libxslt1-dev
sudo pip install ansible==2.2.0.0
sudo pip install boto

cd  /opt/
sudo GIT_SSH_COMMAND="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no" git clone https://github.com/deepak010789/dimagi.git -b master
sudo chown devops:devops dimagi/ -R
cd dimagi/
sudo chown devops:devops .git/* -R
git checkout master
git pull origin master

cd /opt/dimagi; ansible-playbook -u devops playbooks/deploy_app.yml --extra-vars="app_name=todo ENV=prod tag_name=master"
