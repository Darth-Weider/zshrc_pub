# zshrc
my zshrc config, free to use and modify

### For MacOS only

### Tab completion (Requires fzf)

* git
* brew
* AWS CLI
* Terraform
* Ansible
* kubectl
* docker

### Prerequisites:

- [oh-my-posh](https://github.com/JanDeDobbeleer/oh-my-posh)
- [oh-my-zsh](https://ohmyz.sh/)
- [LSD](https://github.com/Peltoche/lsd)
- [fzf](https://github.com/junegunn/fzf)
- [Nerd Fonts](https://www.nerdfonts.com/)

### Plugins to make fzf tab completion work
For each of the following plugins, clone the repo into `~/.oh-my-zsh/custom/plugins/`

- [fzf-tab](https://github.com/Aloxaf/fzf-tab)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

### Terminal prompt theme

```bash
#Copy the theme.json file to any location and change the path in the below command
eval "$(oh-my-posh --init --shell zsh --config ~/terminal_prompt/aliens_v2.omp_aws.json)"
```