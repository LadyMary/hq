require 'spec_helper'

describe Office::OrderReason do
  describe 'обладает связями с другими моделями' do
    it 'с порядком' do
      should belong_to(:order)
    end
    
    it 'с причиной' do
      should belong_to(:reason)
    end
  end
end

