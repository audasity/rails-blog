# frozen_string_literal: true

require 'rails_helper'
# Model tests are placed within the spec/models directory such as this one
# Model specs must have "type: :model"
RSpec.describe Article, type: :model do
  # Data must be cleaned up in after hook.
  before do
    user = build(:user)
    login_as(user, scope: :user)
    @article = build(:article)
  end

  it 'is valid with valid attributes' do
    expect(@article).to be_valid
  end

  it 'is not valid without a title' do
    @article.title = nil
    expect(@article).to_not be_valid
  end

  it 'is not valid without user id' do
    @article.user_id = nil
    expect(@article).to_not be_valid
  end

  it 'is not valid if text is not 10 chars' do
    expect(@article.body.length).to be >= 10
  end
end
