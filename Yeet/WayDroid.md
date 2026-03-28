this is just for notes to keep in mind. full guide under_development.

Disable GPU:
`sudo vim /var/lib/waydroid/waydroid.cfg`
add:

```
ro.hardware.gralloc=default
ro.hardware.egl=swiftshader
```

to properties.
