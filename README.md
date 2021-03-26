# Asynchronous IO for Windows

`Win32-network` provides interface for asynchronous (overlapped) IO on Windows
via implemented IO manager.  It supports:

* `File` api
* `NamedPipes` api
* Berkeley sockets api on Windows via `winsock2` 

`NamedPipes` provide a good alternative for the lack of Unix Sockets on
Windows, and there are ways of providing abstraction for both, though this is
not present in this package.

An application which is using this package should use `-threaded` option, as
the io manager thread runs a blocking ffi call (e.g.
[GetQueuedCompletionStatus](https://docs.microsoft.com/en-us/windows/win32/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus)).

## Haddocks

Haddocks are available via [github-pages](https://input-output-hk.github.io/Win32-network).

## GHC Native IO Manager

A recent version of GHC has a native io-manager on Windows.  Part of this
library will become obsolete once the
[network](https://hackage.haskell.org/package/network) will use it.

## Acknowledgement

The initial version of this library was based on
[winio](https://hackage.haskell.org/package/winio) by Felix Martini.
