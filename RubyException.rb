require 'English'

begin
  puts $!.inspect
  raise "Oops"
rescue
  puts $!.inspect
  puts $ERROR_INFO.inspect
end
puts $!.inspect

#Output
=> nil
=> #<RuntimeError: Oops>
=> #<RuntimeError: Oops>
=> nil


##########

begin
  raise 'This exception will be rescued!'
rescue StandardError => e
  puts "Rescued: #{e.inspect}"
end

begin
  raise 'This exception will be rescued!'
rescue StandardError, AnotherError => e
  puts "Rescued: #{e.inspect}"
end

begin
  raise 'This exception will be rescued!'
rescue StandardError => e
  puts "Rescued: #{e.inspect}"
rescue AnotherError => e
  puts "Rescued, but with a different block: #{e.inspect}"
end

################

require "net/http"
 
http = nil
uri = URI("http://google.com:31/")
retries = 0
 
begin
  unless http
    puts "Opening TCP connection..."
    http = Net::HTTP.start(uri.host, uri.port, read_timeout: 10)
  end
  puts "Executing HTTP request..."
  puts http.request_get(uri.path).body
rescue Errno::ECONNREFUSED, Net::ReadTimeout => e
  if (retries += 1) <= 3
    puts "Timeout (#{e}), retrying in #{retries} second(s)..."
    sleep(retries)
    retry
  else
    raise
  end
ensure
  if http
    puts 'Closing the TCP connection...'
    http.finish
  end
end



##############

begin
  date_form = Date.strptime(date, "%m/%d/%Y")
rescue StandardError
  # Parse for other formats of date
  date_form = date.to_date
end
super(date_form)


###############


begin
  raise 'This exception will be rescued!'
rescue StandardError => e
  $stderr.puts e.message
end


#####################

require 'logger'

log = Logger.new(STDERR)
begin
  raise
rescue
  log.warn('file_name') { "line no." }
  exit false # Exits with "failure" code
end

#Output
=> W, [2022-08-17T17:45:29.515381 #42262]  WARN -- file_name: line no.

############

def destroy
  user = User.find_by(id: params[:id])
  return render json: { user: user, status: 200, message: "User deleted successfully" } if user.destroy

  render json: { user: user, status: 500, message: "User not deleted due to internal error" }
end


##################


require 'logger'

log = Logger.new(STDERR)
begin
  raise
rescue
  log.warn('file_name') { "line no." }
  exit false # Exits with "failure" code
end




#################

user_name = User.find_by(id: 1).name
unless user_name
  logger.error "Someone forgot to run db:populate!"
  user_name = "There"
end

puts "Hi #{user_name}"





{}.fetch(:nosuch) {|key| "No key #{key}"} # => "No key nosuch"






# with sideband data strategy noting the failures
def some_15_minutes_operation 
  array_new = Array.new
  hash_new = Hash.new
  return array_new, hash_new
end

result, status = some_15_minutes_operation



response_code = might_return_nil()
message = codes_to_messages[response_code]
response = "System Status: " + message
# What do you mean "Can’t convert nil into string"?!


response_code = might_return_nil() or raise "No response code"
# ...
# ...





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
