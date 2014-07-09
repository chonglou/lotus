namespace :mysql do
  desc 'MYSQL安装'
  task :install do
    case which('来源', %w(yum build))
      when 'yum'
        ssh 
      else
        p_s '未知类型'
    end
  end

end