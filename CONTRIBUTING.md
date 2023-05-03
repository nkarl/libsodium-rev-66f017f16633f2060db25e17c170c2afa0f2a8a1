# Contributing to IOG's fork of libsodium
**For security related issues** please consult the security file in the
[Cardano engineering handbook](https://github.com/input-output-hk/cardano-engineering-handbook/blob/main/SECURITY.md).

This fork is based in libsodium's [stable branch], currently 
pointing to the [1.0.18 tag]. All changes to libsodium's core 
library should follow the standard contributing procedures of 
libsodium upstream. In some scnearios we might need some 
code that is available in libsodium master branch and not 
yet in stable. In that case, the required code should be 
included in this repo (see [this] commit for example).


[stable branch]: https://github.com/jedisct1/libsodium/tree/stable
[1.0.18 tag]: https://github.com/jedisct1/libsodium/releases/tag/1.0.18-RELEASE
[this]: https://github.com/input-output-hk/libsodium/commit/e26256b5758aaaa0d64696662f3380350ad3c22d

### Roles and responsibilities
The @cardano-crypto group is responsible for helping with 
reviewing and merging pull requests and adjudicating technical 
(or other) disputes.

### Using a new version of the fork with Nix
Cardano development in general is primarily based on the Nix
infrastructure (https://nixos.org/), which enables packaging, 
CI, development environments and deployments. 

In order to use a newer commit of the fork with Nix, one should
update the [crypto overlay] of libsodium.

[crypto overlay]: https://github.com/input-output-hk/iohk-nix/blob/master/overlays/crypto/libsodium.nix

### Testing

IOG's fork of libsodium uses the same testing strategy as upstream. 
Therefore, we direct the reader to [libsodium's documentation] for
more information. 

[libsodium's documentation]: https://libsodium.gitbook.io/doc/internals#testing

### Commit messages

Summarize changes in around 50 characters or less.

Provide more detailed explanatory text, if necessary.
Wrap it to about 72 characters or so.
In some contexts, the first line is treated as the
subject of the commit and the rest of the text as the body.
The blank line separating the summary from the body is critical
(unless you omit the body entirely);
various tools like `log`, `shortlog` and `rebase` can get
confused if you run the two together.

Explain the problem that this commit is solving,
and use one commit per conceptual change.
Focus on why you are making this change as opposed to how (the code explains that).
Are there side effects or other unintuitive consequences of this
change? Here's the place to explain them.

Further paragraphs come after blank lines.

 - Bullet points are okay, too

 - Typically a hyphen or asterisk is used for the bullet, preceded
   by a single space, with blank lines in between, but conventions
   vary here

If you use an issue tracker, put references to them at the bottom,
like this:

Resolves: #123
See also: #456, #789

### Commit signing

Commits are required to be [signed](https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-commits).

### Pull Requests

Keep commits to a single logical change where possible.
The reviewer will be happier, and you’ll be happier if you ever have to revert it.
If you can’t do this (say because you have a huge mess), best to just have one commit with everything in it.

Keep your PRs to a single topic.
Including unrelated changes makes things harder for your reviewers, slowing them down, and makes it harder to integrate new changes.

If you’re working on something that’s likely to conflict with someone else, talk to them. It’s not a race.
