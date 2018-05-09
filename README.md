 数据抓取工具使用

该文件为抓取工具集合，包括手机端运行抓取ｌｏｇ工具，和本地分析数据工具。

使用环境：

　１要求环境变量中可以找到tshark工具（使用该工具将tcpdump二进制信息转换成文本信息），

　２要求有python运行环境，如果使用手机端抓取工具，

   ３adb 工具。

　４root手机　

　该脚本在linux　python3环境通过，window没有测试，如果发现问题请反馈

脚本使用方法　　　

　１将script.tar.gz解压后，进入script路径

　２执行networklog.py脚本：　参数如下

　　--help | -h | help | 不加参数, 显示帮助信息

       clear: 清除分析工具产生的中间文件

　　pull：　拉取networklog.txt（uid-ip）　tcpdump文件   需要手机链接adb

       push:　push 脚本文件到手机　　需要手机链接adb

       start: 发送脚本到手机，并启动抓取log，该命令包含　clear push命令

　　stop: 　停止抓取log 和 tcpdump

　　parse: 解析log:　第一个参数为　tcpdump 抓取的文件pcap路径，第二个参数为抓取的networlog.txt路径，第三个参数为packages.list路径 ,networklog.py从手机上抓下来的，用户可以自己指定

　　　　　　该命令包含clear pull命令

           如果parse后面不填参数则使用默认参数，script文件夹下从手机上拉取到的相应文件

结果在script目录下的result.txt文件

中间结果可以查看out目录

实例：

　　adb root

       ./networklog.py start

       ./networklog.py stop

       ./networklog.py parse

 

 



