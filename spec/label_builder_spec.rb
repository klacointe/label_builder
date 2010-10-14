require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
include ::ActionView::Helpers::FormHelper

describe "LabelBuilder" do
  it "should render label_tag given method name" do
    label_tag(
      "method_name"
    ).should == '<label for="method_name">Method name</label>'
  end
  it "should render label_tag given method name and text" do
    label_tag(
      "method_name", 
      "my_content"
    ).should == '<label for="method_name">my_content</label>'
  end
  it "should render label_tag given method name, text and prefix / suffix options" do
    label_tag(
      "method_name", 
      "my_content", 
      "suffix" => "SUFFIX", 
      :prefix => "PREFIX"
    ).should == '<label for="method_name">PREFIXmy_contentSUFFIX</label>'
  end
end
