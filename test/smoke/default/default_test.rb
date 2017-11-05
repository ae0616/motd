# # encoding: utf-8

# Inspec test for recipe motd::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe file('/etc/motd') do
  it { should exist }
  it { should be_owned_by 'root' }
  its('group') { should eq 'root'}
  its('mode') { should cmp '00644' }
  its('content') { should match 'Welcome to Ardvark Unlimited' }
end

describe file('/etc/profile.d/motd.sh') do
  it { should exist }
  it { should be_owned_by 'root' }
  its('group') { should eq 'root'}
  its('mode') { should cmp '0755' }
  its('content') { should match 'cat /etc/motd'}
end

describe command('bash --login  -i -c "cd ~"') do
  its('stdout') { should match 'Welcome to Ardvark Unlimited'}
end
