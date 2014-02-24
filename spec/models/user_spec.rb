require 'spec_helper'

describe User do
  it 'recognizes an editor' do
    editor = create(:editor)
    expect(editor.editor?).to be(true)
    expect(editor.writer?).to be(true)
  end

  it 'recognizes a writer' do
    writer = create(:writer)
    expect(writer.editor?).to be(false)
    expect(writer.writer?).to be (true)
  end

  it 'does not recognize a regular user' do
    user = create(:user)
    expect(user.editor?).to be(false)
    expect(user.writer?).to be(false)
  end
end