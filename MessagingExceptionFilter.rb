#filename = 'C:\glassfish3\glassfish\domains\cis\logs\syslog.log'
#output = 'C:\glassfish3\glassfish\domains\cis\logs\filter.log'
output = 'C:\Users\Demo\Downloads\filter.log'
filename = 'C:\Users\Demo\Downloads\syslog.log'
messagingexception = false
more = false
File.open(filename, 'r') do |file|
  File.open(output, 'a') do |out|
    file.each_line do |line|
      if line =~ /MessagingException/
        messagingexception = true
      end
      if line =~ /19 more/
        more = true
      end
      if !messagingexception and !more
        out.puts line if !line.nil?
      elsif messagingexception and more
        messagingexception = more = false     
      end  
    end
  end
end