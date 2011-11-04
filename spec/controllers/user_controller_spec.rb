require 'spec_helper'

describe UserController do
  render_views

  describe "GET 'login'" do
    it "returns http success" do
      get 'login'
      response.should be_success
    end

    it "should have the right title" do
      get 'login'
      response.should have_selector("title", :content => "Like Intersections | Login")
    end
  end

  describe "GET 'friends'" do
    it "returns http success" do
      get 'friends'
      response.should be_success
    end

    it "should have the right title" do
      get 'friends'
      response.should have_selector("title", :content => "Like Intersections | Friends")
    end
  end

  describe "GET 'likes'" do
    it "returns http success" do
      get 'likes'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'likes'
      response.should have_selector("title", :content => "Like Intersections | Likes")
    end
  end
end
