case "$(uname -s)" in
"Darwin" )
    if [ $(/usr/libexec/java_home -F 2> /dev/null) ]; then
        export JAVA_HOME="$(/usr/libexec/java_home)"
    else
        printf "$(tput setaf 1)TODO$(tput sgr0) Install JVM with '/usr/libexec/java_home --request'\n"
    fi
    ;;
* )
    printf "$(tput setaf 1)TODO$(tput sgr0) Set JAVA_HOME in '~/.bash.d/15_java.sh'\n"
    ;;
esac
