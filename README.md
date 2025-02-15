# Janet - spork/http issue

[spork/http](https://github.com/janet-lang/spork/blob/08fdf9d3246db5c9aa2102bc3cb4e90e148780c0//spork/http.janet#L442) is getting stuck after multiple page reload.

https://github.com/user-attachments/assets/2c8522db-86c2-4083-9169-f778891f58ca

I tested the same routes with [halo2](https://github.com/joy-framework/halo2/blob/master/src/halo2.janet#L252) used by joy framework and I do not have the issue.

To launch the server with spork:

```
janet ./server-spork.janet
```

To launch the server with halo2:

```
janet ./server-halo2.janet
```
