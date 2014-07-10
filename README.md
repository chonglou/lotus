lotus--让PHP部署从此不再痛苦
=====

### 功能
 * 支持CentOS和Ubuntu/Debian系统（其它系统如有需求可以添加）
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
	cp config/lotus.yml.tmp config/lotus.yml
	vi config/lotus.yml #

### 运行
	rake -T # 列出所有任务
	rake test # 测试连接
	rake deploy # 部署
	rake rollback # 回滚
	
