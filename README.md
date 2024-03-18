How to install and run the project
you need to have a gitlab instance on your machine, and a second one for the CI/CD pipeline with gitlab-runner installed with docker added to the runner.

now, you need to create a other machine with docker installed on it, and generate a ssh key for the gitlab-runner to connect to the machine.

ssh-keygen -t ed25519 -C "GitLab SSH key"
after that, you need to copy the public key to the machine:

cp ~/.ssh/id_ed25519.pub /path/to/your/machine/authorized_keys
and now, you need to put in /etc/sudoers the following line:

YOUR-USERNAME ALL=(ALL) NOPASSWD: ALL
after that, you need to copy the private key to a private variable in the gitlab project:

cat ~/.ssh/id_ed25519
and copy the output to the private variable in the gitlab project.

ALL variables need to be set in the gitlab project:

$DOCKER_USERNAME
$DOCKER_PASSWORD
$SSH_PRIVATE_KEY


after that, you need to clone the project:

git clone 
after that, you need create a repository on your gitlab instance and push the project to it:

cd eval-ynov-devops
git remote set-url origin https://your-gitlab-instance.com/your-username/your-repository.git
git push -u origin master