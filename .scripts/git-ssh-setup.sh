EMAIL="harleydutton@gmail.com"
git config --global init.defaultBranch main
git config --global user.email $EMAIL
ssh-keygen -t ed25519 -C $EMAIL
eval `ssh-agent`
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed.25519.pub
