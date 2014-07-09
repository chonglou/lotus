def ssh(url, commands)
  $logger.info "ssh #{url} <<BASH\n#{commands.join "\n"}\nBASH"
  #$logger.info `ssh #{url} <<BASH\n#{commands.join "\n"}\nBASH`
end