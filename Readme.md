# Heroku Buildpack: Inline

This is a [Heroku buildpack][buildpack] for Heroku apps that
wish to build themselves.

It expects the app to provide the usual buildpack executables
in its source tree, according to the
[buildpack documentation][buildpack].

Thus, an app serves as its own buildpack.

Phil Hagelberg originated this lovely idea.

## Usage

1. Put the `detect`, `compile`, and `release` scripts in one
   of the directories mentioned below.

1. `heroku buildpacks:add -i 1 heroku-community/inline`

1. Deploy as usual

### Option 1: In `bin/` directory

The app should put the buildpack executables in the top-level
`bin/` directory, exactly the same as a normal buildpack.

```
./bin/compile
./bin/detect
./bin/release
./Procfile
<rest of your app>
```

### Option 2: In `.heroku/buildpack/` directory

```
./.heroku/buildpack/compile
./.heroku/buildpack/detect
./.heroku/buildpack/release
./Procfile
<rest of your app>
```

### Option 3: In a directory specified in `.heroku-buildpack-dir`

```
./.heroku-buildpack-dir
./my/custom/path/compile
./my/custom/path/detect
./my/custom/path/release
./Procfile
<rest of your app>
```

where `.heroku-buildpack-dir` contains a single line:

```
my/custom/path
```

[buildpack]: https://devcenter.heroku.com/articles/buildpack-api#buildpack-api
