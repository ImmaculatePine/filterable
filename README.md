# Filterable

Adds filter functionality to your ActiveRecord models

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'filterable'
```

And then execute:

    $ bundle

## Usage

Include `Filterable` concern to the model you want to act as filterable:

    class Posts
      include Filterable
    end

Add scopes for each field that you want to filter by:

    class Posts
      # ...
      scope :name, -> (name) { where(name: name) }
      scope :author, -> (author) { where(author: author) }
      # ...
    end

Now you can use it in you controller like that:

    class PostsController
      def index
        @posts = Post.filter(
          params.slice(:name, :author)
        )
      end
    end

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ImmaculatePine/filterable. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## Thanks

I found [this article by Justin Weiss](http://www.justinweiss.com/articles/search-and-filter-rails-models-without-bloating-your-controller/) useful and decided to move it to a gem.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
