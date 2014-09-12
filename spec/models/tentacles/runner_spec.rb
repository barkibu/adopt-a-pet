require 'spec_helper'
require_relative '../../../app/models/tentacles/runner'

RSpec.describe Tentacles::Runner do
  it 'gets data' do
    data = expect(subject.run)
    data.to be_instance_of String
    data.not_to eq ''
  end
end
