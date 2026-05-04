FROM openlistteam/openlist:latest

# 切换到 root 用户强制操作
USER root

# 创建一个 Render 无法拒绝的临时数据目录
RUN mkdir -p /var/tmp/openlist && chmod -R 777 /var/tmp/openlist

# 设置工作目录
WORKDIR /var/tmp/openlist

# 暴露端口
EXPOSE 5244

# 【核心步骤】启动时强制指定数据路径为 /var/tmp/openlist
# 这样它就不会去碰那个报错的 /opt/openlist/data 了
CMD ["/opt/openlist/openlist", "server", "--data", "/var/tmp/openlist"]
