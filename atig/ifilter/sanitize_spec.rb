#! /opt/local/bin/ruby -w
# -*- mode:ruby; coding:utf-8 -*-

require 'atig/ifilter/sanitize'
require 'atig/twitter_struct'
require 'atig/spec_helper'

describe Atig::IFilter::Sanitize do
  def filtered(text)
    Atig::IFilter::Sanitize.call status(text)
  end

  it "should convert &lt; &gt;" do
    filtered("&lt; &gt;").should be_text("< >")
  end

  it "should convert whitespace" do
    filtered("\r\n").should be_text(" ")
    filtered("\r").should be_text(" ")
    filtered("\n").should be_text(" ")
  end

  it "should delete \\000\\001 sequence" do
    filtered("\000\001").should be_text("")
  end
end
