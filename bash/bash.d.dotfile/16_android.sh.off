case "$(uname -s)" in
"Darwin" )
    if [ -d ~/Library/Android/android-sdk-macosx ]; then
        export ANDROID_HOME=~/Library/Android/android-sdk-macosx
    else
        TODO "Install Android SDK from https://developer.android.com/sdk"
    fi
    ;;
* )
    TODO "Set ANDROID_HOME in '~/.bash.d/16_android.sh'\n"
    ;;
esac

if [ -n "${ANDROID_HOME}" ]; then
	export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
fi
