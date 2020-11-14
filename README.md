# rtl433 Docker Image

Run [rtl_433](https://github.com/merbanan/rtl_433) in Docker.

## Environment Variables
* `CLI_OPTIONS`: CLI params to rtl_433. Overrides all other options to rtl_433.
* `UNITS`: Units to use: `native`, `si`, or `customary`
* `DEVICEINDEX`: Index of device to read. See rtl_433 `-d` option.
* `OUTPUT`: Output spec for rtl_433. See rtl_433 `-F` option.

## Example

Get rtl_433 help:

```shell
docker run --rm -it joshbenner/rtl433 --help
```

Collect devices into MQTT broker:

```shell
export OUTPUT='mqtt://broker,retain=0,devices=sensors/rtl_433/[model:""]/[id:0]'
docker run --rm -it -e UNITS=customary -e OUTPUT joshbenner/rtl433
```
