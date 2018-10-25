module ScriptCommandRunner

  def run command, failure_message = nil, continue_if_failed = true
    puts "Executing '#{command}' :"
    cmd = `#{command}`
    (stop failure_message.nil? ? cmd : failure_message) if !continue_if_failed && failed?
    puts cmd
    puts
    cmd
  end

  def failed?
    $?.exitstatus != 0
  end

  def stop failure_message
    puts failure_message
    puts 'Stopping the script'
    exit
  end

end

#####################################
include ScriptCommandRunner

run 'docker -v', 'Docker is not installed. Please install latest docker', false
run 'docker-machine create --driver virtualbox default'
run 'docker-machine start default' unless (run 'docker-machine status').match /Running/
run (run 'docker-machine env default').gsub(/eval\s*([^\n\r]*)/).first
run 'env | grep DOCKER'
server_ip = run 'docker-machine ip default'
run 'docker-compose build'
run 'docker-compose run app rake  db:create'
run 'docker-compose run app rake db:migrate'
run "lsof -i tcp:3000 | awk 'NR!=1 {print $2}' | xargs kill -9"
run 'rm -rf tmp/pids/server.pid'
puts %{Server address is going to be http://#{server_ip.chomp}:3000}
run 'docker-compose up'