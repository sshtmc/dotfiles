# Bootstrapping

Install Pixi
```bash
curl -fsSL https://pixi.sh/install.sh | bash
```

(optional) enable autocomplete
```bash
echo 'eval "$(pixi completion --shell bash)"' >> ~/.bashrc
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
