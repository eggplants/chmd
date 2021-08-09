# frozen_string_literal: true

RSpec.describe Chmd::Make do
  it 'has initializer' do
    expect(Chmd::Make.new).not_to be nil
  end

  it 'has an instance value: remote_url' do
    expect(Chmd::Make.new.remote_url).to eq 'https://github.com/eggplants/chmd'
  end

  it 'has an instance value: tags' do
    expect(Chmd::Make.new.tags).not_to be nil
  end

  it 'can make' do
    expect(Chmd::Make.new.make[0]).to eq '# Changelog'
  end
end
