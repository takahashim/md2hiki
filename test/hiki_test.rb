# coding: UTF-8
rootdir = File.dirname(File.dirname(__FILE__))
$LOAD_PATH.unshift "#{rootdir}/lib"

if defined? Encoding
  Encoding.default_internal = 'UTF-8'
end

require 'test/unit'
require 'redcarpet'
require 'redcarpet/render/hiki'

class HikiTest < Test::Unit::TestCase

  def setup
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::Hiki.new({}))
  end

  def render_with(flags, text)
    Redcarpet::Markdown.new(Redcarpet::Render::Hiki, flags).render(text)
  end

  def test_that_simple_one_liner_goes_to_review
    assert_respond_to @markdown, :render
    assert_equal "\n\nHello World.\n", @markdown.render("Hello World.")
  end

  def test_href
    assert_respond_to @markdown, :render
    assert_equal "\n\n[[example|http://exmaple.com]]\n", @markdown.render("[example](http://exmaple.com)\n")
  end

  def test_header
    assert_respond_to @markdown, :render
    assert_equal "\n! AAA\n\n\nBBB\n\n!! ccc\n\n\nddd\n", @markdown.render("#AAA\nBBB\n\n##ccc\n\nddd\n")
  end


end
