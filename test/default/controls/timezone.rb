
temp = File.open('/etc/salt/grains').grep(/timezone/)
tz = temp[0].sub("timezone:", '')

control "timezone settings" do
  title "Verify timezone is is set"
  describe bash('timedatectl status ') do
    its('stdout') { should include tz.chomp() }
    its('stderr') { should eq '' }
    its('exit_status') { should eq 0 }
  end
end
