require 'logger'

class MultiLogger
  def initialize(*targets)
    @targets = targets
  end
  def method_missing(method, *args, &block)
    @targets.each {|t| t.send method, *args, &block }
  end
end

$logger = MultiLogger.new Logger.new("#{File.dirname __FILE__}/../../tmp/lotus.log", 'daily'), Logger.new(STDOUT)