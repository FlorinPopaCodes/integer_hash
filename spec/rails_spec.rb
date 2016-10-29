require 'spec_helper'
require 'logger'

require 'active_record'

describe IntegerHash::Rails do
  before do
    ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')

    ActiveRecord::Schema.define do
      create_table :posts, force: true do |t|
      end

      create_table :comments, force: true do |t|
        t.integer :post_id
      end
    end

    class Post < ActiveRecord::Base
      has_many :comments
      encode_id
    end

    class Comment < ActiveRecord::Base
      belongs_to :post
    end

    IntegerHash.configure do |config|
      config.prime = 1580030173
      config.inverse_integer = 59260789
      config.random_integer = 1163945558
    end

    @post = Post.create
    @post2 = Post.create
    @comment = Comment.create
  end


  it 'encodes to the right ids' do
    expect(@post.to_param).to eq "458047115"
    expect(@comment.to_param).to eq "1"
  end

  it 'finds the right model' do
    expect(Post.find("458047115")).not_to be nil
    expect(Comment.find("1")).not_to be nil
  end

  it 'finds the right models' do
    expect(Post.find("458047115", "2033899500")).not_to be nil
    expect(Comment.find("1")).not_to be nil
  end

  it 'reloads with the right id' do
    post = Post.find("2033899500")
    expect(post.reload).to be post
  end

  it 'reloads and locks with the right id' do
    post = Post.find("2033899500")
    expect(post.reload(lock: true)).to be post
  end
end
