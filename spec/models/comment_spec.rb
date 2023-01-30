# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  # use build_stubbed instead of build since build does not create id.
  let(:user) { build_stubbed(:user) }
  let(:article) { build_stubbed(:article) }
  let(:comment) { build_stubbed(:comment, user: user, article: article) }

  # Data created in before is rolled back at the end of each example.
  before do
    login_as(user, scope: :user)
  end

  it 'is valid with valid attributes' do
    expect(comment).to be_valid
  end

  it 'is not valid without user id' do
    comment.user_id = nil
    expect(comment).to_not be_valid
  end

  it 'is not valid without article id' do
    comment.article_id = nil
    expect(comment).to_not be_valid
  end
end
