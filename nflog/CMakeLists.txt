cmake_minimum_required(VERSION 3.6)
project(nflog)

set(CMAKE_CXX_STANDARD 11)

include_directories(/Users/tangtang/networklog/jni/nflog)
set(SOURCE_FILES
        libmnl/libmnl.h
        linux/netfilter/nfnetlink_log.h
        linux/netlink.h
        attr.c
        callback.c
        config.h
        internal.h
        nflog.c
        nlmsg.c
        socket.c)

add_executable(nflog ${SOURCE_FILES})