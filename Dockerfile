FROM openlistteam/openlist:latest

USER root

# 1. 彻底删除原有的 data 目录（如果存在）
RUN rm -rf /opt/openlist/data

# 2. 创建一个绝对有权限的临时目录
RUN mkdir -p /tmp/data && chmod -R 777 /tmp/data

# 3. 核心：建立软链接！
# 把程序想找的 /opt/openlist/data 指向我们有权限的 /tmp/data
RUN ln -s /tmp/data /opt/openlist/data

# 4. 设置环境变量
ENV ALIST_DATA_DIR=/tmp/data

EXPOSE 5244

# 5. 启动命令（多重保险）
CMD ["/opt/openlist/openlist", "server", "--data", "/tmp/data"]
