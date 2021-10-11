# Source code for the [jackaudio.org] homepage

[![GitHub build badge]](https://github.com/jackaudio/jackaudio.github.com/actions)

## Contribute

To report bugs and issues with JACK, please use the corresponding
[JACK 1] and [JACK 2] bug trackers.

You can currently contribute to the homepage by checking the page for dead/wrong
links and formatting mistakes and file bugreports about them.

If you feel comfortable fixing issues yourself, please file a [pull request].

If you want to help out on the style part, you are more than welcome to clone the
repo and start hacking but please communicate about your vision,
so there won't be any drama.

If you have any ideas or suggestions, please feel free to contact the authors via
jack-devel mailinglist or on Github.

## Test with stakx locally

In order to test the website without having a webserver running and also see
the changes in real time use the `setup.sh` script to run [stakx] locally from
the repository directory.

It requires `php` to be installed, the rest is bundled in the application.

The website will be available at <http://0.0.0.0:8000/>.

If using another webserver you'll need to point it to the built `_site` directory.

## Adding FAQ pages

1. Create a new *.md file in the FAQ directory
2. Insert a [YAML front-matter] header as in the other files in the FAQ directory,
   they are required for stakx to process the file
3. Add your content in markdown format
4. Link to your new FAQ page in the `/faq/index.md` page

## Creating posts

The easy way is by running the following command from the repository root:

```bash
$ ./new_post.sh "New post title" author_name
```

Otherwise manually by creating a new .md file in the [_posts] directory,
paying attention for a correct filename using a
`YYYY-MM-DD-lowercase-with-only-letters-numbers-and-hyphens-filename.md`
mask and [YAML front-matter] (see other post files as reference).

## Development notes

- All page links currently require the `.html` suffix in order to work with any
  webserver, not to depend solely on stakx.
- Please use an [EditorConfig] compatible editor to avoid indentation,
  whitespaces and missing lines at EOF issues.
- Desired line length maximum is 82 columns.
- See above to how to test page's changes with stakx.
- For further information please refer to the [stakx documentation].
- Use external hosting links for the download section like [GitHub releases],
  no download files in the repository for a better maintenance.

[jackaudio.org]:       https://jackaudio.org
[JACK 1]:              https://github.com/jackaudio/jack1/issues
[JACK 2]:              https://github.com/jackaudio/jack2/issues
[pull request]:        https://github.com/jackaudio/jackaudio.github.com/pulls
[stakx]:               https://stakx.io/
[YAML front-matter]:   https://jekyllrb.com/docs/front-matter/
[_posts]:              https://github.com/jackaudio/jackaudio.github.com/tree/master/_posts/
[EditorConfig]:        https://editorconfig.org/
[stakx documentation]: https://stakx.io/docs/welcome/
[GitHub releases]:     https://docs.github.com/en/repositories/releasing-projects-on-github/about-releases
[GitHub build badge]:  https://github.com/jackaudio/jackaudio.github.com/actions/workflows/build.yml/badge.svg
