namespace :mysql do
  desc 'MYSQL安装'
  task :install do
    case which('来源', %w(yum deb build))
      when 'yum'
        ssh
      else
        p_s '当前不支持'
    end
  end

end