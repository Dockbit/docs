## Contributing to Dockbit Docs

First of all, thanks for taking the time to contribute to [Dockbit Docs](https://docs.dockbit.com) 🤗 While we're still working on the contributing guidelines, feel free to [open an issue](https://github.com/Dockbit/docs/issues/new) or submit a PR by following these steps:

Fork and clone this repository:

    git clone git@github.com:your-username/docs.git

Make your changes, preview and proofread them locally:

    open http://localhost:4567

Ensure that [Rake](../blob/master/Rakefile) checks are passing:

    bundle exec middleman build
    bundle exec rake test

Push to your fork and [submit a pull request](https://github.com/Dockbit/docs/compare/).

Thanks! 💜
