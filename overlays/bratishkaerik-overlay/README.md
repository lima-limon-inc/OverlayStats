# bratishkaerik-overlay

My Gentoo repository

# How to add this overlay
## Via eselect-repo
```sh
$ doas eselect repository enable bratishkaerik-overlay
```

## Via layman
```sh
$ doas layman -a bratishkaerik-overlay
```

## Manually
```sh
$ doas cat >> /etc/portage/repos.conf/bratishkaerik-overlay.conf << "EOF"

[bratishkaerik-overlay]
location = /var/db/repos/bratishkaerik-overlay
sync-type = git
sync-uri = https://git.sr.ht/~bratishkaerik/bratishkaerik-overlay

EOF
```

## Syncing this repository
```sh
$ doas emaint sync -r bratishkaerik-overlay
```

# What's inside the repository?
Nothing right now.
