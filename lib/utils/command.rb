require_relative 'logger'
require 'yaml'

module Lotus
  module Command
    module_function
    def run_on_db(commands)
      load_cfg.fetch('db').each {|h| ssh h, commands}
    end

    def run_on_web(commands)
      load_cfg.fetch('web').each {|h| ssh h, commands}
    end

    def deploy
      commands = []
      commands << scm
      commands
    end

    def scm
      scm = "#{web_root}/scm"
      git = load_cfg.fetch 'git'
      [dir?(scm, "cd #{scm} && git pull", "git clone -b #{git.fetch 'branch'} #{git.fetch 'repo'} #{scm}")]
    end

    def check
      commands = []
      root = web_root
      cfg = load_cfg
      cfg.fetch('shared').fetch('dirs').each do|d|
        d= "#{root}/#{d}"
        commands << dir?(d, "echo 'check #{d} pass!'", "echo '#{d} not exist!' && exit 1")
      end
      cfg.fetch('shared').fetch('files').each do |f|
        f = "#{root}/#{f}"
        commands << file?(f, "echo 'check #{f} pass!'", "echo '#{f} not exist!' && exit 1")
      end
      commands
    end

    def web_root
      "/var/www/#{load_cfg.fetch('git').fetch('name')}"
    end

    def load_cfg
      YAML.load_file "#{File.dirname __FILE__}/../../config/lotus.yml"
    end

    def file?(path, yes=nil, no=nil)
      <<BASH
if [ -f '#{path}' ]
then
  #{yes}
else
  #{no}
fi
BASH
    end

    def dir?(path, yes=nil, no=nil)
      <<BASH
if [ -d '#{path}' ]
then
  #{yes}
else
  #{no}
fi
BASH

    end

    def ssh(url, commands)
      $logger.info "#{'#'*8} #{url} #{'#'*8}\n#{commands.join("\n")}"

      #$logger.info `ssh #{url} <<BASH\n#{commands.join "\n"}\nBASH`
    end
  end
end
