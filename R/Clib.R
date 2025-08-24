clib_commands <- c(
    "clib", "clib-install", "clib-search", "clib-init",
    "clib-configure", "clib-build", "clib-update",
    "clib-upgrade", "clib-uninstall"
)
clib_binaries <- clib_commands
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
#' trouble with interactive commands
#' @param command Name of the clib command to run
#' @param args Arguments to pass to clib
#' @return Output of the clib command
#' @export
clib_run <- function(command, args = character()) {
    stopifnot(command %in% clib_commands)
    clib_path <- get_clib_binary(command)
    bin_dir <- dirname(clib_path)
    # add it to PATH
    OldPATH <- Sys.getenv("PATH")
    on.exit(Sys.setenv(PATH = OldPATH), add = TRUE)
    Sys.setenv(PATH = paste(bin_dir, OldPATH, sep = .Platform$path.sep))
    PATH <- Sys.getenv("PATH")
    result <- system2(clib_path,
        args = args, stdout = TRUE, stderr = TRUE,
        env = paste0("PATH=", PATH)
    )
    return(result)
}
