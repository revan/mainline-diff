# Mainline Diff

This action compares the output of a script running in a pull request to the same script running on the base branch. The action comments the diff status on the PR, and uploads a visual diff (where appropriate) to workflow artifacts.

Traditional testing methodology involves writing explicit assertions about the behavior of a piece of code.
In some cases explicit assertions are unwieldy, such as for large-volume comparisons.
Various frameworks implement "snapshot" or "golden" testing to manage updating a checked-in source of truth for comparison in test.

Snapshot testing's combination of high touch rate and rote manual refresh step can lead to snapshots being ignored by author and reviewer.
This action is meant to fill the role of snapshot testing without committing to a checked-in source of truth, handling orchestration and diffing but leaving the subject execution to the projects.
This lends it to normally impractical test scenarios, such as reviewing non-text output changes to a PDF rendering module or to testing parsing logic by replaying a rolling window of recorded API responses.

## Usage

### Diffing Stdout

```
steps:
  - uses: revan/mainline-diff
    with:
      file-to-execute: "path/to/your/script.sh"
      files-to-clobber: "path/to/your/script.sh"
```

### Diffing Image Output

```
steps:
  - uses: revan/mainline-diff
    with:
      file-to-execute: "path/to/your/script.sh"
      files-to-clobber: "path/to/your/script.sh"
      file-to-image-diff: "/tmp/image-out.png"
```

### Diffing PDF Output

```
steps:
  - uses: revan/mainline-diff
    with:
      file-to-execute: "path/to/your/script.sh"
      files-to-clobber: "path/to/your/script.sh"
      file-to-pdf-diff: "/tmp/pdf-out.pdf"
```

## Dependencies

This action uses no third party actions. Images are handled by Imagemagick (preinstalled on GitHub Actions executors) and PDFs are handled by Ghostscript (installed from apt).
