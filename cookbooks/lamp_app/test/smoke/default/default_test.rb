# # encoding: utf-8

# Inspec test for recipe lamp_app::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root') do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
describe port(80) do
  it { should be_listening }
  its(:protocols) { should include 'tcp' }
end

describe file('/var/www/default/public_html/index.php') do
  it { should exist }
  it { should be_owned_by 'root' }
  its(:content) { should match '<!DOCTYPE html>' }
end

describe command('curl localhost') do
  its(:stdout) { should match 'Gabriela' }
end







