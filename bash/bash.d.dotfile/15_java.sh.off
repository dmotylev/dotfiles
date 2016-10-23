case "$(uname -s)" in
"Darwin" )
    if [ $(/usr/libexec/java_home -F 2> /dev/null) ]; then
        export JAVA_HOME="$(/usr/libexec/java_home)"
    else
        TODO "Install JVM with '/usr/libexec/java_home --request'\n"
    fi
    ;;
* )
    TODO "Set JAVA_HOME in '~/.bash.d/15_java.sh'\n"
    ;;
esac
