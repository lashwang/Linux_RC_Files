
git_set_proxy(){
    git config --global http.proxy 'socks5://127.0.0.1:1080';
    git config --global https.proxy 'socks5://127.0.0.1:1080';
}


git_unset_proxy(){
    git config --global --unset http.proxy ;
    git config --global --unset https.proxy ;
}


adb_set_nvram(){
    adb shell nvram set "$1" ;
    adb shell nvram commit ;
}

adb_send_broadcast(){
    echo 'adb send broadcat $1' ;
    adb shell am broadcast -a "$1" -f 0x01000000 ;
}

aosp_init(){
    export LC_ALL=C ;
    export ANDROID_COMPILE_WITH_JACK=false ;
    source ./build/envsetup.sh ;
    lunch ;
}

get_h60(){
    curl http://192.168.120.236/hz/firmware/GVC3210/H60/"$1"_h60/classfw.bin > /tmp/h60.bin
}

read_x509(){
    openssl x509 -in $1 -text -noout
}

gen_old_hash_ca(){
    cp $1 `openssl x509 -subject_hash_old -in $1 -noout`.0
}


build_target(){
    export LC_ALL=C ;
    source build/envsetup.sh ;
    lunch $1 ;
    make update-api && make ;
}


build_gs_frameworks(){
    croot ;
    cd vendor/grandstream/frameworks/GsCore/ ;
    mm ;
    croot ;
    cd vendor/grandstream/frameworks/GsCoreService/ ;
    mm ;
    croot ;
    cd frameworks/base/services/ ;
    mm ;
    croot ;
}

mmp_gs_frameworks(){
    croot ;
    cd vendor/grandstream/frameworks/GsCore ;
    touch src/main/java/com/gs/core/security/GsSecurityManager.java ;
    mm ;
    croot ;
    cd vendor/grandstream/frameworks/GsCoreService ;
    touch src/main/java/com/gs/core/service/security/GsSecurityService.java ;
    mm ;
    croot ;
    cd frameworks/base/services/ ;
    mmp ;
    croot ;
}

mmp_gs_api_demo(){
    croot;
    cd vendor/grandstream/apps;
    mmmp GsCoreApiDemo;
    cd GsCoreApiDemo;
}




copy_adb(){
    cp /usr/bin/adb out/host/linux-x86/bin/.
}

build_3210(){
    build_target 32
    copy_adb
    #build_gs_frameworks
}

build_mm(){
    build_target 19
    copy_adb
    build_gs_frameworks
}

git_status_grep(){
    git status | grep $1 | awk '{print $2}'
}


read_so(){
    readelf -d $1 | grep "Shared library"
}


gen_ide(){
    croot ;
    mmm development/tools/idegen/ ;
    development/tools/idegen/idegen.sh ;
}


alias start-natapp='setsid natapp -authtoken=c9a5af4d0306d7d8 -log=stdout'
alias repo-upload='repo upload --re="gwzhang,gxzhang,ahluo,xlli,bxpan,cchma,ygcao" --no-verify'
export PYTHONHTTPSVERIFY=0
export SOONG_GEN_CMAKEFILES=1
export SOONG_GEN_CMAKEFILES_DEBUG=1
alias ls="ls -lh --color=auto"
alias df="df -h"
alias free="free -h"
alias apt="sudo apt"
alias apt-proxy="sudo prorychains apt"
alias git-proxy=git_set_proxy
alias git-no-proxy=git_unset_proxy
alias cp="cp -f"
alias mv="mv -f"
alias ps="ps -aux"
alias set-nvram=adb_set_nvram
alias send_broadcast=adb_send_broadcast
alias cd1='cd ..'
alias cd2='cd ../..'
alias cd3='cd ../../../'
alias cd4='cd ../../../../'
alias aosp-init=aosp_init
alias git-st="git status"
alias get-h60=get_h60
alias pull-logcat='adb pull /tmp/logcat.log'
alias build-target=build_target
alias build-gs-frameworks=build_gs_frameworks
alias cp-adb=copy_adb
alias build-3210=build_3210
alias build-mm=build_mm 2>&1 1>/dev/null 
alias gst-grep=git_status_grep
alias mmp-gs-frameworks=mmp_gs_frameworks
alias adb-shut="adb disconnect"
alias mmp-gs-api-demo=mmp_gs_api_demo
alias repo-sync="repo forall -c 'git remote -v;git pull'"
alias start-ss="sudo sslocal -c /etc/shadowsocks/config.json -d start"
alias read-so=read_so 
alias git-status-grep=git_status_grep
alias gen-ide=gen_ide
alias gen-ca-newhash="openssl x509 -subject_hash -noout -in "
alias gen-ca-oldhash="openssl x509 -subject_hash_old -noout -in"
alias arm-linux-androideabi-nm="/opt/android/ndk/android-ndk-r12b/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/arm-linux-androideabi-nm"
alias query_crash_addr="addr2line -p -C -i -f -e"
alias read-x509=read_x509
alias android-build="make update-api;make"
alias convert-ca-to-hash=gen_old_hash_ca
alias adb="/usr/bin/adb" 

