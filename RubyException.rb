begin
  try_something
rescue
  begin
    try_something_else
  rescue
    # handle failure
  end 
end

# every method in ruby is implicitly a begin block
def foo
  # Business logic goes here
rescue # -------------------
  # failure handling goes here
end


begin
  # ...
rescue Exception
end


begin
  # ...
rescue => error
  raise unless error.message =~ /foo bar/
end






require 'English'

puts $!.inspect

#Output
=> nil

begin
  raise "Oops"
rescue
  puts $!.inspect
  puts $ERROR_INFO.inspect
end

#Output

puts $!.inspect


























def raise(error_class_or_obj, message, backtrace)
  error = error_class_or_obj.exception(message)
  # ...
end

























raise ExceptionClass, "message", [BACKTRACE]

raise
raise "hello"
raise RuntimeError
raise RuntimeError, "hello"
raise RuntimeError.new("hello")
raise RuntimeError, "hello", caller

























begin
  fail "Oops!"
rescue => error
  raise if error.message != "Oops!"
end



















failures = 0 
begin
  # ...
rescue MyLib::UserError => e
  puts e.message
  retry
rescue MyLib::LogicError => e
  log_error(e)
  abort "Internal error! #{e.message}"
rescue MyLib::TransientFailure => e
  failures += 1
  if failures < 3
    warn e.message
    sleep 10
    retry
  else
    abort "Too many failures" 
  end
end


require 'logger'

log = Logger.new(STDERR)
begin
  raise
rescue
  log.warn('file_name') { "line no." }
  exit false # Exits with "failure" code
end

# Output

W, [2022-08-17T17:45:29.515381 #42262]  WARN -- file_name: line no.
