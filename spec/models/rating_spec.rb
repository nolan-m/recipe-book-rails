require 'spec_helper'

describe Rating do
  it { should belong_to :recipe }
  it { should validate_presence_of :score }
  it { should validate_presence_of :review }
  it { should ensure_length_of(:review).is_at_least(10).is_at_most(140) }
end
