require 'spec_helper'

RSpec.describe Specie do
  describe 'find_by_key' do
    it 'find_by_key returns a valid instance' do
      expect(Specie.find_by_key(:dog)).to eq Specie.new(key: :dog, value: 'perros')
    end

    it 'find_by_key returns a nil if key does not exist' do
      expect(Specie.find_by_key(:foo)).to eq nil
    end
  end

  it 'find_by_key! raise an error if key does not exist' do
    expect { Specie.find_by_key!(:foo) }.to raise_error(ActiveRecord::RecordNotFound)
  end

  describe 'find_by_value' do
    it 'find_by_value returns a valid instance' do
      expect(Specie.find_by_value('mascotas')).to eq Specie.new(key: :pet, value: 'mascotas')
    end

    it 'find_by_value returns pet if value does not exist' do
      expect(Specie.find_by_value('foo')).to eq Specie.new(key: :pet, value: 'mascotas')
    end
  end

  it 'find_by_value! raise an error if value does not exist' do
    expect { Specie.find_by_value!('foo') }.to raise_error(ActiveRecord::RecordNotFound)
  end
end
