require "spec"
require "../src/bargs"

describe Bargs do
  it "works with a simple long flag" do
    test_params = ["--save"]
    interface = Bargs::CLI.new test_params

    interface.flag "save" do |flag|
      flag.short = "s"
    end
    bargs = interface.process

    bargs.has?("save").should eq(true)
  end

  it "works with a simple long flag that requires an additional argument" do
    test_params = ["--save dev"]
    interface = Bargs::CLI.new test_params

    interface.flag "save" do |flag|
      flag.short = "s"
      flag.accepts_arg = true
    end
    bargs = interface.process

    bargs.has?("save").should eq(true)
    bargs.get("save").has_arg?.should eq(true)
    bargs.get("save").arg.should eq("dev")
  end
end
