
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
Rclib::clib_run("clib", c("search", "khash"), capture = TRUE)
#>  [1] ""                                                                                                                 
#>  [2] "\033[39;49;36;49m  goodcleanfun/khash"                                                                            
#>  [3] "\033[39;49m  url: \033[39;49;90;49mhttps://github.com/goodcleanfun/khash"                                         
#>  [4] "\033[39;49m  desc: \033[39;49;90;49mclib pointer to efficient hashtable implementation in klib"                   
#>  [5] "\033[39;49m"                                                                                                      
#>  [6] "\033[39;49;36;49m  goodcleanfun/set"                                                                              
#>  [7] "\033[39;49m  url: \033[39;49;90;49mhttps://github.com/goodcleanfun/set"                                           
#>  [8] "\033[39;49m  desc: \033[39;49;90;49mGeneric set container with intersection/union/difference, etc. built on khash"
#>  [9] "\033[39;49m"                                                                                                      
#> [10] "\033[39;49;36;49m  goodcleanfun/dict"                                                                             
#> [11] "\033[39;49m  url: \033[39;49;90;49mhttps://github.com/goodcleanfun/dict"                                          
#> [12] "\033[39;49m  desc: \033[39;49;90;49mGeneric dictionary built on khash"                                            
#> [13] "\033[39;49m"
```
