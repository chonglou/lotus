
desc '检查配置'
task :check do
  cmd = Lotus::Command
  cmd.run_on_web cmd.check
end

desc '部署'
task :deploy do
  cmd = Lotus::Command
  commands = cmd.check
  commands += cmd.deploy
  cmd.run_on_web commands
end

desc '回退'
task :rollback, [:version] do |_, args|

end

desc '列出版本'
task :list do

end