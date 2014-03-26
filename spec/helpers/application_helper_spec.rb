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

  describe "time_ago helper" do
    it "renders time ago string properly" do
      output = time_ago(Time.now)
      expect(output).to eq("less than a minute ago")
    end
  end
end
