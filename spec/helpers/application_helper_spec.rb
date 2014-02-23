require 'spec_helper'

describe ApplicationHelper do
  describe "render_markdown helper" do
    it "renders markdown to HTML" do
      output = render_markdown("**markdown**")
      expect(output).to include("<p><strong>markdown</strong></p>")
    end

    it "uses the same markdown renderer" do
      render_markdown("")
      first = @md
      render_markdown("")
      second = @md

      expect(first).to be(second)
    end
  end
end