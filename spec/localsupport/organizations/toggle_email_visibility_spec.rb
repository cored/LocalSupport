require 'organizations/toggle_email_visibility'

describe Localsupport::Organizations::ToggleEmailVisibility, '.toggle' do 
  let(:organization) { double :organization } 

  it 'disable if enable email visbility' do 
    expect(organization).to receive(:toggle_email_visibility) 
    described_class.toggle(organization)
  end

end
