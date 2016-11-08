require_relative '../spec_helper'

describe 'timezone_win' do
  let(:facts) {{
  }}
  let(:params) {{
    :timezone => 'Mountain Standard Time',
  }}
  it { should compile }
  
  it { should contain_exec('set-timezone').with(
    'command'  => "tzutil /s 'Mountain Standard Time'",
    'onlyif'   => "if ((Get-WmiObject -Class win32_timezone).StandardName -eq 'Mountain Standard Time') {exit 1}",
    'provider' => "powershell"
    )
  }
  
end