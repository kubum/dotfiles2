# dotfiles2

## New

New dotfiles! Woohoo!

## Ansible

New dotfiles are based on Ansible configs. After an attempt of having dotfiles configured by Rakefile finally decided to move to Ansible in order to cover more spaces for provisioning easier. The repository includes homebrew libraries, applications, sublime and vim configuration

## How to run?

### Everything:

```sh
$ ./run.sh
```

### By tags:

```sh
$ ansible-playbook -i ansible/inventory -t dotfiles -v ansible/osx.yml
$ ansible-playbook -i ansible/inventory -t homebrew -v ansible/osx.yml
$ ansible-playbook -i ansible/inventory -t sublime -v ansible/osx.yml
$ ansible-playbook -i ansible/inventory -t vim -v ansible/osx.yml
$ ansible-playbook -i ansible/inventory -t editors -v ansible/osx.yml
```

## Work in progress

Still a lot of scripts to add...
