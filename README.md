# All in one 运行环境

# 文件目录,将laravel or lumen 放到 /home中

# 执行队列:
> docker run lararun/aio queue --arg=1 --arg=2

# 执行计划任务
> docker run lararun/aio schedule

# 提供web服务
> docker run lararun/aio 

# 全部在一个容器中运行
>docker run lararun/aio all

特别不推荐最后一种方式,最后一种方式只要web正常,无法监测队列和计划任务,所以只是为开发环境提供一种方便的方式
