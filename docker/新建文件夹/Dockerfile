FROM nginx
RUN echo '这是一个本地构建的ng1inx镜像' > /usr/share/nginx/html/index.html

# 从构建上下文目录中<源路径> 的文件/目录复制到新的一层的镜像内的 <目标路径> 位置
COPY ./Dockerfile /usr/share/nginx/html/a.file

# 构建环境的环境变量 --build-arg <参数名>=<值> 可覆盖
ARG HTML=html

# <源路径> 可以是一个 URL, <源路径> 为一个 tar 压缩文件的话，压缩格式为 gzip, bzip2 以及 xz 的情况下 会默认压缩
# 但可以直接用wget run 工具处理 因此官方不推荐
ADD ./file.tar /usr/share/nginx/$HTML/


# 容器的环境变量
ENV NODE_VERSION 1.1.0
# 容器定义匿名卷
VOLUME ./a-dir
# 仅仅是声明容器打算使用什么端口而已 不会进行映射
EXPOSE 9090
# 指定工作目录(或者称为当前目录) 以后各层的当前目录就被改为指定的目录
WORKDIR ./work-dir


#改变之后层的执行 RUN, CMD 以及 ENTRYPOINT 这类命令的身份 用户必须是事先建立好的
#USER <name>

#设置检查容器健康状况的命令
HEALTHCHECK --interval=5s --timeout=3s --retries=3 CMD curl -fs http://localhost/ || exit 1

#构建下一级镜像的时候才会被执行
#ONBUILD