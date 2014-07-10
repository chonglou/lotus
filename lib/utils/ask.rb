require 'highline/import'

def y_n(question)
  select(question, %w(q, n))
end

def which(question, options)
  ask("#{question}?(#{options.join '/'}) ") { |q| q.default=options.first }
end

def p_s(s)
  puts s
end