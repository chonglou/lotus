lotus--让PHP部署从此不再痛苦
=====

### 功能
 * 支持CentOS系统（其它系统如有需求可以添加）
 * 支持多台主机
 * 支持nginx设置
 * 支持php安装配置
 * 支持git branch

### 安装
在管理机上（有服务器访问权限）

#### RUBY
参照 https://github.com/chonglou/notes/blob/master/ruby/rbenv.md

#### LOTUS

	git clone git@github.com:chonglou/lotus.git
	cd lotus
	bundle install
	

### 配置
ENV是运行环境：如staging production等在config目录下 以production为例
	cp config/deploy/production.rb.tmp config/deploy/production.rb
	vi config/deploy/production.rb #设置服务器连接
	cp config/deploy.rb.tmp config/deploy.rb
	vi config/deploy.rb # 设置git信息

### 运行
	cap -T # 列出所有任务
	cap ENV test # 测试连接
	cap ENV deploy # 部署
	cap ENV rollback # 回滚
	
