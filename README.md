# kittenlang.org

This is the source of [kittenlang.org][kittenlang], the official site of the
[Kitten][kitten] programming language. It’s implemented as a primitive “static
site generator” written in Kitten, consisting of functions which simply print
HTML.

To build the site, you need to have a build of the Kitten compiler. Make sure
the common vocab `common.ktn` is installed in the same directory as the `kitten`
executable. By default, the `Makefile` will use whatever `kitten` executable is
found in your `PATH`; you can override this by setting the `KITTEN` variable
when invoking `make`.

```
make KITTEN=path/to/kitten
```

This target can also be invoked as `make default`. To delete the generated HTML,
run `make clean`. I use the `make deploy` target to upload the HTML to the
server over SFTP—however, you will not be able to run deployments yourself
without a server login.

To add a page:

* Create a directory for it

* Create a Kitten source file in that directory named `index.ktn`

* Add the directory name to `TARGETS` in the `Makefile`

Common website-related functions such as `page_template` should go in
`Kittenlang.ktn`. If you want to add a *general-purpose* utility function,
consider submitting a pull request to the [common vocab][common] instead.

[common]: https://github.com/evincarofautumn/kitten/blob/master/common.ktn
[kitten]: https://github.com/evincarofautumn/kitten
[kittenlang]: http://kittenlang.org/
