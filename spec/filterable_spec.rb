require 'spec_helper'

class Dummy
  include Filterable
end

describe Filterable do
  it 'has a version number' do
    expect(Filterable::VERSION).not_to be nil
  end

  it 'adds a .filter method to class methods' do
    expect(Dummy).to respond_to(:filter)
  end
end
