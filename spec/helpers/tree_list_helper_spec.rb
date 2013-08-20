require 'spec_helper'

module ClosureTreeHelper
  describe TreeListHelper do
    describe '#close_tag' do
      it { expect(helper.send(:close_tag, nil)).to eq(nil) }
      it { expect(helper.send(:close_tag, '')).to eq(nil) }
      it { expect(helper.send(:close_tag, '<li>')).to eq('</li>') }
      it { expect(helper.send(:close_tag, '<li class="test">')).to eq('</li>') }
    end
  end
end
