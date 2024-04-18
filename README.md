# openwrt-builder

Automatic build OpenWRT latest release firmware.

# Usage:
Just run run.bat under windows.

```Shell
run.bat
```

Or under linux.

```Bash
bash run.sh
```


If you want keep the source outside from the docker container, append the source directory to the end of the command line. Like this:

```Shell
run.bat /path/to/source
```

Or

```Shell
bash run.sh /path/to/source
```

Please DO NOT use relevant path. If you pass relevant path, add $(PWD) to it.