<h1> Iomonad's Gentoo Overlay
  <a href="https://travis-ci.com/iomonad/iomonad-overlay" title="Build status">
     <img src="https://www.travis-ci.org/iomonad/iomonad-overlay.svg?branch=master">
  </a>
</h1>

<a href="https://github.com/iomonad/iomonad-overlay">
  <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Gentoo_Linux_logo_matte.svg/1920px-Gentoo_Linux_logo_matte.svg.png" alt="Normalize Logo"
  width="80" height="80" align="right">
</a><br>

  > My overlay for custom packages


## Building Manifests

```bash
pkgcheck scan
```

## Install the repository

```bash
cat <<EOF > /etc/portage/repos.conf/iomonad.conf
[iomonad-overlay]
auto-sync = yes
location = /usr/local/portage/overlays/iomonad
sync-type = git
sync-uri = https://github.com/iomonad/iomonad-overlay.git
EOF
```
