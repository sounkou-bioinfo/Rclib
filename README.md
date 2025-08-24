
# Rclib

[Rclib](https://github.com/clibs/clib), R interface to the
[clib](https://github.com/clibs/clib) C package manager CLI.

This package bundles the clib command-line tool, allowing its
distribution as an R package and likely use in R projects that use the
header libraries provided by the clib organization.

## What is clib ?

[clib on GitHub](https://github.com/clibs/clib): Package manager for the
C programming language. Lets you fetch and manage stand-alone “micro” C
libraries, promoting smaller utilities and easier discovery. see [clib
documentation](https://github.com/clibs/clib) for more details.

## Example usage

``` r
Rclib::clib_run("clib", c("search", "khash"), capture = TRUE) |> Rclib::strip_ansi()
#>  [1] ""                                                                                     
#>  [2] "  goodcleanfun/khash"                                                                 
#>  [3] "  url: https://github.com/goodcleanfun/khash"                                         
#>  [4] "  desc: clib pointer to efficient hashtable implementation in klib"                   
#>  [5] ""                                                                                     
#>  [6] "  goodcleanfun/set"                                                                   
#>  [7] "  url: https://github.com/goodcleanfun/set"                                           
#>  [8] "  desc: Generic set container with intersection/union/difference, etc. built on khash"
#>  [9] ""                                                                                     
#> [10] "  goodcleanfun/dict"                                                                  
#> [11] "  url: https://github.com/goodcleanfun/dict"                                          
#> [12] "  desc: Generic dictionary built on khash"                                            
#> [13] ""
```
