require 'spec_helper'

describe 'nginx' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "nginx class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('nginx::params') }
          it { is_expected.to contain_class('nginx::install').that_comes_before('nginx::config') }
          it { is_expected.to contain_class('nginx::config') }
          it { is_expected.to contain_class('nginx::service').that_subscribes_to('nginx::config') }

          it { is_expected.to contain_service('nginx') }
          it { is_expected.to contain_package('nginx').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'nginx class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('nginx') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
