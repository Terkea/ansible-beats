describe 'Multi Tests' do

  describe service('filebeat') do
    it { should be_running }
  end

  describe package('filebeat') do
    it { should be_installed }
  end

  describe file('/etc/filebeat/filebeat.yml') do
    it { should be_file }
    it { should be_owned_by 'root' }
  end

  describe file('/etc/filebeat/filebeat.yml') do
    its('content') { should include 'filebeat:' }
    its('content') { should include 'logging:' }
    its('content') { should include 'output:' }
  end

  describe file('/etc/init.d/filebeat') do
    it { should exist }
  end

  describe service('metricbeat') do
    it { should be_running }
  end

  describe package('metricbeat') do
    it { should be_installed }
  end

  describe file('/etc/metricbeat/metricbeat.yml') do
    it { should be_file }
    it { should be_owned_by 'root' }
  end

  describe file('/etc/metricbeat/metricbeat.yml') do
    its('content') { should include 'module: system' }
    its('content') { should include 'metricsets:' }
    its('content') { should include 'period: 10s' }
    its('content') { should include 'processes:' }
    its('content') { should include 'cpu_ticks:' }
    its('content') { should include 'logging:' }
    its('content') { should include 'output:' }
  end

  describe file('/etc/init.d/metricbeat') do
    it { should exist }
  end


end

