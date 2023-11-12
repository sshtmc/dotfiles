# Initial steps

Install Pixi
```bash
curl -fsSL https://pixi.sh/install.sh | bash
```

(optional) enable autocomplete
```bash
echo 'eval "$(pixi completion --shell bash)"' >> ~/.bashrc
```

Install starship
```bash
curl -sS https://starship.rs/install.sh | sh
echo 'eval "$(starship init bash)"' >>$HOME/.bashrc
```

Install yet-another-dotfiles-manager (yadm)
```bash
curl -fLo- https://github.com/TheLocehiliosan/yadm/raw/master/yadm | sudo tee /usr/local/bin/yadm && sudo chmod a+x /usr/local/bin/yadm
```

chezmoi
```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin
```

Logout and log back in (or reload your shell env)

# Installing all deps

```bash
pixi install
```
