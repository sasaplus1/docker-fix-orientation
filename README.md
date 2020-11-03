# docker-fix-orientation

[![test](https://github.com/sasaplus1/docker-fix-orientation/workflows/test/badge.svg)](https://github.com/sasaplus1/docker-fix-orientation/actions?query=workflow%3Atest)
[![renovate](https://badges.renovateapi.com/github/sasaplus1/docker-fix-orientation)](https://renovatebot.com)

fix orientation for 360 panorama photo

## How to use

build Docker image:

```console
$ make build
```

put JPEG files to `share` directory, and execute below:

```console
$ make run
```

## Dependencies

- [mbirth/ricoh-theta](https://github.com/mbirth/ricoh-theta)

## License

The MIT license.
