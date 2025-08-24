clib_binaries <- c(
    "clib", "clib-install", "clib-search", "clib-init",
    "clib-configure", "clib-build", "clib-update",
    "clib-upgrade", "clib-uninstall"
)
if (.Platform$OS.type == "windows") {
    clib_binaries <- paste0(clib_binaries, ".exe")
}

# get binary from installed package bin directory
#' @param binary Name of the binary to retrieve
#' @return Path to the binary
#' @export
get_clib_binary <- function(binary) {
    if (!(binary %in% clib_binaries)) {
        stop(paste("Binary", binary, "is not a valid clib binary"))
    }
    src <- system.file("bin", binary, package = "Rclib", mustWork = TRUE)
    if (src == "") {
        stop(paste("Binary", binary, "not found in package bin directory"))
    }
    if (!file.exists(src)) {
        stop(paste("Binary", binary, "not found at path:", src))
    }
    return(src)
}

#' clib run
#' Run a clib command
#' @param args Arguments to pass to clib
#' @return Output of the clib command
#' @export
clib_run <- function(args) {
    clib_path <- get_clib_binary("clib")
    result <- system2(clib_path, args = args, stdout = TRUE, stderr = TRUE)
    return(result)
}
