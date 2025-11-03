###############################################################################
# this code is simply to demonstrate how to set up logging in your R scripts
# Even if you are running code locally on your laptop, it is a useful tool
# as it allows you to keep hard copies of the output of your program (in
# addition to the generated data)
###############################################################################
library(lgr)      # for logging functionality
library(rlang)    # for throwing exceptions
library(here)     # for building file paths

# clean the environment if we need to
# rm(list = ls())

###############################################################################
# Load file paths
###############################################################################
rootFolder_mac<-"/Users/simonray/uio_dropbox_sr/myTeaching/MF9155_2025"
rootFolder_hp<-"/media/simonray/data24/data/uio_dropbox_sr/myTeaching/MF9155_2025"
rootFolder<-rootFolder_hp

paste0("Loading file paths file <", here(rootFolder, "SRCommonPaths2025.R"), ">")
tryCatch(
  expr = {
    paste0("Loading file paths file <", here(rootFolder, "SRCommonPaths2025.R"), ">")
    source(here(rootFolder, "SRCommonPaths__2025.R"))
    paste0("...completed")
  },
  warning = function(w) { print("...got unknown warning") },# Code to execute if a warning occurs
  error = function(e) { rlang::abort("...error loading file, aborting.") },# Code to execute if an error occurs 
  finally = { }# Code to execute regardless of errors or warnings
)


###############################################################################
# Initiate a logger instance
###############################################################################
my_logger <- get_logger("custom_logger")




###############################################################################
# Add an appender to tell the logger where to send the message
# the following will send the error messages to the terminal
# It isn't actually necessary because if no appender is specified the package
# will send messages to he terminal by default, but it doesn't hurt 
# to be explicit
###############################################################################
my_logger$add_appender(AppenderConsole$new(), name = "console_appender")
my_logger$info("This is an informational message that will only be sent 
               to the console.") 

###############################################################################
# However, hat we are interested in doing is sending the messages to a file 
# so we can look at them at a later date if needed
###############################################################################
logfile_path <- here(rootFolder, default_logfile_folder, "run.log")
my_logger$add_appender(lgr::AppenderFile$new(logfile_path), name = "file_appender")

# remove the console appender we added earlier, otherwise message will be printed twice
my_logger$remove_appender("console_appender")
my_logger$info("This is an informational message that will sent to the console 
               and the logfile.") 


###############################################################################
# We can also control which messages are reported by setting  
# report 'threshold'
#
#  you can set the following Log levels:
#
#     trace: The lowest priority; for highly detailed tracing.
#     debug: Used for debugging purposes to provide detailed information about the program's execution.
#     info: For general informational messages about the application's status.
#     warn: Indicates potential problems that don't necessarily stop the program but require attention.
#     error: Signals that a serious error has occurred and the program may not be able to continue its current operation.
#     fatal: Indicates a critical failure that will likely cause the program to terminate. 
#
#
# so, the issuing the following command means that the logger will only 
# print messages for $warn, $error and $fatal
#
###############################################################################
my_logger$set_threshold("warn")



my_logger$info("This is an informational message.")  # We set report threshold to "warn", so this won't be reported
my_logger$warn("A warning occurred here.")
my_logger$error("An error message.")
my_logger$fatal("A fatal error, application might crash!")
my_logger$debug("Detailed debug information.")       # We set report threshold to "warn", so this won't be reported


###############################################################################
# we can also emove the appender if we no longer need it
###############################################################################
my_logger$remove_appender("file_appender")

