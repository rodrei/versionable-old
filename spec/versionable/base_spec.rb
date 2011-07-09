require 'spec_helper'
require 'versionable_model'

describe VersionableModel do

  it 'should define the methods :version, :version=, raw_version, raw_version=' do
    subject.respond_to?(:version).should be_true
    subject.respond_to?(:version=).should be_true
    subject.respond_to?(:raw_version).should be_true
    subject.respond_to?(:raw_version=).should be_true
  end

  it 'should assign and retrieve values correctly' do
    subject.version = nil
    subject.version.should be_nil

    subject.version = '1.2.3'
    subject.version.should == '1.2.3'
    subject.raw_version.should == 0.001002003

    subject.version = '001.002.003'
    subject.version.should == '1.2.3'
    subject.raw_version.should == 0.001002003

  end
end

