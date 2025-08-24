# copies clib binaries into R package bin directory
# clib clib-install clib-search clib-init clib-configure clib-build clib-update clib-upgrade clib-uninstall
clib_binaries <- c(
  "clib",
  "clib-install",
  "clib-search",
  "clib-init",
  "clib-configure",
  "clib-build",
  "clib-update",
  "clib-upgrade",
  "clib-uninstall"
)
if (WINDOWS) {
  clib_binaries <- paste0(clib_binaries, ".exe")
}
# get R package bin directory from R_PACKAGE
# with appropriate arch suffix
R_PACKAGE_BIN <- file.path(R_PACKAGE_DIR, paste0("bin", R_ARCH))

dir.create(R_PACKAGE_BIN, recursive = TRUE, showWarnings = FALSE)
lapply(X = clib_binaries, FUN = function(binary) {
  src <- binary
  dest <- file.path(R_PACKAGE_BIN, binary)
  file.copy(src, dest, overwrite = TRUE)
  Sys.chmod(dest, mode = "0755") # Ensure the binary is executable
})
