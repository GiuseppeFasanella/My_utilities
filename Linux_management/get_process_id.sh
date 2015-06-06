echo "pid is $$" #$$ is the process ID of the script
# To kill a process kill -9 -pid
# To terminate a process kill -15 -pid

FILE= $(basename $0).pid #basename is just the name of the script, without the full path
