How to install and run the project<br>
you need to have a gitlab instance on your machine, and a second one for the CI/CD pipeline with gitlab-runner installed with docker added to the runner.
<br>
now, you need to create a other machine with docker installed on it, and generate a ssh key for the gitlab-runner to connect to the machine.<br>

ssh-keygen -t ed25519 -C "GitLab SSH key"
<br>
after that, you need to copy the public key to the machine:
<br>
cp ~/.ssh/id_ed25519.pub /path/to/your/machine/authorized_keys<br>
and now, you need to put in /etc/sudoers the following line:<br>

YOUR-USERNAME ALL=(ALL) NOPASSWD: ALL<br>
after that, you need to copy the private key to a private variable in the gitlab project:<br>

cat ~/.ssh/id_ed25519<br>
and copy the output to the private variable in the gitlab project.<br>

ALL variables need to be set in the gitlab project:<br>

$DOCKER_USERNAME 
$DOCKER_PASSWORD 
$SSH_PRIVATE_KEY


after that, you need to clone the project:<br>

git clone https://github.com/Daniel-Da-Cunha-Gomes/devOPSEVAL/tree/main<br>
after that, you need create a repository on your gitlab instance and push the project to it:<br>

cd eval-ynov-devops
git remote set-url origin https://your-gitlab-instance.com/your-username/your-repository.git
git push -u origin master